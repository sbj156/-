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
@RooJpaEntity(versionField = "", table = "GGZY_PROSPECT_NOTICE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyProspectNotice")
public class GgzyProspectNotice  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -360378206726936768L;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
	private GgzyTenders tenders;

	/**
	 * @uml.property  name="noticeContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="NOTICE_CONTENT")
	private DataClob noticeContent;

	/**
	 * @uml.property  name="publishTime"
	 */
	@Column(name = "PUBLISH_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM",pattern="yyyy-MM-dd")
	private Calendar publishTime;

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
	 * @uml.property  name="noticeContent"
	 */
	public DataClob getNoticeContent() {
		return noticeContent;
	}

	/**
	 * @param noticeContent
	 * @uml.property  name="noticeContent"
	 */
	public void setNoticeContent(DataClob noticeContent) {
		this.noticeContent = noticeContent;
	}

	/**
	 * @return
	 * @uml.property  name="publishTime"
	 */
	public Calendar getPublishTime() {
		return publishTime;
	}

	/**
	 * @param publishTime
	 * @uml.property  name="publishTime"
	 */
	public void setPublishTime(Calendar publishTime) {
		this.publishTime = publishTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}
}
