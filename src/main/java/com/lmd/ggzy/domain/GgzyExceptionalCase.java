package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
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
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;

/**
 * 招标异常情况
 * 
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_EXCEPTIONAL_CASE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyExceptionalCase")
public class GgzyExceptionalCase {
	private static final long serialVersionUID = -6211765757842697873L;
	
	@EmbeddedId
	private GgzyNoticeTendersPk id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", insertable = false, updatable = false, nullable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", insertable = false, updatable = false, nullable = false)
	})
	private GgzyNoticeTenders noticeTenders;

	/**
	 * 异常情况描述
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "CASE_DESC")
	private DataClob caseDesc;

	/**
	 * @uml.property name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property name="subTime"
	 */
	@Column(name = "SUB_TIME", columnDefinition = "timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar subTime;

	/**
	 * 异常处理方式
	 */
	@ManyToOne
	@JoinColumn(name = "DEAL_WAY")
	private GgzyTreeLib dealWay;
	
	/**
	 * 处理时间
	 */
	@Column(name = "DEAL_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar dealTime;
	
	/**
	 * @uml.property name="auditResult"
	 * @uml.associationEnd
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "AUDIT_RESULT")
	private DataClob auditResult;

	/**
	 * @uml.property name="auditTime"
	 */
	@Column(name = "AUDIT_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar auditTime;

	/**
	 * 见证人
	 */
	@Column(length = 50)
	private String witness;

	/**
	 * 监督人
	 */
	@Column(length = 50)
	private String supervisors;

	/**
	 * 异常环节,暂定可取值openning, eval;即开标,评标
	 */
	@Column(columnDefinition = "varchar2(20) default 'openning'")
	private String step;
	
	
	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	public DataClob getCaseDesc() {
		return caseDesc;
	}

	public void setCaseDesc(DataClob caseDesc) {
		this.caseDesc = caseDesc;
	}

	/**
	 * @return
	 * @uml.property name="attachmentIds"
	 */
	public String getAttachmentIds() {
		return attachmentIds;
	}

	/**
	 * @param attachmentIds
	 * @uml.property name="attachmentIds"
	 */
	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	/**
	 * @return
	 * @uml.property name="subTime"
	 */
	public Calendar getSubTime() {
		return subTime;
	}

	/**
	 * @param subTime
	 * @uml.property name="subTime"
	 */
	public void setSubTime(Calendar subTime) {
		this.subTime = subTime;
	}

	/**
	 * @return
	 * @uml.property name="auditResult"
	 */
	public DataClob getAuditResult() {
		return auditResult;
	}

	/**
	 * @param auditResult
	 * @uml.property name="auditResult"
	 */
	public void setAuditResult(DataClob auditResult) {
		this.auditResult = auditResult;
	}

	public Calendar getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Calendar auditTime) {
		this.auditTime = auditTime;
	}

	public String getWitness() {
		return witness;
	}

	public void setWitness(String witness) {
		this.witness = witness;
	}

	public String getSupervisors() {
		return supervisors;
	}

	public void setSupervisors(String supervisors) {
		this.supervisors = supervisors;
	}

	public GgzyNoticeTendersPk getId() {
		return id;
	}

	public void setId(GgzyNoticeTendersPk id) {
		this.id = id;
	}
	
	public GgzyTreeLib getDealWay() {
		return dealWay;
	}

	public void setDealWay(GgzyTreeLib dealWay) {
		this.dealWay = dealWay;
	}

	public Calendar getDealTime() {
		return dealTime;
	}

	public void setDealTime(Calendar dealTime) {
		this.dealTime = dealTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("tendersId").toString();
	}
}
