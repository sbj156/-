package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

/**
 * 现场勘探记录
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_PROSPECT_RECORD")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "applyTenderId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyProspectRecord")
public class GgzyProspectRecord  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -497817004555645441L;

	/**
	 * 
	 */
	@ManyToOne
	@JoinColumn(name = "APPLY_TENDER_ID", referencedColumnName = "APPLY_TENDER_ID")
	private GgzyApplyTender applyTender;

	/**
	 * 踏勘单位代表姓名
	 */
	@Column(name = "REPRESENTATIVE", length = 200)
	private String representative;

	/**
	 * 踏勘时间
	 */
	@Column(name = "PROSPECT_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM",pattern="yyyy-MM-dd")
	private Calendar prospectTime;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

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
	 * @uml.property  name="representative"
	 */
	public String getRepresentative() {
		return representative;
	}

	/**
	 * @param representative
	 * @uml.property  name="representative"
	 */
	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	/**
	 * @return
	 * @uml.property  name="prospectTime"
	 */
	public Calendar getProspectTime() {
		return prospectTime;
	}

	/**
	 * @param prospectTime
	 * @uml.property  name="prospectTime"
	 */
	public void setProspectTime(Calendar prospectTime) {
		this.prospectTime = prospectTime;
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

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"applyTenderId").toString();
	}
}
