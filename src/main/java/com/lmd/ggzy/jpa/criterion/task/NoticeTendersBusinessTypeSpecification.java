package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
/**
 * 查询业务类型noticeTenders
 * @author mh_cxp
 *
 */
public abstract class NoticeTendersBusinessTypeSpecification extends BusinessTaskSpecification<GgzyNoticeTenders> {

	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("tenders").get("bidPro").get("businessType").get("businessTypeId"), getBusinessTypeId());
	}

	@Override
	protected Expression<?> getUserExperssion(Root<GgzyNoticeTenders> root) {
		// TODO Auto-generated method stub
		return root.get("notice").get("bidPro").get("agency").get("biddingSubjectId");
	}
	@Override
	protected Expression<?> statusExperssion(Root<GgzyNoticeTenders> root) {
		// TODO Auto-generated method stub
		return root.get("tenders").get("bidPro").get("status");
	}
}
