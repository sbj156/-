package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyBidPro;
/**
 * 登记列表查询条件
 * @author mh_cxp
 *
 */
public class BidProSpecification extends BusinessTaskSpecification<GgzyBidPro> {

	public static final String SPECIFICATION = "bidpro";
	/**
	 * 登记列表无步骤判断条件,空实现
	 */
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyBidPro> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.conjunction();
	}
	
	@Override
	protected Predicate buildBusinessTypePredicate(Root<GgzyBidPro> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("businessType").get("businessTypeId"), getBusinessTypeId());
	}

	@Override
	protected Expression<?> getUserExperssion(Root<GgzyBidPro> root) {
		// TODO Auto-generated method stub
		return root.get("agency").get("biddingSubjectId");
	}

	@Override
	protected Expression<?> statusExperssion(Root<GgzyBidPro> root) {
		// TODO Auto-generated method stub
		return root.get("status");
	}
	
	

}
