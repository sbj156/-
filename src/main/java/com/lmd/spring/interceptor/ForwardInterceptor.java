package com.lmd.spring.interceptor;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 如果request中存在param nv_ 则跳转到nv_
 * 
 * @author mh_cxp
 *
 */
public class ForwardInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		String nv_ = getParameter(request, "nv_");
		if (StringUtils.hasText(nv_) && modelAndView != null)
			modelAndView.setViewName(nv_);
		request.setAttribute("sysdate_", new Date());
		super.postHandle(request, response, handler, modelAndView);
	}
	
	public String getParameter(HttpServletRequest request, String name){
		String nv_ = request.getParameter("nv_");
		if(nv_ != null) return nv_;
		Map<String, String> queryMap = getQueryMap(request);
		return queryMap.get(name);
	}
	
	private Map<String, String> getQueryMap(HttpServletRequest request){
		Map<String, String> queryMap = new HashMap<String, String>();
		String queryString = request.getQueryString();
		if(StringUtils.hasLength(queryString)){
			if(StringUtils.hasLength(queryString)){
				String[] params = queryString.split("&");
				for(String para : params){
					int eqIndex = para.indexOf("=");
					if(eqIndex > 0){
						queryMap.put(para.substring(0, eqIndex), para.substring(eqIndex + 1));
					}
				}
			}
		}
		
		return queryMap;
	}

}
