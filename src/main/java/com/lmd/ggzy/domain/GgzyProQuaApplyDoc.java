package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_PRO_QUA_APPLY_DOC")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyQuaResNotices", "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyProQuaApplyDoc")
public class GgzyProQuaApplyDoc  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3413169066536076655L;

	/**
	 * @uml.property  name="ggzyQuaResNotices"
	 */
	@OneToMany(mappedBy = "proQuaApplyDoc", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	private Set<GgzyQuaResNotice> ggzyQuaResNotices;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
	private GgzyTenders tenders;

	/**
	 * @uml.property  name="applicantsCode"
	 */
	@Column(name = "APPLICANTS_CODE", length = 9)
	private String applicantsCode;

	/**
	 * @uml.property  name="bidQualification"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_QUALIFICATION")
	private DataClob bidQualification;

	/**
	 * @uml.property  name="projectLeader"
	 */
	@Column(name = "PROJECT_LEADER", length = 50)
	private String projectLeader;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property  name="subTime"
	 */
	@Column(name = "SUB_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar subTime;

	/**
	 * @uml.property  name="isPass"
	 */
	@Column(name = "IS_PASS")
	private Character isPass;

	/**
	 * @return
	 * @uml.property  name="ggzyQuaResNotices"
	 */
	public Set<GgzyQuaResNotice> getGgzyQuaResNotices() {
		return ggzyQuaResNotices;
	}

	/**
	 * @param ggzyQuaResNotices
	 * @uml.property  name="ggzyQuaResNotices"
	 */
	public void setGgzyQuaResNotices(Set<GgzyQuaResNotice> ggzyQuaResNotices) {
		this.ggzyQuaResNotices = ggzyQuaResNotices;
	}

	/**
	 * @return
	 * @uml.property  name="tenders"
	 */
	public GgzyTenders getTenders() {
		return tenders;
	}

	/**
	 * @param tenders
	 * @uml.property  name="tenders"
	 */
	public void setTenders(GgzyTenders tenders) {
		this.tenders = tenders;
	}

	/**
	 * @return
	 * @uml.property  name="applicantsCode"
	 */
	public String getApplicantsCode() {
		return applicantsCode;
	}

	/**
	 * @param applicantsCode
	 * @uml.property  name="applicantsCode"
	 */
	public void setApplicantsCode(String applicantsCode) {
		this.applicantsCode = applicantsCode;
	}


	/**
	 * @return
	 * @uml.property  name="bidQualification"
	 */
	public DataClob getBidQualification() {
		return bidQualification;
	}

	/**
	 * @param bidQualification
	 * @uml.property  name="bidQualification"
	 */
	public void setBidQualification(DataClob bidQualification) {
		this.bidQualification = bidQualification;
	}

	/**
	 * @return
	 * @uml.property  name="projectLeader"
	 */
	public String getProjectLeader() {
		return projectLeader;
	}

	/**
	 * @param projectLeader
	 * @uml.property  name="projectLeader"
	 */
	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}

	/**
	 * @return
	 * @uml.property  name="attachmentIds"
	 */
	public String getAttachmentIds() {
		return attachmentIds;
	}

	/**
	 * @param attachmentIds
	 * @uml.property  name="attachmentIds"
	 */
	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	/**
	 * @return
	 * @uml.property  name="subTime"
	 */
	public Calendar getSubTime() {
		return subTime;
	}

	/**
	 * @param subTime
	 * @uml.property  name="subTime"
	 */
	public void setSubTime(Calendar subTime) {
		this.subTime = subTime;
	}

	/**
	 * @return
	 * @uml.property  name="isPass"
	 */
	public Character getIsPass() {
		return isPass;
	}

	/**
	 * @param isPass
	 * @uml.property  name="isPass"
	 */
	public void setIsPass(Character isPass) {
		this.isPass = isPass;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"ggzyQuaResNotices", "tendersId").toString();
	}

}
