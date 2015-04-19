package com.lmd.ggzy.domain;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyExpertApply")
public class GgzyExpertApply  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2191013873039990395L;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", nullable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", nullable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;
	
	/**
	 * @uml.property  name="assessmentExperts"
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "expertApply", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@OrderBy("signTime, id")
	private List<GgzyAssessmentExpert> assessmentExperts;	
	/**
	 * 申请编号
	 * @uml.property  name="applyCode"
	 */
	@Column(length=20)
	private String applyCode;
	
	/**
	 * 专家库名称
	 * @uml.property  name="expertLibName"
	 */
	@Column(length= 500)
	private String expertLibName;
	
	/**
	 * 抽取要求
	 * @uml.property  name="requirement"
	 * @uml.associationEnd  
	 */
	@OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY)
	@JoinColumn(name = "REQUIREMENT")
	private DataClob requirement;
	
	/**
	 * 评审时间
	 * @uml.property  name="reviewTime"
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	@Column
	private Calendar reviewTime;
	
	/**
	 * 评审地点
	 * @uml.property  name="reviewAddress"
	 */
	@Column(length = 100)
	private String reviewAddress;
	
	/**
	 * 抽取时间
	 * @uml.property  name="extractTime"
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	@Column
	private Calendar extractTime;
	
	/**
	 * 抽取人
	 * @uml.property  name="extractPerson"
	 */
	@Column(length = 50)
	private String extractPerson;

	/**
	 * 专家总数
	 * @uml.property  name="total"
	 */
	@Column(precision = 2)
	private Integer total;
	/**
	 * 抽取专家数量
	 * @uml.property  name="eTotal"
	 */
	@Column(precision = 2)
	private Integer eTotal;
	
	/**
	 * 业主专家数量
	 * @uml.property  name="oTotal"
	 */
	@Column(precision = 2)
	private Integer oTotal;

	/**
	 * @uml.property  name="recordCount"
	 */
	@Formula("(select count(1) from ggzy_assessment_expert ae where ae.expert_apply_id=id)")
	private Integer recordCount;

	public List<GgzyAssessmentExpert> getSigned(){
		List<GgzyAssessmentExpert> signedList = new ArrayList<GgzyAssessmentExpert>();
		for(GgzyAssessmentExpert expert : assessmentExperts){
			if(expert.getSignTime() != null)
				signedList.add(expert);
		}
		return signedList;
	}
	
	/**
	 * @return
	 * @uml.property  name="recordCount"
	 */
	public Integer getRecordCount() {
		return recordCount;
	}

	/**
	 * @param recordCount
	 * @uml.property  name="recordCount"
	 */
	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	/**
	 * @return
	 * @uml.property  name="total"
	 */
	public Integer getTotal() {
		return total;
	}

	/**
	 * @param total
	 * @uml.property  name="total"
	 */
	public void setTotal(Integer total) {
		this.total = total;
	}

	/**
	 * @return
	 * @uml.property  name="eTotal"
	 */
	public Integer geteTotal() {
		return eTotal;
	}

	/**
	 * @param eTotal
	 * @uml.property  name="eTotal"
	 */
	public void seteTotal(Integer eTotal) {
		this.eTotal = eTotal;
	}

	/**
	 * @return
	 * @uml.property  name="oTotal"
	 */
	public Integer getoTotal() {
		return oTotal;
	}

	/**
	 * @param oTotal
	 * @uml.property  name="oTotal"
	 */
	public void setoTotal(Integer oTotal) {
		this.oTotal = oTotal;
	}


	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property  name="applyCode"
	 */
	public String getApplyCode() {
		return applyCode;
	}

	/**
	 * @param applyCode
	 * @uml.property  name="applyCode"
	 */
	public void setApplyCode(String applyCode) {
		this.applyCode = applyCode;
	}

	/**
	 * @return
	 * @uml.property  name="expertLibName"
	 */
	public String getExpertLibName() {
		return expertLibName;
	}

	/**
	 * @param expertLibName
	 * @uml.property  name="expertLibName"
	 */
	public void setExpertLibName(String expertLibName) {
		this.expertLibName = expertLibName;
	}

	/**
	 * @return
	 * @uml.property  name="requirement"
	 */
	public DataClob getRequirement() {
		return requirement;
	}

	/**
	 * @param requirement
	 * @uml.property  name="requirement"
	 */
	public void setRequirement(DataClob requirement) {
		this.requirement = requirement;
	}

	/**
	 * @return
	 * @uml.property  name="reviewTime"
	 */
	public Calendar getReviewTime() {
		return reviewTime;
	}

	/**
	 * @param reviewTime
	 * @uml.property  name="reviewTime"
	 */
	public void setReviewTime(Calendar reviewTime) {
		this.reviewTime = reviewTime;
	}

	/**
	 * @return
	 * @uml.property  name="reviewAddress"
	 */
	public String getReviewAddress() {
		return reviewAddress;
	}

	/**
	 * @param reviewAddress
	 * @uml.property  name="reviewAddress"
	 */
	public void setReviewAddress(String reviewAddress) {
		this.reviewAddress = reviewAddress;
	}

	/**
	 * @return
	 * @uml.property  name="extractTime"
	 */
	public Calendar getExtractTime() {
		return extractTime;
	}

	/**
	 * @param extractTime
	 * @uml.property  name="extractTime"
	 */
	public void setExtractTime(Calendar extractTime) {
		this.extractTime = extractTime;
	}

	/**
	 * @return
	 * @uml.property  name="extractPerson"
	 */
	public String getExtractPerson() {
		return extractPerson;
	}

	/**
	 * @param extractPerson
	 * @uml.property  name="extractPerson"
	 */
	public void setExtractPerson(String extractPerson) {
		this.extractPerson = extractPerson;
	}

	/**
	 * @return
	 * @uml.property  name="assessmentExperts"
	 */
	public List<GgzyAssessmentExpert> getAssessmentExperts() {
		return assessmentExperts;
	}

	/**
	 * @param assessmentExperts
	 * @uml.property  name="assessmentExperts"
	 */
	public void setAssessmentExperts(List<GgzyAssessmentExpert> assessmentExperts) {
		this.assessmentExperts = assessmentExperts;
	}
	
}
