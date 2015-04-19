package com.lmd.spring.converter;

import java.io.Reader;
import java.sql.Clob;

public class ConvertUtil {

	public static String convertClob2String(Clob clob){
		if (clob == null)
			return "";

		StringBuffer sb = new StringBuffer(65535);// 64K
		Reader clobStream = null;
		try {
			clobStream = clob.getCharacterStream();
			char[] b = new char[60000];// 每次获取60K
			int i = 0;
			while ((i = clobStream.read(b)) != -1) {
				sb.append(b, 0, i);
			}
		} catch (Exception ex) {
			sb = null;
		} finally {
			try {
				if (clobStream != null) {
					clobStream.close();
				}
			} catch (Exception e) {
			}
		}
		if (sb == null)
			return "";
		else
			return sb.toString();
	}
	
	public static Clob convertString2Clob(String source){
		if (null == source)
			return null;
		else {
			try {
				java.sql.Clob c = new javax.sql.rowset.serial.SerialClob(
						source.toCharArray());
				return c;
			} catch (Exception e) {
				return null;
			}
		}
	}
	
	public static String auditStatus(int status){
		String status_ = "未审核";
		if(status == 2)
			status_ = "审核通过";
		else if(status == 1)
			status_ = "审核未通过";
		return status_;
	}
}
