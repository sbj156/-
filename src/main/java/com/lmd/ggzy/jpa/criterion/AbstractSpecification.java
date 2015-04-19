package com.lmd.ggzy.jpa.criterion;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;

public abstract class AbstractSpecification<T> implements Specification<T>, SpecificationFactoryBean {

	@Autowired
	private SpecificationFactory factory;

	public SpecificationFactory getFactory() {
		return factory;
	}

	@Override
	public Specification getSpecification(String name) {
		// TODO Auto-generated method stub
		return factory.getSpecification(name);
	}

	@Override
	public Specification getSpecification(String[] names) {
		// TODO Auto-generated method stub
		return factory.getSpecification(names);
	}

	@Override
	public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return buildPredicate(root, query, cb);
	}
	
	protected abstract Predicate buildPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb);
		
}
