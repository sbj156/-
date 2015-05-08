/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.controller.IndexController.java
 * Class:			IndexController
 * Date:			2012-8-2
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/

package com.ketayao.ketacustom.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.lmd.util.IPUtil;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.SecurityConstants;
import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.service.ModuleService;
import com.ketayao.ketacustom.service.UserService;
import com.ketayao.ketacustom.shiro.ShiroUser;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.utils.SecurityUtils;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyBusinessType.VirtualSpecification;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.util.CollectionUtil;
import com.lmd.util.CollectionUtil.Comparator;
import com.lmd.util.HttpRequestDeviceUtils;
import com.lmd.util.UrlUtil;

/**
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> Version 1.1.0
 * @since 2012-8-2 下午5:45:57
 */
@Controller
@RequestMapping("/management/index")
public class IndexController {

	@Autowired
	private UserService userService;

	@Autowired
	private ModuleService moduleService;

	@Autowired
	private GgzyBusinessTypeService businessTypeService;

	private static final String INDEX = "management/index/index";
	private static final String UPDATE_PASSWORD = "management/index/updatePwd";
	private static final String UPDATE_BASE = "management/index/updateBase";

	@Log(message = "{0}登录了系统。")
	@RequiresUser
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Map<String, Object> map, @RequestParam(required = false, value = "moduleId") Long moduleId) {
		ShiroUser shiroUser = SecurityUtils.getShiroUser();
		User user = shiroUser.getUser();
        WebUtils.setSessionAttribute(request, SecurityConstants.LOGIN_USER, user);
        /**
         *对代理机构主管部门外网电脑端登录时按移动设备处理
         */

		Module menuModule = getMenuModule(SecurityUtils.getSubject(), moduleId,(HttpRequestDeviceUtils.isMobileDevice
                (request) || org.apache.shiro.SecurityUtils.getSubject().hasRole("web") && !IPUtil.isInnerIP(request)
        )? 2 : 1);
		map.put("menuModule", menuModule);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[] { shiroUser.getLoginName() }));
		return INDEX;
	}

    /**
     * 根据访问设备类读取功能节点
     * @param subject
     * @param moduleId
     * @param device
     * @return
     */
	private Module getMenuModule(Subject subject, Long moduleId, int device) {
		Module rootModule;
		if (moduleId == null)
			rootModule = moduleService.getTree();
		else
			rootModule = moduleService.get(moduleId);
		checkWithBusinessTypes(rootModule, subject, businessTypeService.findByExample(new VirtualSpecification(false)), device);
		return rootModule;
	}

	private void checkWithBusinessTypes(Module module, Subject subject, List<GgzyBusinessType> businessTypes, int device) {
		List<Module> list1 = new ArrayList<Module>();
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        int netFlag = IPUtil.isDomainReuest(request) || !IPUtil.isInnerIP(request)? 2:1;
        for (Module m1 : module.getChildren()) {
			// 只加入拥有show权限的Module
			if (subject.isPermitted(m1.getSn() + ":" + Permission.PERMISSION_SHOW)) {
				if (((m1.getShowDevice() & device) == device ) || subject
                        .hasRole
                                ("管理员") ) {
                    if((SecurityUtils.getSubject().hasRole("web") && ((m1.getShowNet() & netFlag) != netFlag)))
                        continue;
					checkWithBusinessTypes(m1, subject, businessTypes,  device);
					list1.add(m1);
				}
			}
		}
		if (module.isBusinessModule() && CollectionUtil.isEmpty(module.getChildren())) {
			for (GgzyBusinessType businessType : businessTypes) {
				if (subject.isPermitted(module.getSn() + ":" + businessType.getCode())) {

					Module m = new Module();
					m.setName(businessType.getName() + "-" + module.getName());
					m.setUrl(UrlUtil.appendParams(module.getUrl(), "businessTypeId=" + businessType.getBusinessTypeId()));
					m.setShowParent(false);
					m.setParameters(module.getParameters());
					m.setJsonParam(module.isJsonParam());
					m.setSn(module.getSn() + "_" + businessType.getCode().toLowerCase());
					m.setId(businessTypes.hashCode() + 0l);
					if (businessType.getParent() == null) {
						m.setParent(module);
						list1.add(m);
					} else {
						Module parent = createParentModule(list1, module, businessType);
						parent.getChildren().add(m);
						m.setParent(parent);
					}
				}
			}
			module.setUrl("#");
		}
		module.setChildren(list1);
	}

	private Module createParentModule(List<Module> list, Module module, GgzyBusinessType businessType) {
		Module parent = null;
		/*if (businessType.getParent() != null) {
			parent = CollectionUtil.find(list, businessType.getParent().getCode(), new Comparator<Module, String>() {
				@Override
				public boolean equals(Module t, String m) {
					// TODO Auto-generated method stub
					return t.getSn().equals(m);
				}
			});
			if (parent == null) {
				if (businessType.getParent() != null) {
					Module pparent = createParentModule(list, module, businessType.getParent());
					parent = CollectionUtil.find(pparent.getChildren(), businessType.getParent().getCode(), new Comparator<Module, String>() {
						@Override
						public boolean equals(Module t, String m) {
							// TODO Auto-generated method stub
							return t.getSn().equals(m);
						}
					});
				}
				if (parent == null) {
					parent = new Module();
					parent.setName(businessType.getParent().getName());
					parent.setUrl("#");
					parent.setSn(businessType.getParent().getCode());
					parent.setChildren(new ArrayList<Module>());
					pparent.getChildren().add(parent);
					parent.setParent(pparent);
				}
			}

		}*/
		List<GgzyBusinessType> businessTypes = new ArrayList<GgzyBusinessType>();
		addBT(businessTypes, businessType.getParent());
		parent = CollectionUtil.find(list, businessTypes.get(0).hashCode() + 0l, new Comparator<Module, Long>() {
			@Override
			public boolean equals(Module t, Long m) {
				// TODO Auto-generated method stub
				return t.getId().equals(m);
			}
		});
		if (parent == null) {
			parent = new Module();
			parent.setName(businessTypes.get(0).getName());
			parent.setUrl("#");
			parent.setSn(module.getSn());
			parent.setChildren(new ArrayList<Module>());
			parent.setId(businessTypes.get(0).hashCode() + 0l);
			list.add(parent);
			parent.setParent(module);
		}
		
		for(int i = 1; i < businessTypes.size(); i++){
			Module p = CollectionUtil.find(parent.getChildren(), businessTypes.get(i).hashCode() + 0l, new Comparator<Module, Long>() {
				@Override
				public boolean equals(Module t, Long m) {
					// TODO Auto-generated method stub
					return t.getId().equals(m);
				}
			});
			if(p == null){
				p = new Module();
				p.setName(businessTypes.get(i).getName());
				p.setUrl("#");
				p.setSn(businessTypes.get(i).getCode());
				p.setChildren(new ArrayList<Module>());
				parent.getChildren().add(parent);
				p.setParent(parent);
				parent = p;
			}
		}
		
		return parent;
	}
	private void addBT(List<GgzyBusinessType> businessTypes, GgzyBusinessType businessType){
		if(businessType.getParent() != null){
			businessTypes.add(businessType.getParent());
		}
		businessTypes.add(businessType);
	}
	private void check(Module module, Subject subject) {
		List<Module> list1 = new ArrayList<Module>();
		for (Module m1 : module.getChildren()) {
			// 只加入拥有show权限的Module
			if (subject.isPermitted(m1.getSn() + ":" + Permission.PERMISSION_SHOW)) {
				check(m1, subject);
				list1.add(m1);
			}
		}
		module.setChildren(list1);
	}

	@RequiresUser
	@RequestMapping(value = "/updatePwd", method = RequestMethod.GET)
	public String preUpdatePassword() {
		return UPDATE_PASSWORD;
	}

	@Log(message = "{0}修改了密码。")
	@RequiresUser
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public @ResponseBody
	String updatePassword(ServletRequest request, String plainPassword, String newPassword, String rPassword) {
		User user = SecurityUtils.getLoginUser();

		if (newPassword != null && newPassword.equals(rPassword)) {
			user.setPlainPassword(plainPassword);
			try {
				userService.updatePwd(user, newPassword);
			} catch (ServiceException e) {
				LogUitls.putArgs(LogMessageObject.newIgnore());// 忽略日志
				return AjaxObject.newError(e.getMessage()).setCallbackType("").toString();
			}
			LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[] { user.getUsername() }));
			return AjaxObject.newOk("修改密码成功！").toString();
		}

		return AjaxObject.newError("修改密码失败！").setCallbackType("").toString();
	}

	@RequiresUser
	@RequestMapping(value = "/updateBase", method = RequestMethod.GET)
	public String preUpdateBase(Map<String, Object> map) {
		map.put(SecurityConstants.LOGIN_USER, SecurityUtils.getLoginUser());
		return UPDATE_BASE;
	}

	@Log(message = "{0}修改了详细信息。")
	@RequiresUser
	@RequestMapping(value = "/updateBase", method = RequestMethod.POST)
	public @ResponseBody
	String updateBase(User user, ServletRequest request) {
		User loginUser = SecurityUtils.getLoginUser();

		loginUser.setPhone(user.getPhone());
		loginUser.setEmail(user.getEmail());

		userService.saveOrUpdate(loginUser);

		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[] { user.getUsername() }));
		return AjaxObject.newOk("修改详细信息成功！").toString();
	}
}
