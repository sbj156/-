package com.lmd.ggzy.service.impl;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.reflect.MethodUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;
import com.lmd.ggzy.domain.BaseDomain;
import com.lmd.ggzy.repository.BaseRepository;


public abstract class BaseServiceTemplateImpl<E extends BaseDomain<? extends Serializable>, T extends Serializable> {

	@Autowired
	protected BaseRepository<E, T> repository;
	
	
	@Transactional(readOnly = true)
	public List<E> findByExample(Specification<E> specification, Page page) {
		org.springframework.data.domain.Page<E> springDataPage =repository.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	
	@Transactional(readOnly = true)
	public List<E> findByExample(Specification<E> specification) {
		// TODO Auto-generated method stub
		return repository.findAll(specification);
	}

	
	public Object callRepositoryMethod(String methodName, Object... args) {
		try {
			return MethodUtils.invokeMethod(repository, methodName, args);
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

	
	public Object callRepositoryMethod(com.lmd.ggzy.service.BaseService.RepoMethod methodName, Object... args) {
		// TODO Auto-generated method stub
		return callRepositoryMethod(methodName.toString(), args);
	}

	
	@Transactional(readOnly = true)
	public long countAll() {
		// TODO Auto-generated method stub
		return repository.count();
	}

	
	public void delete(E entity) {
		// TODO Auto-generated method stub
		repository.delete(entity);
	}

	
	@Transactional(readOnly = true)
	public E find(T id) {
		// TODO Auto-generated method stub
		return repository.findOne(id);
	}

	
	@Transactional(readOnly = true)
	public List<E> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	
	@Transactional(readOnly = true)
	public List<E> find(int firstResult, int maxResults) {
		// TODO Auto-generated method stub
		return repository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
	}

	
	public void save(E entity) {
		update(entity);
	}

	
	public E update(E entity) {
		// TODO Auto-generated method stub
		return repository.save(entity);
	}

	public List<Object[]> nativeQueryList(String sql, Map<String, Object> params){
		return this.repository.nativeQuery(sql, params);
	}
	
	public Object[] nativeQuerySingle(String sql, Map<String, Object> params){
		sql = "select * from (select s.*,rownum rn from( "+ sql +") s) where rn=1";
		List<Object[]> list = this.repository.nativeQuery(sql, params);
		if(CollectionUtils.isEmpty(list)){
			return null;
		}else{
			return list.iterator().next();
		}
	}

}
