package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyProQuaResult;
/**
 * 资格预审项目场所预约列表条件,由于是查询@GgzyProQuaResult
 * 资格预审结果,所以只需要对业务类型进行判断
 * 
 * @author mh_cxp
 *
 */
public class QuaAppointmentSpecification extends BusinessTaskSpecification<GgzyProQuaResult> {

	public static final String SPECIFICATION = "quaappointment";
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyProQuaResult> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("notice").get("auditStatus"), "2");
	}

	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyProQuaResult> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("notice").get("bidPro").get("businessType").get("businessTypeId"), getBusinessTypeId());
	}

	@Override
	protected Expression<?> getUserExperssion(Root<GgzyProQuaResult> root) {
		// TODO Auto-generated method stub
		return root.get("notice").get("bidPro").get("agency").get("biddingSubjectId");
	}

	@Override
	protected Expression<?> statusExperssion(Root<GgzyProQuaResult> root) {
		// TODO Auto-generated method stub
		return root.get("notice").get("bidPro").get("status");
	}

}
