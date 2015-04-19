package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;
/**
 * 审核公告列表判断条件
 * @author mh_cxp
 *
 */
public class AuditNoticeSpecification extends NoticeBusinessTypeSpecification {

	public static final String SPECIFICATION = "auditnotice";
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.conjunction();
	}
	@Override
	protected Expression<?> getUserExperssion(Root<GgzyNotice> root) {
		// TODO Auto-generated method stub
		return null;
	}

}
