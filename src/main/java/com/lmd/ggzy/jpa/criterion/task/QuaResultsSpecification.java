package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.jpa.criterion.SpecificationFactory;

/**
 * 资格预审结果录入条件
 * 1.公告为资格预审公告
 * 2.到资格预审时间
 * @author mh_cxp
 *
 */
public class QuaResultsSpecification extends BusinessTaskSpecification<GgzyNotice> {

	public static final String SPECIFICATION = "proquaresults";
	@SuppressWarnings("unchecked")
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.and(getSpecification(SpecificationFactory.NOTICEQUA).toPredicate(root, query, cb), getSpecification(SpecificationFactory.QUA_TIME).toPredicate(root, query, cb), cb.equal(root.get("auditStatus"), "2"));
	}

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
