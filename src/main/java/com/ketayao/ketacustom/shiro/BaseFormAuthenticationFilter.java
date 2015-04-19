/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.shiro.BaseFormAuthenticationFilter.java
 * Class:			BaseFormAuthenticationFilter
 * Date:			2012-10-29
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lmd.util.IPUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ketayao.ketacustom.SecurityConstants;
import com.ketayao.utils.Exceptions;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  1.1.0
 * @since   2012-10-29 上午9:37:02 
 */

public class BaseFormAuthenticationFilter extends FormAuthenticationFilter {
	private static final Logger log = LoggerFactory.getLogger(BaseFormAuthenticationFilter.class);
	public static final String DEFAULT_ERROR_MESSAGE_KEY_PARAM_NAME = "DEFAULT_ERROR_MESSAGE";
	/*
	 * 覆盖默认实现，打印日志便于调试，查看具体登录是什么错误。
	 *（可以扩展把错误写入数据库之类的。）
	 * (non-Javadoc)
	 * @see org.apache.shiro.web.filter.authc.FormAuthenticationFilter#onLoginFailure(org.apache.shiro.authc.AuthenticationToken, org.apache.shiro.authc.AuthenticationException, javax.servlet.ServletRequest, javax.servlet.ServletResponse)
	 */
	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
			AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		request.setAttribute(DEFAULT_ERROR_MESSAGE_KEY_PARAM_NAME, e.getMessage());
		if (log.isDebugEnabled()) {
			Class<?> clazz = e.getClass();
			if (clazz.equals(AuthenticationException.class)) {
				log.debug(Exceptions.getStackTraceAsString(e));
			}
		}
		
		return super.onLoginFailure(token, e, request, response);
	}
	
	/**
	 * 覆盖isAccessAllowed，改变shiro的验证逻辑。
	 * 避免不能多次登录的错误。
	 * @param request
	 * @param response
	 * @param mappedValue
	 * @return  
	 * @see org.apache.shiro.web.filter.authc.AuthenticatingFilter#isAccessAllowed(javax.servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)
	 */
    @Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		try {
			// 先判断是否是登录操作
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return false;
			}
		} catch (Exception e) {
			log.error(Exceptions.getStackTraceAsString(e));
		}

		return super.isAccessAllowed(request, response, mappedValue);
	}
    
	/**
	 * 覆盖默认实现，用sendRedirect直接跳出框架，以免造成js框架重复加载js出错。
	 * @param token
	 * @param subject
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception  
	 * @see org.apache.shiro.web.filter.authc.FormAuthenticationFilter#onLoginSuccess(org.apache.shiro.authc.AuthenticationToken, org.apache.shiro.subject.Subject, javax.servlet.ServletRequest, javax.servlet.ServletResponse)
	 */
	@Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject,
            ServletRequest request, ServletResponse response) throws Exception {
		//issueSuccessRedirect(request, response);
		//we handled the success redirect directly, prevent the chain from continuing:
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		
		ShiroUser shiroUser = (ShiroUser)subject.getPrincipal();
		// 加入ipAddress
		shiroUser.setIpAddress(IPUtil.getIpAddr(httpServletRequest));
		
		// 这个是放入user还是shiroUser呢？
		httpServletRequest.getSession().setAttribute(SecurityConstants.LOGIN_USER, shiroUser.getUser());
		
		if (!"XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With")) 
				|| request.getParameter("ajax") == null) {// 不是ajax请求
			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + this.getSuccessUrl());
		} else {
			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login/timeout/success");
		}
		
		return false;
	}
}
