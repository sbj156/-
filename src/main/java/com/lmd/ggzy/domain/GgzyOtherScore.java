package com.lmd.ggzy.domain;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
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
@RooJpaEntity(table = "GGZY_OTHER_SCORE")
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyOtherScore")
public class GgzyOtherScore  {

	/**
	 * @uml.property  name="score"
	 */
	@Column(name = "SCORE", precision = 4, scale = 2)
    private BigDecimal score;
	
	/**
	 * @uml.property  name="applyTender"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_TENDER_ID", nullable = false, insertable = false, updatable = false)
	private GgzyApplyTender applyTender;

	/**
	 * @uml.property  name="scoreType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name = "TENDERS_ID" ,referencedColumnName="TENDERS_ID", nullable = false, insertable = false, updatable = false),
		@JoinColumn(name = "NOTICE_ID" ,referencedColumnName="NOTICE_ID", nullable = false, insertable = false, updatable = false),
		@JoinColumn(name = "SCORE_TYPE_ID" ,referencedColumnName="SCORE_TYPE_ID", nullable = false, insertable = false, updatable = false)
	})
	private GgzyTendersScoreType scoreType;

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
	}

	/**
	 * @return
	 * @uml.property  name="scoreType"
	 */
	public GgzyTendersScoreType getScoreType() {
		return scoreType;
	}

	/**
	 * @param scoreType
	 * @uml.property  name="scoreType"
	 */
	public void setScoreType(GgzyTendersScoreType scoreType) {
		this.scoreType = scoreType;
	}
}
