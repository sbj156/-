package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_OBJECTION")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyObjection")
public class GgzyObjection  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5086017810946516579L;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
	private GgzyTenders tenders;

	/**
	 * @uml.property  name="objectorCode"
	 */
	@Column(name = "OBJECTOR_CODE", length = 9)
	private String objectorCode;

	/**
	 * @uml.property  name="objectionReason"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="OBJECTION_REASON")
	private DataClob objectionReason;

	/**
	 * @uml.property  name="objectionContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="OBJECTION_CONTENT")
	private DataClob objectionContent;

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
	@DateTimeFormat(style = "MM", pattern="yyyy-MM-dd")
	private Calendar subTime;

	/**
	 * @uml.property  name="represtative"
	 */
	@Column(name = "REPRESTATIVE", length = 20)
	private String represtative;

	/**
	 * @uml.property  name="processingTime"
	 */
	@Column(name = "PROCESSING_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern="yyyy-MM-dd")
	private Calendar processingTime;

	/**
	 * @uml.property  name="processiongResult"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="PROCESSIONG_RESULT")
	private DataClob processiongResult;

	/**
	 * @uml.property  name="feedbackTime"
	 */
	@Column(name = "FEEDBACK_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern="yyyy-MM-dd")
	private Calendar feedbackTime;


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
	 * @uml.property  name="objectorCode"
	 */
	public String getObjectorCode() {
		return objectorCode;
	}

	/**
	 * @param objectorCode
	 * @uml.property  name="objectorCode"
	 */
	public void setObjectorCode(String objectorCode) {
		this.objectorCode = objectorCode;
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
	 * @uml.property  name="represtative"
	 */
	public String getReprestative() {
		return represtative;
	}

	/**
	 * @param represtative
	 * @uml.property  name="represtative"
	 */
	public void setReprestative(String represtative) {
		this.represtative = represtative;
	}

	/**
	 * @return
	 * @uml.property  name="processingTime"
	 */
	public Calendar getProcessingTime() {
		return processingTime;
	}

	/**
	 * @param processingTime
	 * @uml.property  name="processingTime"
	 */
	public void setProcessingTime(Calendar processingTime) {
		this.processingTime = processingTime;
	}

	/**
	 * @return
	 * @uml.property  name="objectionReason"
	 */
	public DataClob getObjectionReason() {
		return objectionReason;
	}

	/**
	 * @param objectionReason
	 * @uml.property  name="objectionReason"
	 */
	public void setObjectionReason(DataClob objectionReason) {
		this.objectionReason = objectionReason;
	}

	/**
	 * @return
	 * @uml.property  name="objectionContent"
	 */
	public DataClob getObjectionContent() {
		return objectionContent;
	}

	/**
	 * @param objectionContent
	 * @uml.property  name="objectionContent"
	 */
	public void setObjectionContent(DataClob objectionContent) {
		this.objectionContent = objectionContent;
	}

	/**
	 * @return
	 * @uml.property  name="processiongResult"
	 */
	public DataClob getProcessiongResult() {
		return processiongResult;
	}

	/**
	 * @param processiongResult
	 * @uml.property  name="processiongResult"
	 */
	public void setProcessiongResult(DataClob processiongResult) {
		this.processiongResult = processiongResult;
	}

	/**
	 * @return
	 * @uml.property  name="feedbackTime"
	 */
	public Calendar getFeedbackTime() {
		return feedbackTime;
	}

	/**
	 * @param feedbackTime
	 * @uml.property  name="feedbackTime"
	 */
	public void setFeedbackTime(Calendar feedbackTime) {
		this.feedbackTime = feedbackTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}

}
