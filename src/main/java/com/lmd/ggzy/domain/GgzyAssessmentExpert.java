package com.lmd.ggzy.domain;

import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyAssessmentExpert")
public class GgzyAssessmentExpert {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2923292047588449383L;

	/**
	 * @uml.property  name="expertApply"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "EXPERT_APPLY_ID")
	private GgzyExpertApply expertApply;

	/**
	 * @uml.property  name="expert"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "EXPERT_ID", referencedColumnName="ID")
	private GgzyExpert expert;

	/**
	 * 如果是招标人代表,填入姓名
	 * @uml.property  name="expertName"
	 */
	@Column
	private String expertName;

	/**
	 * 1招标人代表 2专家库成员
	 * @uml.property  name="expertType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="EXPERT_TYPE")
	private GgzyTreeLib expertType;

	/**
	 * 通知方式
	 * @uml.property  name="informWay"
	 */
	@Column
	private String informWay;

	/**
	 * 通知时间
	 * @uml.property  name="informTime"
	 */
	@Column(name = "INFORM_TIME", columnDefinition = "timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar informTime;

	/**
	 * 考核记录
	 * @uml.property  name="evaluation"
	 */
	@Column
	private String evaluation;
	
	/**
	 * @uml.property  name="signTime"
	 */
	@Column(name = "SIGN_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar signTime;
	
	/**
	 * @uml.property  name="expertScores"
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "expert", cascade = {CascadeType.REMOVE})
	private Set<GgzyExpertScore> expertScores;
	
	/**
	 * @return
	 * @uml.property  name="expertScores"
	 */
	public Set<GgzyExpertScore> getExpertScores() {
		return expertScores;
	}

	/**
	 * @param expertScores
	 * @uml.property  name="expertScores"
	 */
	public void setExpertScores(Set<GgzyExpertScore> expertScores) {
		this.expertScores = expertScores;
	}

	public Boolean getSigned() {
		return !(signTime == null);
	}

	public void setSigned(Boolean signed) {
		if(signed)
			signTime = Calendar.getInstance();
	}

	/**
	 * @return
	 * @uml.property  name="signTime"
	 */
	public Calendar getSignTime() {
		return signTime;
	}

	/**
	 * @return
	 * @uml.property  name="expertApply"
	 */
	public GgzyExpertApply getExpertApply() {
		return expertApply;
	}

	/**
	 * @param expertApply
	 * @uml.property  name="expertApply"
	 */
	public void setExpertApply(GgzyExpertApply expertApply) {
		this.expertApply = expertApply;
	}

	/**
	 * @return
	 * @uml.property  name="expert"
	 */
	public GgzyExpert getExpert() {
		return expert;
	}

	/**
	 * @param expert
	 * @uml.property  name="expert"
	 */
	public void setExpert(GgzyExpert expert) {
		this.expert = expert;
	}

	/**
	 * @return
	 * @uml.property  name="expertName"
	 */
	public String getExpertName() {
		if(expert != null)
			return expert.getName();
		return expertName;
	}

	/**
	 * @param expertName
	 * @uml.property  name="expertName"
	 */
	public void setExpertName(String expertName) {
		this.expertName = expertName;
	}

	/**
	 * @return
	 * @uml.property  name="informWay"
	 */
	public String getInformWay() {
		return informWay;
	}

	/**
	 * @param informWay
	 * @uml.property  name="informWay"
	 */
	public void setInformWay(String informWay) {
		this.informWay = informWay;
	}

	/**
	 * @return
	 * @uml.property  name="informTime"
	 */
	public Calendar getInformTime() {
		return informTime;
	}

	/**
	 * @param informTime
	 * @uml.property  name="informTime"
	 */
	public void setInformTime(Calendar informTime) {
		this.informTime = informTime;
	}

	/**
	 * @return
	 * @uml.property  name="evaluation"
	 */
	public String getEvaluation() {
		return evaluation;
	}

	/**
	 * @param evaluation
	 * @uml.property  name="evaluation"
	 */
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	/**
	 * @return
	 * @uml.property  name="expertType"
	 */
	public GgzyTreeLib getExpertType() {
		return expertType;
	}

	/**
	 * @param expertType
	 * @uml.property  name="expertType"
	 */
	public void setExpertType(GgzyTreeLib expertType) {
		this.expertType = expertType;
	}
}
