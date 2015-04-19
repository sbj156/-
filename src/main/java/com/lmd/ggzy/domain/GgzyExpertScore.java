package com.lmd.ggzy.domain;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_EXPERT_SCORE")
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyExpertScore")
public class GgzyExpertScore  {

	/**
	 * @uml.property  name="applyTender"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_TENDER_ID", nullable = false, insertable = false, updatable = false)
	private GgzyApplyTender applyTender;

	/**
	 * @uml.property  name="expert"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "EXPERT_ID", nullable = false, insertable = false, updatable = false)
	private GgzyAssessmentExpert expert;

	/**
	 * @return
	 * @uml.property  name="applyTender"
	 */
	public GgzyApplyTender getApplyTender() {
		return applyTender;
	}

	/**
	 * @param applyTender
	 * @uml.property  name="applyTender"
	 */
	public void setApplyTender(GgzyApplyTender applyTender) {
		this.applyTender = applyTender;
		this.getId().setApplyTenderId(applyTender.getApplyTenderId());
	}

	/**
	 * @return
	 * @uml.property  name="expert"
	 */
	public GgzyAssessmentExpert getExpert() {
		return expert;
	}

	/**
	 * @param expert
	 * @uml.property  name="expert"
	 */
	public void setExpert(GgzyAssessmentExpert expert) {
		this.expert = expert;
		this.getId().setExpertId(expert.getId());
	}
	/**
	 * @uml.property  name="score"
	 */
	@Column(name = "SCORE", precision = 4, scale = 2)
	private BigDecimal score;

	/**
	 * @return
	 * @uml.property  name="score"
	 */
	public BigDecimal getScore() {
		return score;
	}

	/**
	 * @param score
	 * @uml.property  name="score"
	 */
	public void setScore(BigDecimal score) {
		this.score = score;
	}

}
