package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.PrimaryKeyJoinColumns;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

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
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BID_OPENING")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBidOpening")
public class GgzyBidOpening  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1294339903921247910L;

	@EmbeddedId
	private GgzyNoticeTendersPk id;
	/**
	 * @uml.property  name="openningType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BID_OPENNING_TYPE_ID")
	private BidOpenningType openningType;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", nullable = false, insertable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", nullable = false, insertable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;
	
	/**
	 * 报价单位
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRICE_UNIT", columnDefinition = "NUMBER DEFAULT 12425")
	private GgzyTreeLib priceUnit;

	/**
	 * @uml.property  name="bidParticipant"
	 */
	@Column(name = "BID_PARTICIPANT", length = 500)
	private String bidParticipant;

	/**
	 * @uml.property  name="bidContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_CONTENT")
	private DataClob bidContent;

	/**
	 * @uml.property  name="bidTime"
	 */
	@Column(name = "recordTime", columnDefinition="timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar recordTime;

	
	/**
	 * 唱标人
	 */
	@Column(length = 50)
	private String bidPerson;
	
	/**
	 * 见证人
	 */
	@Column(length = 50)
	private String witness;
	
	/**
	 * 监督人
	 */
	@Column(length = 50)
	private String supervisors;
	
	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @return
	 * @uml.property  name="openningType"
	 */
	public BidOpenningType getOpenningType() {
		return openningType;
	}

	/**
	 * @param openningType
	 * @uml.property  name="openningType"
	 */
	public void setOpenningType(BidOpenningType openningType) {
		this.openningType = openningType;
	}

	/**
	 * @return
	 * @uml.property  name="bidParticipant"
	 */
	public String getBidParticipant() {
		return bidParticipant;
	}

	/**
	 * @param bidParticipant
	 * @uml.property  name="bidParticipant"
	 */
	public void setBidParticipant(String bidParticipant) {
		this.bidParticipant = bidParticipant;
	}

	
	public Calendar getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Calendar recordTime) {
		this.recordTime = recordTime;
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
				"tendersId").toString();
	}

	/**
	 * @return
	 * @uml.property  name="bidContent"
	 */
	public DataClob getBidContent() {
		return bidContent;
	}

	/**
	 * @param bidContent
	 * @uml.property  name="bidContent"
	 */
	public void setBidContent(DataClob bidContent) {
		this.bidContent = bidContent;
	}

	public GgzyTreeLib getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(GgzyTreeLib priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getBidPerson() {
		return bidPerson;
	}

	public void setBidPerson(String bidPerson) {
		this.bidPerson = bidPerson;
	}

	public String getWitness() {
		return witness;
	}

	public void setWitness(String witness) {
		this.witness = witness;
	}

	public String getSupervisors() {
		return supervisors;
	}

	public void setSupervisors(String supervisors) {
		this.supervisors = supervisors;
	}

	public GgzyNoticeTendersPk getId() {
		return id;
	}

	public void setId(GgzyNoticeTendersPk id) {
		this.id = id;
	}

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}
	
	
}
