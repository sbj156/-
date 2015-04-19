package com.lmd.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;

public class BeanUtil extends BeanUtils {

	/**
	 * 拷贝source 的propertity到target
	 * 
	 * @param source
	 * @param target
	 * @param filter
	 * @return
	 */
	public static <T> T copyProperties(T source, T target, IgnoreFilter filter) {
		if (filter != null) {
			PropertyDescriptor[] pds = org.springframework.beans.BeanUtils.getPropertyDescriptors(source.getClass());
			List<String> ignoreProperties = new ArrayList<String>();
			for (PropertyDescriptor pd : pds) {
				boolean ignore = filter.ignore(source, target, pd.getName());
				if (ignore)
					ignoreProperties.add(pd.getName());
			}
			BeanUtil.copyProperties(source, target, ignoreProperties.toArray(new String[] {}));
		} else
			BeanUtil.copyProperties(source, target);
		return target;
	}

	interface IgnoreFilter {
		public boolean ignore(Object source, Object target, String propertyName);
	}

	static class IgnoreNullFileter implements IgnoreFilter {

		@Override
		public boolean ignore(Object source, Object target, String propertyName) {
			// TODO Auto-generated method stub
			try {
				if (org.apache.commons.beanutils.BeanUtils.getProperty(source, propertyName) == null)
					return true;
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}

	}

	/**
	 * 获取泛型类型
	 * 
	 * @param obj
	 * @param index
	 * @return
	 */
	public static Class getGenericType(Object obj, int index) {
		Type genType = obj.getClass().getGenericSuperclass();
		if (!(genType instanceof ParameterizedType)) {
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			throw new RuntimeException("Index outof bounds");
		}
		if (!(params[index] instanceof Class)) {
			return Object.class;
		}
		return (Class) params[index];
	}
	
	@SuppressWarnings("unchecked")
	public static <T> T instantiateGenericType(Object obj, int index){
		return (T)BeanUtil.instantiate(BeanUtil.getGenericType(obj, index));
	}
}
