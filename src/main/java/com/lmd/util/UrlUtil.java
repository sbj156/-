package com.lmd.util;

public class UrlUtil {
	/**
	 * url添加链接参数
	 * @param url
	 * @param params
	 * @return
	 */
	public static String appendParams(String url, String params) {
		/**
		 * 判断url中是否包含?
		 */
		if(url.endsWith("#")){
			return url;
		}else if (url.indexOf("?") > 0) {
			if (url.length() > url.indexOf("?"))
				url += "&";
		} else
			url += "?";
		url += params;
		return url;
	}

}
