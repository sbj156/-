package com.lmd.ggzy.service;

import java.io.Serializable;
import java.util.List;

import com.lmd.ggzy.domain.BaseDomain;

public interface BaseServiceTemplate<E extends BaseDomain<? extends Serializable>,K extends Serializable> extends BaseService<E> {
	public abstract long countAll();    
    public abstract void delete(E entity);    
    public abstract E find(K id);    
    public abstract List<E> findAll();    
    public abstract List<E> find(int firstResult, int maxResults);    
    public abstract void save(E entity);    
    public abstract E update(E entity);
}
