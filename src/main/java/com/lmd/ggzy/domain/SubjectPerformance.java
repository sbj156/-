package com.lmd.ggzy.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 招标人/招标代理机构电子招标业绩
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "SUBJECT_PERFORMANCE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "biddingSubjectId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.SubjectPerformance")
public class SubjectPerformance  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7512033650117936537L;

	/**
	 * @uml.property  name="biddingSubject"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "BIDDING_SUBJECT_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject biddingSubject;

	/**
	 * @uml.property  name="organizationCode"
	 */
	@Column(name = "ORGANIZATION_CODE", length = 9)
	private String organizationCode;

	/**
	 * @uml.property  name="bidProCode"
	 */
	@Column(name = "BID_PRO_CODE", length = 20)
	private String bidProCode;

	/**
	 * @uml.property  name="bidProName"
	 */
	@Column(name = "BID_PRO_NAME", length = 100)
	private String bidProName;

	/**
	 * @uml.property  name="tendereeCode"
	 */
	@Column(name = "TENDEREE_CODE", length = 9)
	private String tendereeCode;

	/**
	 * @return
	 * @uml.property  name="biddingSubject"
	 */
	public GgzyBiddingSubject getBiddingSubject() {
		return biddingSubject;
	}

	/**
	 * @param biddingSubject
	 * @uml.property  name="biddingSubject"
	 */
	public void setBiddingSubject(GgzyBiddingSubject biddingSubject) {
		this.biddingSubject = biddingSubject;
	}

	/**
	 * @return
	 * @uml.property  name="organizationCode"
	 */
	public String getOrganizationCode() {
		return organizationCode;
	}

	/**
	 * @param organizationCode
	 * @uml.property  name="organizationCode"
	 */
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}

	/**
	 * @return
	 * @uml.property  name="bidProCode"
	 */
	public String getBidProCode() {
		return bidProCode;
	}

	/**
	 * @param bidProCode
	 * @uml.property  name="bidProCode"
	 */
	public void setBidProCode(String bidProCode) {
		this.bidProCode = bidProCode;
	}

	/**
	 * @return
	 * @uml.property  name="bidProName"
	 */
	public String getBidProName() {
		return bidProName;
	}

	/**
	 * @param bidProName
	 * @uml.property  name="bidProName"
	 */
	public void setBidProName(String bidProName) {
		this.bidProName = bidProName;
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

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"biddingSubjectId").toString();
	}

}
