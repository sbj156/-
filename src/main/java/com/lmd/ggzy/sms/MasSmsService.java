package com.lmd.ggzy.sms;

import org.slf4j.LoggerFactory;

import com.jasson.im.api.APIClient;

/**
 * 济南市信息中心提供, 移动代理服务器 MAS
 * 
 * @author mh_cxp
 * 
 */
public class MasSmsService implements SmsService {

	private static final String SERVIER_DESC = "济南信息中心短信平台";

	private static final org.slf4j.Logger log = LoggerFactory.getLogger(MasSmsService.class);

	private APIClient apiClient = new APIClient();
	/**
	 * 短信模板
	 */
	private String msgTemplate;
	/**
	 * 移动代理服务器的 IP 地址
	 */
	private String imIP;

	/**
	 * 接口创建时的接口登录名
	 */
	private String loginName;

	/**
	 * 接口创建时的接口登录密码
	 */
	private String loginPWD;

	/**
	 * 接口编码
	 */
	private String apiCode;

	/**
	 * 数据库名称
	 */
	private String dbName;

	/**
	 * 接口初始化
	 */
	private int init() {
		return apiClient.init(imIP, loginName, loginPWD, apiCode, dbName);
	}

	@Override
	public boolean sendCaptcha(String phone, String captcha) {
		// TODO Auto-generated method stub
		if (init() != APIClient.IMAPI_SUCC) {
			log.info(SERVIER_DESC + "初始化失败...");
			return false;
		}
		String msg = msgTemplate.replace("msg", captcha);
		if (apiClient.sendSM(phone, msg, 0) != APIClient.IMAPI_SUCC) {
			log.info(SERVIER_DESC + "发送短信失败:" + msg);
		}
		apiClient.release();
		return true;
	}

	public String getMsgTemplate() {
		return msgTemplate;
	}

	public void setMsgTemplate(String msgTemplate) {
		this.msgTemplate = msgTemplate;
	}

	public String getImIP() {
		return imIP;
	}

	public void setImIP(String imIP) {
		this.imIP = imIP;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPWD() {
		return loginPWD;
	}

	public void setLoginPWD(String loginPWD) {
		this.loginPWD = loginPWD;
	}

	public String getApiCode() {
		return apiCode;
	}

	public void setApiCode(String apiCode) {
		this.apiCode = apiCode;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	
}
