package com.lmd.spring.converter;

import java.sql.Clob;

import org.springframework.core.convert.converter.Converter;
/**
 * String --> Clob 转换器
 * @author mh_cxp
 *
 */
public class String2ClobConverter implements Converter<String, Clob> {

	@Override
	public Clob convert(String source) {
		return ConvertUtil.convertString2Clob(source);
	}
}
