package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.apache.commons.lang3.StringUtils;

import com.lmd.ggzy.domain.GgzyAssessmentExpert;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyNoticeTenders;

/**
 * 评标列表条件,已抽取且记录专家
 * 1.已满足专家抽取条件
 * 2.已抽取专家
 * @author mh_cxp
 * 
 */
public class EvaluationSpecification extends ExpertApplySpecification {

	public static final String SPECIFICATION = "evaluation";
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		Subquery<GgzyAssessmentExpert> subquery = query.subquery(GgzyAssessmentExpert.class);
		Root<GgzyAssessmentExpert> root_ = subquery.from(GgzyAssessmentExpert.class);

		Expression e = root_.join("expertApply");
		subquery.select(e);
		subquery.where(cb.equal(root_.get("expertApply").get("noticeTenders"), root));

		String businessTypeId = getBusinessTypeId();
		if(StringUtils.isNotEmpty(businessTypeId)){
			GgzyBusinessType businessType = this.businessTypeService.findGgzyBusinessType(businessTypeId);
			if(businessType != null && businessType.getCode().equalsIgnoreCase("CQ"))
				return super.buildTaskPredicate(root, query, cb);
		}
		return cb.and(super.buildTaskPredicate(root, query, cb), cb.isNotEmpty((Expression) root.get("expertApplies")), cb.exists(subquery));
	}
}
