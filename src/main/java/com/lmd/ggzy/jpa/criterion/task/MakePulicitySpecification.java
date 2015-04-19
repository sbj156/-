package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNoticeTenders;
/**
 * 制作中标公示判断条件
 * 1.已满足评标条件
 * 2.已确认中标人
 * @author mh_cxp
 *
 */
public class MakePulicitySpecification extends EvaluationSpecification {

	public static final String SPECIFICATION = "makepulicity";
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.and(super.buildTaskPredicate(root, query, cb), cb.isNotEmpty((Expression)root.get("biddingCandidates")));
	}

}
