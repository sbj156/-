package com.lmd.ggzy.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;

import com.lmd.ggzy.jpa.Criterion.Operator;

/**
 * 逻辑条件表达式 用于复杂条件时使用，如但属性多对应值的OR查询等
 * @author lee
 *
 */
public class LogicalExpression implements Specification {

	@Override
	public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder builder) {
		// TODO Auto-generated method stub
		List<Predicate> predicates = new ArrayList<Predicate>();
		for(Specification specification : specifications){
			predicates.add(specification.toPredicate(root, query, builder));
		}
		switch (operator) {
		case OR:
			return builder.or(predicates.toArray(new Predicate[predicates.size()]));
		default:
			return null;
		}
	}
	private Specification[] specifications; 	// 逻辑表达式中包含的表达式
	private Operator operator;		//计算符

	public LogicalExpression(Operator operator, Specification... specifications) {
		this.specifications = specifications;
		this.operator = operator;
	}


}