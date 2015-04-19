package com.lmd.ggzy.domain;

import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.domain.pk.GgzyRefTenderApplyPk;
import com.lmd.ggzy.domain.pk.GgzyReferanceTendersPk;

/**
 * 交易服务费
 * 
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_TRADING_SERVICES_FEE")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyTradingServicesFees")
@Entity
@Table(name = "GGZY_TRADING_SERVICES_FEE")
public class GgzyTradingServicesFees {

	@EmbeddedId
	private GgzyNoticeTendersPk id ;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID",insertable = false, nullable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID",insertable = false, nullable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;
	
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID",insertable = false, nullable = false, updatable = false)
	private GgzyTenders tenders;
	
	/**
	 * 交易服务费收费比例
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FEE_SCALE", referencedColumnName = "ID")
	private GgzyTreeLib feeScale;
	
	/**
	 * 交易服务费支付形势
	 */
	@Column(length = 100)
	private String feeWay;

	/**
	 * 交易服务费币种
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FEE_CURRENCY", referencedColumnName = "ID")
	private GgzyTreeLib feeCurrency;

	/**
	 * 交易服务费单位
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FEE_UNIT", referencedColumnName = "ID")
	private GgzyTreeLib feelUnit;

	/**
	 * 交易服务费金额
	 */
	@Column(name = "FEE", precision = 20, scale = 2)
	private BigDecimal fee;

	/**
	 * 甲方交纳金额
	 */
	@Column(name = "A_FEE", precision = 20, scale = 2)
	private BigDecimal aFee;

	/**
	 * 乙方交纳金额
	 */
	@Column(name = "B_FEE", precision = 20, scale = 2)
	private BigDecimal bFee;

	/**
	 * 交纳时间
	 */
	@Column(name = "RECEIVE_TIME", columnDefinition = "timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar receiveTime;

	
	public GgzyTreeLib getFeeScale() {
		return feeScale;
	}

	public void setFeeScale(GgzyTreeLib feeScale) {
		this.feeScale = feeScale;
	}

	public String getFeeWay() {
		return feeWay;
	}

	public void setFeeWay(String feeWay) {
		this.feeWay = feeWay;
	}

	public GgzyTreeLib getFeeCurrency() {
		return feeCurrency;
	}

	public void setFeeCurrency(GgzyTreeLib feeCurrency) {
		this.feeCurrency = feeCurrency;
	}

	public GgzyTreeLib getFeelUnit() {
		return feelUnit;
	}

	public void setFeelUnit(GgzyTreeLib feelUnit) {
		this.feelUnit = feelUnit;
	}

	public BigDecimal getFee() {
		return fee;
	}

	public void setFee(BigDecimal fee) {
		this.fee = fee;
	}


	public BigDecimal getaFee() {
		return aFee;
	}

	public void setaFee(BigDecimal aFee) {
		this.aFee = aFee;
	}

	public BigDecimal getbFee() {
		return bFee;
	}

	public void setbFee(BigDecimal bFee) {
		this.bFee = bFee;
	}

	public Calendar getReceiveTime() {
		return receiveTime;
	}

	public void setReceiveTime(Calendar receiveTime) {
		this.receiveTime = receiveTime;
	}


	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	public GgzyNoticeTendersPk getId() {
		return id;
	}

	public void setId(GgzyNoticeTendersPk id) {
		this.id = id;
	}

	public GgzyTenders getTenders() {
		return tenders;
	}

	public void setTenders(GgzyTenders tenders) {
		this.tenders = tenders;
	}

	

	
}
