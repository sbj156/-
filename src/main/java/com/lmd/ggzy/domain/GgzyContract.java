package com.lmd.ggzy.domain;

import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@RooJpaEntity(versionField = "", table = "GGZY_CONTRACT")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "bidPublicityId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyContract")
public class GgzyContract  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4453633449627341363L;

	/**
	 * @uml.property  name="bidPublicity"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "BID_PUBLICITY_ID", referencedColumnName = "BID_PUBLICITY_ID")
	private GgzyBidPublicity bidPublicity;

	/**
	 * @uml.property  name="tendereeCode"
	 */
	@Column(name = "TENDEREE_CODE", length = 9)
	private String tendereeCode;

	/**
	 * @uml.property  name="contractPeriod"
	 */
	@Column(name = "CONTRACT_PERIOD", precision = 4)
	private BigDecimal contractPeriod;

	/**
	 * @uml.property  name="qualityLevel"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="QUALITY_LEVEL")
	private DataClob qualityLevel;

	/**
	 * @uml.property  name="contractMainContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="CONTRACT_MAIN_CONTENT")
	private DataClob contractMainContent;

	/**
	 * @uml.property  name="signingTime"
	 */
	@Column(name = "SIGNING_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar signingTime;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property  name="settlementAmount"
	 */
	@Column(name = "SETTLEMENT_AMOUNT", precision = 20, scale = 2)
	private BigDecimal settlementAmount;

	/**
	 * @uml.property  name="performanceChangeContent"
	 */
	@Column(name = "PERFORMANCE_CHANGE_CONTENT")
	@Lob
	private String performanceChangeContent;

	/**
	 * @uml.property  name="contractCompleteTime"
	 */
	@Column(name = "CONTRACT_COMPLETE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar contractCompleteTime;

	/**
	 * @uml.property  name="performancePeriod"
	 */
	@Column(name = "PERFORMANCE_PERIOD", precision = 4)
	private BigDecimal performancePeriod;

	/**
	 * @uml.property  name="inviteTime"
	 */
	@Column(name = "INVITE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar inviteTime;


	/**
	 * @return
	 * @uml.property  name="bidPublicity"
	 */
	public GgzyBidPublicity getBidPublicity() {
		return bidPublicity;
	}

	/**
	 * @param bidPublicity
	 * @uml.property  name="bidPublicity"
	 */
	public void setBidPublicity(GgzyBidPublicity bidPublicity) {
		this.bidPublicity = bidPublicity;
	}

	/**
	 * @return
	 * @uml.property  name="tendereeCode"
	 */
	public String getTendereeCode() {
		return tendereeCode;
	}

	/**
	 * @param tendereeCode
	 * @uml.property  name="tendereeCode"
	 */
	public void setTendereeCode(String tendereeCode) {
		this.tendereeCode = tendereeCode;
	}

	/**
	 * @return
	 * @uml.property  name="contractPeriod"
	 */
	public BigDecimal getContractPeriod() {
		return contractPeriod;
	}

	/**
	 * @param contractPeriod
	 * @uml.property  name="contractPeriod"
	 */
	public void setContractPeriod(BigDecimal contractPeriod) {
		this.contractPeriod = contractPeriod;
	}


	/**
	 * @return
	 * @uml.property  name="qualityLevel"
	 */
	public DataClob getQualityLevel() {
		return qualityLevel;
	}

	/**
	 * @param qualityLevel
	 * @uml.property  name="qualityLevel"
	 */
	public void setQualityLevel(DataClob qualityLevel) {
		this.qualityLevel = qualityLevel;
	}

	/**
	 * @return
	 * @uml.property  name="contractMainContent"
	 */
	public DataClob getContractMainContent() {
		return contractMainContent;
	}

	/**
	 * @param contractMainContent
	 * @uml.property  name="contractMainContent"
	 */
	public void setContractMainContent(DataClob contractMainContent) {
		this.contractMainContent = contractMainContent;
	}

	/**
	 * @return
	 * @uml.property  name="signingTime"
	 */
	public Calendar getSigningTime() {
		return signingTime;
	}

	/**
	 * @param signingTime
	 * @uml.property  name="signingTime"
	 */
	public void setSigningTime(Calendar signingTime) {
		this.signingTime = signingTime;
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
	 * @uml.property  name="settlementAmount"
	 */
	public BigDecimal getSettlementAmount() {
		return settlementAmount;
	}

	/**
	 * @param settlementAmount
	 * @uml.property  name="settlementAmount"
	 */
	public void setSettlementAmount(BigDecimal settlementAmount) {
		this.settlementAmount = settlementAmount;
	}

	/**
	 * @return
	 * @uml.property  name="performanceChangeContent"
	 */
	public String getPerformanceChangeContent() {
		return performanceChangeContent;
	}

	/**
	 * @param performanceChangeContent
	 * @uml.property  name="performanceChangeContent"
	 */
	public void setPerformanceChangeContent(String performanceChangeContent) {
		this.performanceChangeContent = performanceChangeContent;
	}

	/**
	 * @return
	 * @uml.property  name="contractCompleteTime"
	 */
	public Calendar getContractCompleteTime() {
		return contractCompleteTime;
	}

	/**
	 * @param contractCompleteTime
	 * @uml.property  name="contractCompleteTime"
	 */
	public void setContractCompleteTime(Calendar contractCompleteTime) {
		this.contractCompleteTime = contractCompleteTime;
	}

	/**
	 * @return
	 * @uml.property  name="performancePeriod"
	 */
	public BigDecimal getPerformancePeriod() {
		return performancePeriod;
	}

	/**
	 * @param performancePeriod
	 * @uml.property  name="performancePeriod"
	 */
	public void setPerformancePeriod(BigDecimal performancePeriod) {
		this.performancePeriod = performancePeriod;
	}

	/**
	 * @return
	 * @uml.property  name="inviteTime"
	 */
	public Calendar getInviteTime() {
		return inviteTime;
	}

	/**
	 * @param inviteTime
	 * @uml.property  name="inviteTime"
	 */
	public void setInviteTime(Calendar inviteTime) {
		this.inviteTime = inviteTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"bidPublicityId").toString();
	}

}
