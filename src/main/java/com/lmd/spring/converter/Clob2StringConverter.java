package com.lmd.spring.converter;

import java.sql.Clob;

import org.springframework.core.convert.converter.Converter;
/**
 * clob -->String转换器 
 * @author mh_cxp
 *
 */
public class Clob2StringConverter implements Converter<Clob, String> {

	@Override
	public String convert(Clob clob) {
		// TODO Auto-generated method stub
		return ConvertUtil.convertClob2String(clob);
	}
}
