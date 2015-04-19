package com.lmd.ggzy.jpa.criterion.sub;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.lmd.ggzy.domain.GgzyNotice;

/**
 * 判断是否到资格预审时间
 * @author mh_cxp
 *
 */
public class QuaTimeSpecification implements Specification<GgzyNotice> {

	@Override
	public Predicate toPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		/**
		 * 暂时评标资格预审时间判断
		 */
//		return cb.lessThanOrEqualTo(cb.function("trunc", String.class, root.get("quaTime")), cb.function("trunc", String.class, cb.currentDate()));
		return cb.conjunction();
	}

	
}
