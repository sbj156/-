package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 主体经营资质信息表 B.3.15 资质序列、行业和专业类别代码编码规则：用6位数字层次码表示。第一层1、2两位表示资质序列；第二层3、4两位表示行业分类，
 * 00表示不分行业；第三层5、6位表示专业类别，00表示不分专业类别。各层次的资质编码均按有关部门颁发的资质标准排序。
 * 
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_QUALIFICATION")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "biddingSubjectId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyQualification")
public class GgzyQualification {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3401419920102072344L;

	/**
	 * 招投标主体
	 */
	@ManyToOne
	@JoinColumn(name = "BIDDING_SUBJECT_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	@NotFound(action = NotFoundAction.IGNORE)
	private GgzyBiddingSubject biddingSubject;

	/**
	 * 资质序列
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private GgzyTreeLib quaSeq;

	/**
	 * 行业分类
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private GgzyTreeLib industry;

	/**
	 * 专业分类
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private GgzyTreeLib major;

	/**
	 * 资质等级
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private GgzyTreeLib grade;

	/**
	 * 资质证书编号
	 */
	@Column(name = "CERTIFICATE_NUMBER", length = 50)
	private String certificateNumber;

	/**
	 * 信息申报责任人
	 */
	@Column(name = "DECLARE_RESPONSIBLE", length = 100)
	private String declareResponsible;

	public GgzyBiddingSubject getBiddingSubject() {
		return biddingSubject;
	}

	public void setBiddingSubject(GgzyBiddingSubject biddingSubject) {
		this.biddingSubject = biddingSubject;
	}

	public GgzyTreeLib getQuaSeq() {
		return quaSeq;
	}

	public void setQuaSeq(GgzyTreeLib quaSeq) {
		this.quaSeq = quaSeq;
	}

	public GgzyTreeLib getIndustry() {
		return industry;
	}

	public void setIndustry(GgzyTreeLib industry) {
		this.industry = industry;
	}

	public GgzyTreeLib getMajor() {
		return major;
	}

	public void setMajor(GgzyTreeLib major) {
		this.major = major;
	}

	public GgzyTreeLib getGrade() {
		return grade;
	}

	public void setGrade(GgzyTreeLib grade) {
		this.grade = grade;
	}

	public String getCertificateNumber() {
		return certificateNumber;
	}

	public void setCertificateNumber(String certificateNumber) {
		this.certificateNumber = certificateNumber;
	}

	public String getDeclareResponsible() {
		return declareResponsible;
	}

	public void setDeclareResponsible(String declareResponsible) {
		this.declareResponsible = declareResponsible;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("biddingSubjectId").toString();
	}
}
