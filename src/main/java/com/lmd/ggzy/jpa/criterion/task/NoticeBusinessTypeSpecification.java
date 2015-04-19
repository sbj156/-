package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.jpa.criterion.task.BusinessTaskSpecification;
/**
 * 查询业务类型notice
 * @author mh_cxp
 *
 */
public abstract class NoticeBusinessTypeSpecification extends BusinessTaskSpecification<GgzyNotice> {
	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("bidPro").get("businessType").get("businessTypeId"), getBusinessTypeId());
	}
	@Override
	protected Expression<?> getUserExperssion(Root<GgzyNotice> root) {
		// TODO Auto-generated method stub
		return root.get("bidPro").get("agency").get("biddingSubjectId");
	}
	
	 @Override
	protected Expression<?> statusExperssion(Root<GgzyNotice> root) {
		// TODO Auto-generated method stub
		return root.get("bidPro").get("status");
	}
}
