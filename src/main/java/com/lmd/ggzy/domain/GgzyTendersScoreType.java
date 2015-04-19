package com.lmd.ggzy.domain;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.pk.GgzyTendersScoreTypePk;
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_TENDERS")
@RooDbManaged(automaticallyDelete = true)
@RooToString
@RooJson
@Entity
@Table(name = "GGZY_TENDERS_SCORE_TYPE")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyTendersScoreType")
public class GgzyTendersScoreType {

	/**
	 * @uml.property  name="id"
	 * @uml.associationEnd  
	 */
	@EmbeddedId
	private GgzyTendersScoreTypePk id ;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID",insertable = false, nullable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID",insertable = false, nullable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;
	
	/**
	 * @uml.property  name="scoreType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SCORE_TYPE_ID",referencedColumnName= "ID", nullable = false, insertable = false, updatable = false)
	private GgzyTreeLib scoreType;

	/**
	 * @uml.property  name="sortIndex"
	 */
	@Column(precision = 3)
	private Integer sortIndex;
	
	@Column(name="SCORE_TYPE_PERSON")
	private String scoreTypePerson;
	
	@Column(name="COEF_PERSON")
	private String coefPerson;
	
	@Column(name = "COEF", precision = 20, scale = 2)
	private BigDecimal coef;
	
	
	

	public String getScoreTypePerson() {
		return scoreTypePerson;
	}

	public void setScoreTypePerson(String scoreTypePerson) {
		this.scoreTypePerson = scoreTypePerson;
	}

	public String getCoefPerson() {
		return coefPerson;
	}

	public void setCoefPerson(String coefPerson) {
		this.coefPerson = coefPerson;
	}

	public BigDecimal getCoef() {
		return coef;
	}

	public void setCoef(BigDecimal coef) {
		this.coef = coef;
	}

	/**
	 * @return
	 * @uml.property  name="sortIndex"
	 */
	public Integer getSortIndex() {
		return sortIndex;
	}

	/**
	 * @param sortIndex
	 * @uml.property  name="sortIndex"
	 */
	public void setSortIndex(Integer sortIndex) {
		this.sortIndex = sortIndex;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public GgzyTendersScoreTypePk getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(GgzyTendersScoreTypePk id) {
		this.id = id;
	}


	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property  name="scoreType"
	 */
	public GgzyTreeLib getScoreType() {
		return scoreType;
	}

	/**
	 * @param scoreType
	 * @uml.property  name="scoreType"
	 */
	public void setScoreType(GgzyTreeLib scoreType) {
		this.scoreType = scoreType;
	}
	
}
