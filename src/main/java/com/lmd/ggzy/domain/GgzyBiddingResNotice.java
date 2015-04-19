package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
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
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.pk.GgzyRefTenderApplyPk;

/**
 * 中标通知书
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_BIDDING_RES_NOTICE")
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name = "GGZY_BIDDING_RES_NOTICE")
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBiddingResNotice")
public class GgzyBiddingResNotice  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5071727497053543912L;

	@EmbeddedId
	private GgzyRefTenderApplyPk id = new GgzyRefTenderApplyPk();
	
	/**
	 * 中标人
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "APPLY_TENDER_ID", nullable = false, insertable = false, updatable = false)
    private GgzyApplyTender applyTender;
    
    /**
     * 标段
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TENDERS_ID", nullable = false, insertable = false, updatable = false)
    private GgzyTenders tenders;

	/**
	 * 通知书类型,1中标通知书,0未中标通知书
	 */
	@Column(name = "NOTICE_TYPE")
	private Character noticeType;

	/**
	 * 打印时间,确认打印完成的时间
	 */
	@Column(name = "PRINT_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar printTime;
	
	/**
	 * 允许打印时间,主管部门确定
	 */
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar allowPrintTime;
	
	/**
	 * 通知书编号
	 */
	@Column(length = 10)
	private String num;
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public Calendar getPrintTime() {
		return printTime;
	}

	public void setPrintTime(Calendar printTime) {
		this.printTime = printTime;
	}

	/**
	 * @return
	 * @uml.property  name="applyTender"
	 */
	public GgzyApplyTender getApplyTender() {
		return applyTender;
	}

	/**
	 * @param applyTender
	 * @uml.property  name="applyTender"
	 */
	public void setApplyTender(GgzyApplyTender applyTender) {
		this.applyTender = applyTender;
	}

	/**
	 * @return
	 * @uml.property  name="noticeType"
	 */
	public Character getNoticeType() {
		return noticeType;
	}

	/**
	 * @param noticeType
	 * @uml.property  name="noticeType"
	 */
	public void setNoticeType(Character noticeType) {
		this.noticeType = noticeType;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"applyTenderId").toString();
	}

	public GgzyRefTenderApplyPk getId() {
		return id;
	}

	public void setId(GgzyRefTenderApplyPk id) {
		this.id = id;
	}

	public GgzyTenders getTenders() {
		return tenders;
	}

	public void setTenders(GgzyTenders tenders) {
		this.tenders = tenders;
	}

	public Calendar getAllowPrintTime() {
		return allowPrintTime;
	}

	public void setAllowPrintTime(Calendar allowPrintTime) {
		this.allowPrintTime = allowPrintTime;
	}
	
}
