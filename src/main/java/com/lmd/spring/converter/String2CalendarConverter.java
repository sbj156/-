package com.lmd.spring.converter;

import java.util.Calendar;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.converters.CalendarConverter;
import org.springframework.core.convert.converter.Converter;


public class String2CalendarConverter implements Converter<String, Calendar> {
	/**
	 * @uml.property  name="datePattern"
	 */
	private static Pattern datePattern = Pattern.compile("^\\d{4}(\\-|\\/|\\.)\\d{1,2}\\1\\d{1,2}$");
	@Override
	public Calendar convert(String source) {
		if(org.apache.commons.lang3.StringUtils.isEmpty(source))
			return null;
		source = source.trim();
		CalendarConverter converter = new CalendarConverter();
		if(datePattern.matcher(source).matches())
			converter.setPattern("yyyy-MM-dd");
		else
			converter.setPattern("yyyy-MM-dd HH:mm:ss");
		return (Calendar)converter.convert(Calendar.class, source);
	}
}
