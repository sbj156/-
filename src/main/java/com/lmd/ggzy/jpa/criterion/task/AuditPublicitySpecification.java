package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyBidPublicity;
import com.lmd.ggzy.domain.GgzyNotice;
/**
 * 审核中标公示判断条件
 * @author mh_cxp
 *
 */
public class AuditPublicitySpecification extends BusinessTaskSpecification<GgzyBidPublicity> {

	public static final String SPECIFICATION = "auditpublicity";
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyBidPublicity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.conjunction();
	}

	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyBidPublicity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("noticeTenders").get("tenders").get("bidPro").get("businessType").get("businessTypeId"), getBusinessTypeId());
	}

	@Override
	protected Expression<?> getUserExperssion(Root<GgzyBidPublicity> root) {
		// TODO Auto-generated method stub
		return root.get("noticeTenders").get("tenders").get("bidPro").get("agency").get("biddingSubjectId");
	}

	@Override
	protected Expression<?> statusExperssion(Root<GgzyBidPublicity> root) {
		// TODO Auto-generated method stub
		return root.get("noticeTenders").get("tenders").get("bidPro").get("status");
	}
}
