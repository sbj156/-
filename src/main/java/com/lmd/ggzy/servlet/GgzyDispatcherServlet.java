package com.lmd.ggzy.servlet;

import java.io.File;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.View;

import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.util.HttpRequestDeviceUtils;

public class GgzyDispatcherServlet extends DispatcherServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 432609328651552127L;
	
	private static final String MOBILE_SUFFIX = "";

	private GgzyBusinessTypeService businessTypeService;
	
	@Override
	protected void initStrategies(ApplicationContext context) {
		// TODO Auto-generated method stub
		super.initStrategies(context);
		businessTypeService = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext()).getBean(GgzyBusinessTypeService.class);
		Assert.notNull(businessTypeService);
	}


	/**
	 * 根据业务类型查找是否存在业务类型指定页面,如果没有使用默认页面
	 */
	@Override
	protected View resolveViewName(String viewName, Map<String, Object> model, Locale locale, HttpServletRequest request) throws Exception {
		String businessTypeId = ServletRequestUtils.getStringParameter(request, "businessTypeId");
		View view;
		if(!StringUtils.isEmpty(businessTypeId)){
			GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(businessTypeId);
			Assert.notNull(businessType);
			request.setAttribute("businessType", businessType);
			String businessViewName ;
			int flag = viewName.lastIndexOf("/");
			if(flag > 0){
				businessViewName = viewName.substring(0, flag) + "/" + businessType.getCode().toLowerCase().trim() + viewName.substring(flag);
			}else{
				businessViewName = businessType.getCode().toLowerCase() + "/" + viewName;
			}
			view = super.resolveViewName(businessViewName, model, locale, request);
			if(view != null)
				return view;
		}
		view  = super.resolveViewName(viewName, model, locale, request);
		return view;
	}
	
	private View resolveView(String viewName, Map<String, Object> model, Locale locale, HttpServletRequest request) throws Exception{
		View view = null;
		if(HttpRequestDeviceUtils.isMobileDevice(request))
			view = super.resolveViewName(viewName + "", model, locale, request);	
		return null;
	}
	
}
