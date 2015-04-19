package com.lmd.ggzy.sms;

public interface SmsService {

	/**
	 * 发送手机验证码
	 * @param phone
	 * @param captcha
	 * @return
	 */
	public boolean sendCaptcha(String phone, String captcha);
}
