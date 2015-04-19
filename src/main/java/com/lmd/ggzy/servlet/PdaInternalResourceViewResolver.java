package com.lmd.ggzy.servlet;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.util.HttpRequestDeviceUtils;
/**
 * 移动端视图解析器
 * @author mh
 *
 */
public class PdaInternalResourceViewResolver extends InternalResourceViewResolver {
	private static final Logger logger = LoggerFactory.getLogger(PdaInternalResourceViewResolver.class);
	
	@Autowired
	private GgzyBusinessTypeService businessTypeService;
	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		// TODO Auto-generated method stub
		boolean mobileDevice = HttpRequestDeviceUtils.isMobileDevice(DynamicSpecifications.getRequest());
		if(mobileDevice) {
			logger.info("resolver pdaview " + viewName);
			String businessTypeId = ServletRequestUtils.getStringParameter(DynamicSpecifications.getRequest(), "businessTypeId");
			View view;
			view = super.resolveViewName(viewName, locale);
			if(!StringUtils.isEmpty(businessTypeId) && view == null){
				GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(businessTypeId);
				Assert.notNull(businessType);
				
				String businessViewName = StringUtils.replace(viewName, "/" + businessType.getCode().toLowerCase() + "/", "/");
				view = super.resolveViewName(businessViewName, locale);
				if(view != null)
					return view;
			}
			return view;
		}else
			return null;
		
	}
	
	
}
