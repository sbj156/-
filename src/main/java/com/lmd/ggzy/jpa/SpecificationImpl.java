package com.lmd.ggzy.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

public class SpecificationImpl<T> implements Specification<T> {

	List<Criterion> criterions = java.util.Collections.emptyList();
	
	@Override
	public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		if(!criterions.isEmpty()){
			List<Predicate> predicates = new ArrayList<Predicate>();  
			for(Criterion criterion : criterions){
				predicates.add(criterion.toPredicate(root, query, cb));
			}
			return cb.and(predicates.toArray(new Predicate[predicates.size()]));
		}
		return cb.conjunction();
	}

	public void add(Criterion criterion){
		criterions.add(criterion);
	}
}
