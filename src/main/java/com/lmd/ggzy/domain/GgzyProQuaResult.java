package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
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
/**
 * 资格预审结果
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_PRO_QUA_RESULT")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyProQuaResult")
public class GgzyProQuaResult  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3204554777153518902L;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch = FetchType.LAZY)
	private GgzyNotice notice;

	/**
	 * @uml.property  name="passList"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="PASS_LIST")
	private DataClob passList;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * @uml.property  name="resultTime"
	 */
	@Column(name = "RESULT_TIME", columnDefinition="timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar resultTime;

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

	/**
	 * @return
	 * @uml.property  name="passList"
	 */
	public DataClob getPassList() {
		return passList;
	}

	/**
	 * @param passList
	 * @uml.property  name="passList"
	 */
	public void setPassList(DataClob passList) {
		this.passList = passList;
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
	 * @uml.property  name="resultTime"
	 */
	public Calendar getResultTime() {
		return resultTime;
	}

	public GgzyNotice getNotice() {
		return notice;
	}

	public void setNotice(GgzyNotice notice) {
		this.notice = notice;
	}

	/**
	 * @param resultTime
	 * @uml.property  name="resultTime"
	 */
	public void setResultTime(Calendar resultTime) {
		this.resultTime = resultTime;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}
}
