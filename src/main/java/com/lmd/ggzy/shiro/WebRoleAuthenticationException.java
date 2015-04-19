package com.lmd.ggzy.shiro;

import org.apache.shiro.authc.AuthenticationException;

public class WebRoleAuthenticationException extends AuthenticationException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4987845459957464203L;

	public WebRoleAuthenticationException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WebRoleAuthenticationException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public WebRoleAuthenticationException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public WebRoleAuthenticationException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
