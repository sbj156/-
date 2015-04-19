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
@RooJpaEntity(versionField = "", table = "GGZY_QUA_RES_NOTICE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "proQuaApplyDocId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyQuaResNotice")
public class GgzyQuaResNotice  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8621596163540381852L;

	/**
	 * @uml.property  name="proQuaApplyDoc"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "PRO_QUA_APPLY_DOC_ID", referencedColumnName = "PRO_QUA_APPLY_DOC_ID")
	private GgzyProQuaApplyDoc proQuaApplyDoc;

	/**
	 * @uml.property  name="noticeContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="NOTICE_CONTENT")
	private DataClob noticeContent;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property  name="inviteTime"
	 */
	@Column(name = "INVITE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar inviteTime;

	/**
	 * @return
	 * @uml.property  name="proQuaApplyDoc"
	 */
	public GgzyProQuaApplyDoc getProQuaApplyDoc() {
		return proQuaApplyDoc;
	}

	/**
	 * @param proQuaApplyDoc
	 * @uml.property  name="proQuaApplyDoc"
	 */
	public void setProQuaApplyDoc(GgzyProQuaApplyDoc proQuaApplyDoc) {
		this.proQuaApplyDoc = proQuaApplyDoc;
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
				"proQuaApplyDocId").toString();
	}

}
