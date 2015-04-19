package com.lmd.ggzy.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.reflect.MethodUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;
import com.lmd.ggzy.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T>,
		ApplicationContextAware {

	/**
	 * @uml.property  name="applicationContext"
	 * @uml.associationEnd  
	 */
	protected ApplicationContext applicationContext;
	/**
	 * @uml.property  name="jpa"
	 * @uml.associationEnd  
	 */
	private JpaSpecificationExecutor<T> jpa;

	@Transactional(readOnly = true)
	public List<T> findByExample(Specification<T> specification, Page page) {
		org.springframework.data.domain.Page<T> springDataPage = initJpaSpecificationExecutor().findAll(
				specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	private JpaSpecificationExecutor<T> initJpaSpecificationExecutor() {
		if (jpa == null) {
			Type type = getClass().getGenericSuperclass();
			Type trueType = ((ParameterizedType) type).getActualTypeArguments()[0];
			Class<T> entityClass = (Class<T>) trueType;
			String clsName = entityClass.getSimpleName();
			clsName = clsName.substring(0, 1).toLowerCase()
					+ clsName.substring(1) + "Repository";
			this.jpa = (JpaSpecificationExecutor<T>) applicationContext
					.getBean(clsName);
		}
		return jpa;
	}

	/**
	 * @param applicationContext
	 * @throws BeansException
	 * @uml.property  name="applicationContext"
	 */
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = applicationContext;
	}

	@Override
	@Transactional(readOnly = true)
	public List<T> findByExample(Specification<T> specification) {
		// TODO Auto-generated method stub
		return initJpaSpecificationExecutor().findAll(specification);
	}
	@Override
	public Object callRepositoryMethod(String methodName, Object...args){
		try {
			return MethodUtils.invokeMethod(initJpaSpecificationExecutor(), methodName, args);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Object callRepositoryMethod(com.lmd.ggzy.service.BaseService.RepoMethod methodName, Object... args) {
		// TODO Auto-generated method stub
		return callRepositoryMethod(methodName.toString(), args);
	}
	
	
}
