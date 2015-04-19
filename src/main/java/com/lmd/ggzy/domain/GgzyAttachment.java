package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
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

import com.lmd.ggzy.domain.data.DataBlob;

@RooJavaBean
@RooToString
@RooJpaEntity(versionField = "", table = "GGZY_ATTACHMENT")
@RooDbManaged(automaticallyDelete = true)
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyAttachment")
public class GgzyAttachment  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2033001916994748618L;

	/**
	 * @uml.property  name="uplodTime"
	 */
	@Column(name = "UPLOD_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM")
	private Calendar uplodTime;

	/**
	 * @uml.property  name="attachmentName"
	 */
	@Column(name = "ATTACHMENT_NAME", length = 100)
	private String attachmentName;

	/**
	 * @uml.property  name="attachmentContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="ATTACHMENT_CONTENT")
	private DataBlob attachmentContent;

	/**
	 * @uml.property  name="eSignature"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="E_SIGNATURE")
	private DataBlob eSignature;

	/**
	 * @uml.property  name="publicKey"
	 */
	@Column(name = "PUBLIC_KEY", length = 8)
	private String publicKey;

	/**
	 * @return
	 * @uml.property  name="uplodTime"
	 */
	public Calendar getUplodTime() {
		return uplodTime;
	}

	/**
	 * @param uplodTime
	 * @uml.property  name="uplodTime"
	 */
	public void setUplodTime(Calendar uplodTime) {
		this.uplodTime = uplodTime;
	}

	/**
	 * @return
	 * @uml.property  name="attachmentName"
	 */
	public String getAttachmentName() {
		return attachmentName;
	}

	/**
	 * @param attachmentName
	 * @uml.property  name="attachmentName"
	 */
	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	/**
	 * @return
	 * @uml.property  name="attachmentContent"
	 */
	public DataBlob getAttachmentContent() {
		return attachmentContent;
	}

	/**
	 * @param attachmentContent
	 * @uml.property  name="attachmentContent"
	 */
	public void setAttachmentContent(DataBlob attachmentContent) {
		this.attachmentContent = attachmentContent;
	}

	/**
	 * @return
	 * @uml.property  name="eSignature"
	 */
	public DataBlob geteSignature() {
		return eSignature;
	}

	/**
	 * @param eSignature
	 * @uml.property  name="eSignature"
	 */
	public void seteSignature(DataBlob eSignature) {
		this.eSignature = eSignature;
	}

	/**
	 * @return
	 * @uml.property  name="publicKey"
	 */
	public String getPublicKey() {
		return publicKey;
	}

	/**
	 * @param publicKey
	 * @uml.property  name="publicKey"
	 */
	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}
	
	  public String toString() {
	        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
	    }
}
