package com.lmd.ggzy.sms;

import java.util.HashMap;
import java.util.Set;

import com.cloopen.rest.sdk.CCPRestSmsSDK;

/**
 * 云通讯短信平台
 * www.yuntongxun.com
 * @author mh_cxp
 *
 */
public class CCPSmsService implements SmsService {

	private static final String DEFAULT_TEMPLATE_ID = "1";
	private String serverIp;
	
	private String serverPort;
	
	private String accountSid;
	
	private String accountToken;
	
	private String appId;
	
	private String templateId = DEFAULT_TEMPLATE_ID;
	
	private CCPRestSmsSDK restAPI ;
	
	public void init(){
		restAPI = new CCPRestSmsSDK();
		restAPI.init(serverIp, serverPort);
		restAPI.setAccount(accountSid, accountToken);
		restAPI.setAppId(appId);
	}
	public CCPSmsService(String serverIp, String serverPort, String accountSid, String accountToken, String appId, String templateId) {
		super();
		this.serverIp = serverIp;
		this.serverPort = serverPort;
		this.accountSid = accountSid;
		this.accountToken = accountToken;
		this.appId = appId;
		this.templateId = templateId;
	}


	public CCPSmsService(String serverIp, String serverPort, String accountSid, String accountToken, String appId) {
		super();
		this.serverIp = serverIp;
		this.serverPort = serverPort;
		this.accountSid = accountSid;
		this.accountToken = accountToken;
		this.appId = appId;
	}


	@Override
	public boolean sendCaptcha(String phone, String captcha) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> result = restAPI.sendTemplateSMS(phone,templateId ,new String[]{captcha,"5"});
		if("000000".equals(result.get("statusCode"))){
			//正常返回输出data包体信息（map）
			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
			Set<String> keySet = data.keySet();
			for(String key:keySet){
				Object object = data.get(key);
				System.out.println(key +" = "+object);
			}
			return true;
		}else{
			//异常返回输出错误码和错误信息
			System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
		}
		return false;
	}


	public String getTemplateId() {
		return templateId;
	}


	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	
}
