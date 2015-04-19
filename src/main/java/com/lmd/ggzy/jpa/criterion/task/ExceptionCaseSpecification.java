package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyExceptionalCase;
/**
 * 废标管理过滤条件
 * @author mh_cxp
 *
 */
public class ExceptionCaseSpecification extends BusinessTaskSpecification<GgzyExceptionalCase> {

	@Override
	protected Predicate buildTaskPredicate(Root<GgzyExceptionalCase> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.conjunction();
	}

	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyExceptionalCase> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("noticeTenders").get("notice").get("bidPro").get("businessType").get("businessTypeId"), getBusinessTypeId());
	}

	@Override
	protected Expression<?> getUserExperssion(Root<GgzyExceptionalCase> root) {
		// TODO Auto-generated method stub
		return root.get("noticeTenders").get("notice").get("bidPro").get("agency").get("biddingSubjectId");
	}

	@Override
	protected Expression<?> statusExperssion(Root<GgzyExceptionalCase> root) {
		// TODO Auto-generated method stub
		return root.get("noticeTenders").get("notice").get("bidPro").get("status");
	}

}
