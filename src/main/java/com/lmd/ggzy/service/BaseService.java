package com.lmd.ggzy.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.util.dwz.Page;

public interface BaseService<E> {
	
	public static enum RepoMethod{
		findAll;
		
	}
	
	public List<E> findByExample(
			Specification<E> specification, Page page);
	public List<E> findByExample(Specification<E> specification);
	
	/**
	 * 执行repository中的methodName方法
	 * @param methodName 方法名
	 * @param args	参数
	 * @return
	 */
	public Object callRepositoryMethod(String methodName, Object...args);
	public Object callRepositoryMethod(RepoMethod methodName, Object...args);
	
}
