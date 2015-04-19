package com.lmd.spring.converter;

import org.springframework.core.convert.converter.Converter;

import com.lmd.ggzy.domain.data.DataClob;

public class String2DataClob implements Converter<String, DataClob> {

	@Override
	public DataClob convert(String source) {
		// TODO Auto-generated method stub
		DataClob clob = new DataClob();
		clob.setContent(ConvertUtil.convertString2Clob(source));
		return clob;
	}

}
