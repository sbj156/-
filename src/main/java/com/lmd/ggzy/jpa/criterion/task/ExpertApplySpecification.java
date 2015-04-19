package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNoticeTenders;
/**
 * 专家抽取列表判断条件
 * 1.满足开标条件
 * 2.已开标
 * @author mh_cxp
 *
 */
public class ExpertApplySpecification extends OpenningSpecification {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.and(super.buildTaskPredicate(root, query, cb), cb.isNotEmpty((Expression)root.get("ggzyBidOpenings")));
	}

}
