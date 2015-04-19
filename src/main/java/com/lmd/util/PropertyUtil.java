package com.lmd.util;

import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.reflect.FieldUtils;

public class PropertyUtil {

	/**
	 * 获取target中的属性值,嵌套属性用点号"."导航
	 * @param target
	 * @param fieldName
	 * @return
	 */
	public static Object getProperty(Object target, String fieldName) {
		if (target == null && fieldName == null)
			return null;

		int pointIndex = fieldName.indexOf(".");
		if(pointIndex > 0){
			return getProperty(getProperty(target, fieldName.substring(0, pointIndex)), fieldName.substring(pointIndex + 1));
		}
		try {
			if(target instanceof Map){
				return MapUtils.getObject((Map)target, fieldName);
			}
			return FieldUtils.readDeclaredField(target, fieldName, true);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
