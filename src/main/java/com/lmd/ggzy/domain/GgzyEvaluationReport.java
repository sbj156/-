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
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_EVALUATION_REPORT")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyEvaluationReport")
public class GgzyEvaluationReport {

	@EmbeddedId
	private GgzyNoticeTendersPk id;
	/**
	 * 
	 */
	private static final long serialVersionUID = -4244670514700516685L;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", nullable = false, insertable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", nullable = false, insertable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;

	/**
	 * @uml.property name="reportContent"
	 * @uml.associationEnd
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "REPORT_CONTENT")
	private DataClob reportContent;

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
	 * 是否结束评标
	 */
	@Column(name="FINISH", precision=1)
	private Integer finish;
	
	public Integer getFinish() {
		return finish;
	}

	public void setFinish(Integer finish) {
		this.finish = finish;
	}

	/**
	 * 记录人
	 */
	@Column(length = 50)
	private String recordPerson;

	/**
	 * 监督人
	 */
	@Column(length = 50)
	private String supervisors;

	public String getRecordPerson() {
		return recordPerson;
	}

	public void setRecordPerson(String recordPerson) {
		this.recordPerson = recordPerson;
	}

	public String getSupervisors() {
		return supervisors;
	}

	public void setSupervisors(String supervisors) {
		this.supervisors = supervisors;
	}

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property name="reportContent"
	 */
	public DataClob getReportContent() {
		return reportContent;
	}

	/**
	 * @param reportContent
	 * @uml.property name="reportContent"
	 */
	public void setReportContent(DataClob reportContent) {
		this.reportContent = reportContent;
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

	public GgzyNoticeTendersPk getId() {
		return id;
	}

	public void setId(GgzyNoticeTendersPk id) {
		this.id = id;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("tendersId").toString();
	}
}
