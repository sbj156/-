package com.ketayao.ketacustom.shiro;

public class MobileCaptchaUsernamePasswordToken extends CaptchaUsernamePasswordToken {

	/**
	 * 增加手机验证码
	 */
	private static final long serialVersionUID = 7503444839480161064L;
	
	private boolean mobileLogin;

	public boolean isMobileLogin() {
		return mobileLogin;
	}

	public void setMobileLogin(boolean mobileLogin) {
		this.mobileLogin = mobileLogin;
	}

	public MobileCaptchaUsernamePasswordToken() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MobileCaptchaUsernamePasswordToken(String username, String password, boolean rememberMe, String host, String captcha, boolean mobileLogin) {
		super(username, password, rememberMe, host, captcha);
		this.mobileLogin = mobileLogin;
		// TODO Auto-generated constructor stub
	}
	
	
}
