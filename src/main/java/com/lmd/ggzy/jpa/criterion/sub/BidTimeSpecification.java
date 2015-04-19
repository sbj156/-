package com.lmd.ggzy.jpa.criterion.sub;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.lmd.ggzy.domain.GgzyNoticeTenders;

/**
 * 判断是否到开标时间
 * @author mh_cxp
 *
 */
public class BidTimeSpecification implements Specification<GgzyNoticeTenders> {

	@Override
	public Predicate toPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		/**
		 * 暂时屏蔽开标时间验证
		 */
//		return cb.lessThanOrEqualTo(cb.function("trunc", String.class, root.get("notice").get("bidDocSubEndtime")), cb.function("trunc", String.class, cb.currentDate()));
		return cb.conjunction();
	}

	
}
