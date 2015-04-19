/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.log.LogInterceptor.java
 * Class:			LogInterceptor
 * Date:			2013-5-3
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.log.spring;

import java.lang.reflect.Method;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ketayao.ketacustom.entity.main.LogInfo;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogAPI;
import com.ketayao.ketacustom.log.LogLevel;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.shiro.ShiroUser;
import com.ketayao.utils.Exceptions;
import com.ketayao.utils.SecurityUtils;

import flexjson.JSONSerializer;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.1.0
 * @since   2013-5-3 下午4:37:11 
 */

public class LogInterceptor extends HandlerInterceptorAdapter {
	private final static Logger LOGGER = LoggerFactory.getLogger(LogInterceptor.class); 
	
	/**
	 * @uml.property  name="logAll"
	 */
	private boolean logAll;
	
	/**
	 * @uml.property  name="logAPI"
	 * @uml.associationEnd  
	 */
	private LogAPI logAPI;
	
	/**   
	 * 将request存入LogUitl中的LOCAL_REQUEST。
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 * @throws Exception  
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)  
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		LogUitls.putRequest(request);
		return true;
	}

	@Override
	public void postHandle(final HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (!(handler instanceof HandlerMethod)) {
			return ;
		}
		
		final HandlerMethod handlerMethod = (HandlerMethod)handler;
		Method method = handlerMethod.getMethod();
		
		final Log log = method.getAnnotation(Log.class);
		if(!logAll && log == null)return;
//		if (log != null) {
			// 得到LogMessageObject
			final LogMessageObject logMessageObject = LogUitls.getArgs();
			// 另起线程异步操作
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					LogInfo info = new LogInfo();
					try {
						LogLevel lastLogLevel = logAPI.getRootLogLevel();
						
						// 先对自定义包等级做判断
						Map<String, LogLevel> customLogLevel = logAPI.getCustomLogLevel();
						if (!customLogLevel.isEmpty()) {
							Class<?> clazz = handlerMethod.getBean().getClass();
							String packageName = clazz.getPackage().getName();
							
							Set<String> keys = customLogLevel.keySet();
							for (String key : keys) {
								if (packageName.startsWith(key)) {
									lastLogLevel = customLogLevel.get(key);
									break;
								}
							}
						}
						
						LogMessageObject defaultLogMessageObject = logMessageObject;
						if (defaultLogMessageObject == null) {
							defaultLogMessageObject = LogMessageObject.newWrite(); 
						}
						info.setLogLevel(lastLogLevel);
						if(log != null && log.message() != null){
							MessageFormat mFormat = new MessageFormat(log.message());
							String result = mFormat.format(defaultLogMessageObject.getObjects());
							info.setMessage(result);
						}
						ShiroUser user = SecurityUtils.getShiroUser();
						info.setCreateTime(new Date());
						info.setUsername(user.getLoginName());
						info.setHandlerClass(handlerMethod.getBeanType().getName());
						info.setHandlerMethod(handlerMethod.getMethod().getName());
						info.setIpAddress(user.getIpAddress());
						info.setRequest(new JSONSerializer().deepSerialize(request.getParameterMap()));
						if (defaultLogMessageObject.isWritten()) { // 判断是否写入log
							// 覆盖，直接写入日志
							if (log == null || log.override() || (!log.override() && log.level().compareTo(lastLogLevel) >= 0 )) {
//								logAPI.log(log.message(), defaultLogMessageObject.getObjects(), log.level());
								logAPI.log(info);
							} 
						}						
					} catch (Exception e) {
						LOGGER.error(Exceptions.getStackTraceAsString(e));
					} 
				}
			}).start();
			
//		}
		
	}
	
	/**
	 * 清除LogUitl中的LOCAL_REQUEST。
	 * @param request
	 * @param response
	 * @param handler
	 * @param ex
	 * @throws Exception  
	 * @see org.springframework.web.servlet.handler.HandlerInterceptorAdapter#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)  
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		LogUitls.removeRequest();
	}

	/**
	 * @param logAPI
	 * @uml.property  name="logAPI"
	 */
	public void setLogAPI(LogAPI logAPI) {
		this.logAPI = logAPI;
	}

	/**
	 * @param logAll
	 * @uml.property  name="logAll"
	 */
	public void setLogAll(boolean logAll) {
		this.logAll = logAll;
	}
	
	
}
