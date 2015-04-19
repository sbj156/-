package com.lmd.spring.bind;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.ketayao.ketacustom.util.dwz.Page;

public class PageResolver implements WebArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {
		
		if(Page.class.isAssignableFrom(methodParameter.getClass())){
		}
//		webRequest.getParameter(paramName)
		// TODO Auto-generated method stub
		return WebArgumentResolver.UNRESOLVED;
	}

}
