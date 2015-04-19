package com.lmd.ggzy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Application {

	/**
	 * 交易平台识别码
	 * @uml.property  name="platform_code"
	 */
	@Value("${platform_code}")
	private String platform_code;

	/**
	 * @return
	 * @uml.property  name="platform_code"
	 */
	public String getPlatform_code() {
		return platform_code;
	}

	/**
	 * @param platform_code
	 * @uml.property  name="platform_code"
	 */
	public void setPlatform_code(String platform_code) {
		this.platform_code = platform_code;
	}
	
}
