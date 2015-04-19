package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
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
 * 中标结果公示
 * 
 * @author mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BID_PUBLICITY")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyContracts", "biddingCandidateId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyBidPublicity")
public class GgzyBidPublicity {

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", nullable = false, updatable = false), @JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", nullable = false, updatable = false) })
	private GgzyNoticeTenders noticeTenders;
	/**
	 * 公示开始时间
	 * 
	 * @uml.property name="publicityBegintime"
	 */
	@Column(name = "PUBLICITY_BEGINTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar publicityBegintime;

	/**
	 * 公示结束时间
	 * 
	 * @uml.property name="publicityEndtime"
	 */
	@Column(name = "PUBLICITY_ENDTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar publicityEndtime;

	/**
	 * 公示内容
	 * 
	 * @uml.property name="publicityContent"
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "PUBLICITY_CONTENT")
	private DataClob publicityContent;

	/**
	 * 提交时间
	 * 
	 * @uml.property name="subTime"
	 */
	@Column(name = "SUB_TIME", columnDefinition = "timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar subTime;

	
	@Column(name = "MANAGER")
	private String manager;
	@Column(name = "ENGINEER")
	private String engineer;
	
	/**
	 * 头衔
	 */
	@Column(name="title")
	private String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	/**
	 * 公告审核时间
	 * 
	 * @uml.property name="auditTime"
	 */
	@Column(name = "AUDIT_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar auditTime;

	/**
	 * 公告审核状态
	 * 
	 * @uml.property name="auditStatus"
	 */
	@Column
	private Integer auditStatus;

	/**
	 * 项目经理
	 */
	@Column(length = 50)
	private String PM;

	public String getPM() {
		return PM;
	}

	public void setPM(String pM) {
		PM = pM;
	}

	public Calendar getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Calendar auditTime) {
		this.auditTime = auditTime;
	}

	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property name="publicityBegintime"
	 */
	public Calendar getPublicityBegintime() {
		return publicityBegintime;
	}

	/**
	 * @param publicityBegintime
	 * @uml.property name="publicityBegintime"
	 */
	public void setPublicityBegintime(Calendar publicityBegintime) {
		this.publicityBegintime = publicityBegintime;
	}

	/**
	 * @return
	 * @uml.property name="publicityEndtime"
	 */
	public Calendar getPublicityEndtime() {
		return publicityEndtime;
	}

	/**
	 * @param publicityEndtime
	 * @uml.property name="publicityEndtime"
	 */
	public void setPublicityEndtime(Calendar publicityEndtime) {
		this.publicityEndtime = publicityEndtime;
	}

	/**
	 * @return
	 * @uml.property name="publicityContent"
	 */
	public DataClob getPublicityContent() {
		return publicityContent;
	}

	/**
	 * @param publicityContent
	 * @uml.property name="publicityContent"
	 */
	public void setPublicityContent(DataClob publicityContent) {
		this.publicityContent = publicityContent;
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

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyContracts", "biddingCandidateId").toString();
	}
}
