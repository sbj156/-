package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.math.BigDecimal;
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
@RooJpaEntity(versionField = "", table = "GGZY_TENDER_DOC")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyTenderDoc")
public class GgzyTenderDoc  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1178150587995273494L;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
	private GgzyTenders tenders;

	/**
	 * @uml.property  name="docCode"
	 */
	@Column(name = "DOC_CODE", length = 50)
	private String docCode;

	/**
	 * @uml.property  name="bidQualification"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_QUALIFICATION")
	private DataClob bidQualification;

	/**
	 * @uml.property  name="bidValidity"
	 */
	@Column(name = "BID_VALIDITY", precision = 3)
	private BigDecimal bidValidity;

	/**
	 * @uml.property  name="bidDocDeliveryEndtime"
	 */
	@Column(name = "BID_DOC_DELIVERY_ENDTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar bidDocDeliveryEndtime;

	/**
	 * @uml.property  name="bidDocDeliveryWay"
	 */
	@Column(name = "BID_DOC_DELIVERY_WAY", length = 200)
	private String bidDocDeliveryWay;

	/**
	 * @uml.property  name="bidBond"
	 */
	@Column(name = "BID_BOND", precision = 10, scale = 2)
	private BigDecimal bidBond;

	/**
	 * @uml.property  name="bidBondCurrency"
	 */
	@Column(name = "BID_BOND_CURRENCY", length = 3)
	private String bidBondCurrency;

	/**
	 * @uml.property  name="bidBondUnit"
	 */
	@Column(name = "BID_BOND_UNIT")
	private Character bidBondUnit;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property  name="evaluationMethod"
	 */
	@Column(name = "EVALUATION_METHOD", length = 200)
	private String evaluationMethod;

	/**
	 * @uml.property  name="bidTime"
	 */
	@Column(name = "BID_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar bidTime;

	/**
	 * @uml.property  name="bidWay"
	 */
	@Column(name = "BID_WAY", length = 200)
	private String bidWay;

	/**
	 * @uml.property  name="qualificationExamineTime"
	 */
	@Column(name = "QUALIFICATION_EXAMINE_TIME", length = 200)
	private String qualificationExamineTime;

	/**
	 * @uml.property  name="qaClarifyTime"
	 */
	@Column(name = "QA_CLARIFY_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar qaClarifyTime;

	/**
	 * @uml.property  name="docMainContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="DOC_MAIN_CONTENT")
	private DataClob docMainContent;

	/**
	 * @uml.property  name="deliveryTime"
	 */
	@Column(name = "DELIVERY_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar deliveryTime;

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
	 * @uml.property  name="docCode"
	 */
	public String getDocCode() {
		return docCode;
	}

	/**
	 * @param docCode
	 * @uml.property  name="docCode"
	 */
	public void setDocCode(String docCode) {
		this.docCode = docCode;
	}

	/**
	 * @return
	 * @uml.property  name="bidValidity"
	 */
	public BigDecimal getBidValidity() {
		return bidValidity;
	}

	/**
	 * @param bidValidity
	 * @uml.property  name="bidValidity"
	 */
	public void setBidValidity(BigDecimal bidValidity) {
		this.bidValidity = bidValidity;
	}

	/**
	 * @return
	 * @uml.property  name="bidDocDeliveryEndtime"
	 */
	public Calendar getBidDocDeliveryEndtime() {
		return bidDocDeliveryEndtime;
	}

	/**
	 * @param bidDocDeliveryEndtime
	 * @uml.property  name="bidDocDeliveryEndtime"
	 */
	public void setBidDocDeliveryEndtime(Calendar bidDocDeliveryEndtime) {
		this.bidDocDeliveryEndtime = bidDocDeliveryEndtime;
	}

	/**
	 * @return
	 * @uml.property  name="bidDocDeliveryWay"
	 */
	public String getBidDocDeliveryWay() {
		return bidDocDeliveryWay;
	}

	/**
	 * @param bidDocDeliveryWay
	 * @uml.property  name="bidDocDeliveryWay"
	 */
	public void setBidDocDeliveryWay(String bidDocDeliveryWay) {
		this.bidDocDeliveryWay = bidDocDeliveryWay;
	}

	/**
	 * @return
	 * @uml.property  name="bidBond"
	 */
	public BigDecimal getBidBond() {
		return bidBond;
	}

	/**
	 * @param bidBond
	 * @uml.property  name="bidBond"
	 */
	public void setBidBond(BigDecimal bidBond) {
		this.bidBond = bidBond;
	}

	/**
	 * @return
	 * @uml.property  name="bidBondCurrency"
	 */
	public String getBidBondCurrency() {
		return bidBondCurrency;
	}

	/**
	 * @param bidBondCurrency
	 * @uml.property  name="bidBondCurrency"
	 */
	public void setBidBondCurrency(String bidBondCurrency) {
		this.bidBondCurrency = bidBondCurrency;
	}

	/**
	 * @return
	 * @uml.property  name="bidBondUnit"
	 */
	public Character getBidBondUnit() {
		return bidBondUnit;
	}

	/**
	 * @param bidBondUnit
	 * @uml.property  name="bidBondUnit"
	 */
	public void setBidBondUnit(Character bidBondUnit) {
		this.bidBondUnit = bidBondUnit;
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
	 * @uml.property  name="evaluationMethod"
	 */
	public String getEvaluationMethod() {
		return evaluationMethod;
	}

	/**
	 * @param evaluationMethod
	 * @uml.property  name="evaluationMethod"
	 */
	public void setEvaluationMethod(String evaluationMethod) {
		this.evaluationMethod = evaluationMethod;
	}

	/**
	 * @return
	 * @uml.property  name="bidTime"
	 */
	public Calendar getBidTime() {
		return bidTime;
	}

	/**
	 * @param bidTime
	 * @uml.property  name="bidTime"
	 */
	public void setBidTime(Calendar bidTime) {
		this.bidTime = bidTime;
	}

	/**
	 * @return
	 * @uml.property  name="bidWay"
	 */
	public String getBidWay() {
		return bidWay;
	}

	/**
	 * @param bidWay
	 * @uml.property  name="bidWay"
	 */
	public void setBidWay(String bidWay) {
		this.bidWay = bidWay;
	}

	/**
	 * @return
	 * @uml.property  name="qualificationExamineTime"
	 */
	public String getQualificationExamineTime() {
		return qualificationExamineTime;
	}

	/**
	 * @param qualificationExamineTime
	 * @uml.property  name="qualificationExamineTime"
	 */
	public void setQualificationExamineTime(String qualificationExamineTime) {
		this.qualificationExamineTime = qualificationExamineTime;
	}

	/**
	 * @return
	 * @uml.property  name="qaClarifyTime"
	 */
	public Calendar getQaClarifyTime() {
		return qaClarifyTime;
	}

	/**
	 * @param qaClarifyTime
	 * @uml.property  name="qaClarifyTime"
	 */
	public void setQaClarifyTime(Calendar qaClarifyTime) {
		this.qaClarifyTime = qaClarifyTime;
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
	 * @uml.property  name="docMainContent"
	 */
	public DataClob getDocMainContent() {
		return docMainContent;
	}

	/**
	 * @param docMainContent
	 * @uml.property  name="docMainContent"
	 */
	public void setDocMainContent(DataClob docMainContent) {
		this.docMainContent = docMainContent;
	}

	/**
	 * @return
	 * @uml.property  name="deliveryTime"
	 */
	public Calendar getDeliveryTime() {
		return deliveryTime;
	}

	/**
	 * @param deliveryTime
	 * @uml.property  name="deliveryTime"
	 */
	public void setDeliveryTime(Calendar deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}
}
