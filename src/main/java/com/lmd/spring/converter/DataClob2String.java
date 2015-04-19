package com.lmd.spring.converter;

import org.springframework.core.convert.converter.Converter;

import com.lmd.ggzy.domain.data.DataClob;

public class DataClob2String implements Converter<DataClob, String> {

	@Override
	public String convert(DataClob source) {
		// TODO Auto-generated method stub
		return ConvertUtil.convertClob2String(source.getContent());
	}

}
