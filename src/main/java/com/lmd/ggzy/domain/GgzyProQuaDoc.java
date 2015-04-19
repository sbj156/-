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
@RooJpaEntity(versionField = "", table = "GGZY_PRO_QUA_DOC")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyProQuaDoc")
public class GgzyProQuaDoc  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6613799862423131247L;

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
	 * @uml.property  name="appliQualification"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="APPLI_QUALIFICATION")
	private DataClob appliQualification;

	/**
	 * @uml.property  name="applyValidity"
	 */
	@Column(name = "APPLY_VALIDITY", length = 200)
	private String applyValidity;

	/**
	 * @uml.property  name="applyDocDeliveryEndtime"
	 */
	@Column(name = "APPLY_DOC_DELIVERY_ENDTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar applyDocDeliveryEndtime;

	/**
	 * @uml.property  name="applyDocDeliveryWay"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="APPLY_DOC_DELIVERY_WAY")
	private DataClob applyDocDeliveryWay;

	/**
	 * @uml.property  name="applyDocOpenTime"
	 */
	@Column(name = "APPLY_DOC_OPEN_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar applyDocOpenTime;

	/**
	 * @uml.property  name="applyDocOpenWay"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="APPLY_DOC_OPEN_WAY")
	private DataClob applyDocOpenWay;

	/**
	 * @uml.property  name="reviewMethod"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="REVIEW_METHOD")
	private DataClob reviewMethod;

	/**
	 * @uml.property  name="docMainContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="DOC_MAIN_CONTENT")
	private DataClob docMainContent;

	/**
	 * @uml.property  name="subTime"
	 */
	@Column(name = "SUB_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar subTime;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

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
	 * @uml.property  name="applyValidity"
	 */
	public String getApplyValidity() {
		return applyValidity;
	}

	/**
	 * @param applyValidity
	 * @uml.property  name="applyValidity"
	 */
	public void setApplyValidity(String applyValidity) {
		this.applyValidity = applyValidity;
	}

	/**
	 * @return
	 * @uml.property  name="applyDocDeliveryEndtime"
	 */
	public Calendar getApplyDocDeliveryEndtime() {
		return applyDocDeliveryEndtime;
	}

	/**
	 * @param applyDocDeliveryEndtime
	 * @uml.property  name="applyDocDeliveryEndtime"
	 */
	public void setApplyDocDeliveryEndtime(Calendar applyDocDeliveryEndtime) {
		this.applyDocDeliveryEndtime = applyDocDeliveryEndtime;
	}


	/**
	 * @return
	 * @uml.property  name="applyDocOpenTime"
	 */
	public Calendar getApplyDocOpenTime() {
		return applyDocOpenTime;
	}

	/**
	 * @param applyDocOpenTime
	 * @uml.property  name="applyDocOpenTime"
	 */
	public void setApplyDocOpenTime(Calendar applyDocOpenTime) {
		this.applyDocOpenTime = applyDocOpenTime;
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
	 * @uml.property  name="appliQualification"
	 */
	public DataClob getAppliQualification() {
		return appliQualification;
	}

	/**
	 * @param appliQualification
	 * @uml.property  name="appliQualification"
	 */
	public void setAppliQualification(DataClob appliQualification) {
		this.appliQualification = appliQualification;
	}

	/**
	 * @return
	 * @uml.property  name="applyDocDeliveryWay"
	 */
	public DataClob getApplyDocDeliveryWay() {
		return applyDocDeliveryWay;
	}

	/**
	 * @param applyDocDeliveryWay
	 * @uml.property  name="applyDocDeliveryWay"
	 */
	public void setApplyDocDeliveryWay(DataClob applyDocDeliveryWay) {
		this.applyDocDeliveryWay = applyDocDeliveryWay;
	}

	/**
	 * @return
	 * @uml.property  name="applyDocOpenWay"
	 */
	public DataClob getApplyDocOpenWay() {
		return applyDocOpenWay;
	}

	/**
	 * @param applyDocOpenWay
	 * @uml.property  name="applyDocOpenWay"
	 */
	public void setApplyDocOpenWay(DataClob applyDocOpenWay) {
		this.applyDocOpenWay = applyDocOpenWay;
	}

	/**
	 * @return
	 * @uml.property  name="reviewMethod"
	 */
	public DataClob getReviewMethod() {
		return reviewMethod;
	}

	/**
	 * @param reviewMethod
	 * @uml.property  name="reviewMethod"
	 */
	public void setReviewMethod(DataClob reviewMethod) {
		this.reviewMethod = reviewMethod;
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

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}

}
