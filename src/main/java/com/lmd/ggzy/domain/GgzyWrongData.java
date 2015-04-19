package com.lmd.ggzy.domain;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "GGZY_WRONGDATA")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyWrongData")
public class GgzyWrongData extends BaseDomainAuto {

	
	@Column(length = 20)
	private String projectCode;
	
	@Column(length = 200)
	private String projectName;
	
	@Column(length = 50)
	private String agency;
	
	/**
	 * 修改原因
	 */
	@Basic(fetch=FetchType.LAZY)
	@Column(columnDefinition = "clob")
	@Lob
	private String changeReason;
	
	/**
	 * 错误出现环节
	 */
	@Basic(fetch=FetchType.LAZY)
	@Column(columnDefinition = "clob")
	@Lob
	private String wrongDuty;
	
	/**
	 * 修改顺序号
	 */
	@Column
	private int modifyIndex;
	
	/**
	 * 责任方 1代理 2主管部门 3 公岗人员 4项目实际情况
	 */
	@Column
	private int dutyParty;
	
	/**
	 * 修改前开标时间
	 */
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Date oldBidTime;
	
	/**
	 * 修改后开标时间
	 */
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Date bidTime;
	
	/**
	 * 修改时间
	 */
	@Column(columnDefinition = "date default sysdate")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Date changeDate;

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getAgency() {
		return agency;
	}

	public void setAgency(String agency) {
		this.agency = agency;
	}

	public String getChangeReason() {
		return changeReason;
	}

	public void setChangeReason(String changeReason) {
		this.changeReason = changeReason;
	}

	public String getWrongDuty() {
		return wrongDuty;
	}

	public void setWrongDuty(String wrongDuty) {
		this.wrongDuty = wrongDuty;
	}

	public int getModifyIndex() {
		return modifyIndex;
	}

	public void setModifyIndex(int modifyIndex) {
		this.modifyIndex = modifyIndex;
	}

	public int getDutyParty() {
		return dutyParty;
	}

	public void setDutyParty(int dutyParty) {
		this.dutyParty = dutyParty;
	}

	public Date getOldBidTime() {
		return oldBidTime;
	}

	public void setOldBidTime(Date oldBidTime) {
		this.oldBidTime = oldBidTime;
	}

	public Date getBidTime() {
		return bidTime;
	}

	public void setBidTime(Date bidTime) {
		this.bidTime = bidTime;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}
}
