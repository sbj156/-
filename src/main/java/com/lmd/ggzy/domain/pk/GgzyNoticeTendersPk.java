package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

import freemarker.template.utility.StringUtil;

@Configurable
@Embeddable
@RooIdentifier(dbManaged = true)
public class GgzyNoticeTendersPk implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 3547152693038505178L;

	/**
	 * @uml.property  name="tendersId"
	 */
	@Column(name = "TENDERS_ID", nullable = false, length = 32)
	private String tendersId;
	
	/**
	 * @uml.property  name="scoreTypeId"
	 */
	@Column(name = "NOTICE_ID", nullable = false, length = 32)
	private String noticeId;

	
	public GgzyNoticeTendersPk(String tendersId, String noticeId) {
		super();
		this.tendersId = tendersId;
		this.noticeId = noticeId;
	}


	public String getTendersId() {
		return tendersId;
	}


	public void setTendersId(String tendersId) {
		this.tendersId = tendersId;
	}


	public String getNoticeId() {
		return noticeId;
	}


	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}


	public GgzyNoticeTendersPk(){}


	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof GgzyNoticeTendersPk){
			GgzyNoticeTendersPk pk = (GgzyNoticeTendersPk)obj;
			return StringUtils.equals(pk.getNoticeId(), this.noticeId) && StringUtils.equals(pk.getTendersId(), this.tendersId);
		};
		return super.equals(obj);
	}
	
	
}
