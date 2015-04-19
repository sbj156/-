package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;


@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_PROJECT_STATUS")
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyProjectStatus")
@Entity
@Table(name = "GGZY_PROJECT_STATUS")
public class GgzyProjectStatus extends BaseDomainUUID {
	
	
	@Basic(fetch=FetchType.LAZY)
    @Column(columnDefinition="CLOB" )
    @Lob
	private String pausedReason;
	
	@Basic(fetch=FetchType.LAZY)
    @Column(columnDefinition="CLOB" )
    @Lob
	private String runningReason;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BID_PRO_ID", referencedColumnName = "BID_PRO_ID")
	private GgzyBidPro bidPro;

	@Column(columnDefinition = "TIMESTAMP DEFAULT SYSTIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar pausedTime;
	
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar runningTime;
	
	public String getPausedReason() {
		return pausedReason;
	}

	public void setPausedReason(String pausedReason) {
		this.pausedReason = pausedReason;
	}

	public String getRunningReason() {
		return runningReason;
	}

	public void setRunningReason(String runningReason) {
		this.runningReason = runningReason;
	}

	public GgzyBidPro getBidPro() {
		return bidPro;
	}

	public void setBidPro(GgzyBidPro bidPro) {
		this.bidPro = bidPro;
	}

	public Calendar getPausedTime() {
		return pausedTime;
	}

	public void setPausedTime(Calendar pausedTime) {
		this.pausedTime = pausedTime;
	}

	public Calendar getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(Calendar runningTime) {
		this.runningTime = runningTime;
	}
	
}
