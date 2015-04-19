/**
 * There are <a href="https://github.com/ketayao/keta-custom">keta-custom</a> code generation
 */
package com.lmd.ggzy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ketayao.ketacustom.exception.ServiceException;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.util.persistence.SearchFilter;
import com.ketayao.ketacustom.util.persistence.SearchFilter.Operator;
import com.lmd.ggzy.domain.GgzyTreeLib;
import com.lmd.ggzy.service.GgzyTreeLibService;
@Controller
@RequestMapping("/business/treelib")
public class GgzyTreeLibController {
	/**
	 * @uml.property  name="ggzyAreaService"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyTreeLibService ggzyAreaService;
	
	
	
	private static final String CREATE = "treelib/create";
	private static final String UPDATE = "treelib/update";
	private static final String LIST = "treelib/list";
	private static final String TREE = "treelib/tree";
	private static final String TREE_LIST = "treelib/tree_list";
	/*
	private static final String LOOK_UP_ROLE = "area/assign_ggzyArea_role";
	private static final String LOOK_ggzyArea_ROLE = "area/delete_ggzyArea_role";*/
	
	private static final String LOOKUP_PARENT = "treelib/lookup_parent";
	
	@RequiresPermissions("ggzyArea:save")
	@RequestMapping(value="/create/{parentggzyAreaId}", method=RequestMethod.GET)
	public String preCreate(@PathVariable Long parentggzyAreaId, Map<String, Object> map) {
		map.put("parentggzyAreaId", parentggzyAreaId);
		return CREATE;
	}
	
	@Log(message="添加了{0}组织。")
	@RequiresPermissions("ggzyArea:save")
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody String create(@Valid GgzyTreeLib ggzyArea) {
		try {
			ggzyAreaService.saveOrUpdate(ggzyArea);
		} catch (ServiceException e) {
			return AjaxObject.newError("添加失败：" + e.getMessage()).toString();
		}
//		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{ggzyArea.getName()}));
		return AjaxObject.newOk("添加成功！").toString();
	}
	
	@ModelAttribute("preloadOrg")
	public GgzyTreeLib preload(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			GgzyTreeLib ggzyArea = ggzyAreaService.get(id);
			ggzyArea.setParent(null);
			return ggzyArea;
		}
		return null;
	}
	
	@RequiresPermissions("ggzyArea:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		GgzyTreeLib ggzyArea = ggzyAreaService.get(id);
		
		map.put("ggzyArea", ggzyArea);
		return UPDATE;
	}
	
	@Log(message="修改了{0}组织的信息。")
	@RequiresPermissions("ggzyArea:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(@Valid @ModelAttribute("preloadOrg")GgzyTreeLib ggzyArea) {
		ggzyAreaService.saveOrUpdate(ggzyArea);
		
//		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{ggzyArea.getName()}));
		return AjaxObject.newOk("修改成功！").toString();
	}
	
	@Log(message="删除了{0}组织。")
	@RequiresPermissions("ggzyArea:delete")
	@RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody String delete(@PathVariable Long id) {
		GgzyTreeLib ggzyArea = ggzyAreaService.get(id);
		try {
			ggzyAreaService.delete(id);
		} catch (ServiceException e) {
			return AjaxObject.newError("删除失败：" + e.getMessage()).setCallbackType("").toString();
		}
		
//		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{ggzyArea.getName()}));
		return AjaxObject.newOk("删除成功！").setCallbackType("").toString();
	}
	
	@RequiresPermissions("ggzyArea:view")
	@RequestMapping(value="/tree_list", method={RequestMethod.GET, RequestMethod.POST})
	public String tree_list(Map<String, Object> map ,@RequestParam Long rootId) {
		map.put("rootId", rootId);
		return TREE_LIST;
	}
	
	@RequiresPermissions("ggzyArea:view")
	@RequestMapping(value="/tree/{ggzyAreaId}", method={RequestMethod.GET, RequestMethod.POST})
	public String tree(Map<String, Object> map, @PathVariable Long ggzyAreaId) {
		GgzyTreeLib ggzyArea = ggzyAreaService.getTree(ggzyAreaId);
		map.put("ggzyArea", ggzyArea);
//		map.put("rootId", rootId);
		return TREE;
	}
	
	@RequiresPermissions("ggzyArea:view")
	@RequestMapping(value="/list/{parentggzyAreaId}", method={RequestMethod.GET, RequestMethod.POST})
	public String list(ServletRequest request, Page page, @PathVariable Long parentggzyAreaId, 
			Map<String, Object> map) {
		Specification<GgzyTreeLib> specification = DynamicSpecifications.bySearchFilter(request, GgzyTreeLib.class,
				new SearchFilter("parent.id", Operator.EQ, parentggzyAreaId));
		List<GgzyTreeLib> ggzyAreas = ggzyAreaService.findByExample(specification, page);
		
		map.put("page", page);
		map.put("ggzyAreas", ggzyAreas);
		map.put("parentggzyAreaId", parentggzyAreaId);

		return LIST;
	}
	
	
	@RequestMapping(value="/lookupParent/{id}", method={RequestMethod.GET})
	public String lookup(@PathVariable Long id, Map<String, Object> map, @RequestParam Long rootId) {
		GgzyTreeLib ggzyArea  = ggzyAreaService.getTree(rootId);
		
		map.put("ggzyArea", ggzyArea);
		return LOOKUP_PARENT;
	}
	
	@RequestMapping(value="/lookupAll/{id}", method={RequestMethod.GET})
	public String lookupAll(@PathVariable Long id, Map<String, Object> map, @RequestParam Long rootId) {
		GgzyTreeLib ggzyArea  = ggzyAreaService.getTree(rootId);
		
		map.put("ggzyArea", ggzyArea);
		return LOOKUP_PARENT;
	}
}
