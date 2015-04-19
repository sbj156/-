package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

@Configurable
@Embeddable
@RooIdentifier(dbManaged = true)
public class GgzyRefTenderApplyPk implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4488102873027334869L;

	/**
	 * 
	 */

	/**
	 * @uml.property  name="tendersId"
	 */
	@Column(name = "TENDERS_ID", nullable = false, length = 32)
	private String tendersId;
	
	/**
	 * @uml.property  name="scoreTypeId"
	 */
	@Column(name = "APPLY_TENDER_ID", nullable = false, length = 32)
	private String applyTenderId;
	
	@Column(name = "NOTICE_ID", nullable = false, length = 32)
	private String noticeId;

	
	/**
	 * @return
	 * @uml.property  name="tendersId"
	 */
	public String getTendersId() {
		return tendersId;
	}

	/**
	 * @param tendersId
	 * @uml.property  name="tendersId"
	 */
	public void setTendersId(String tendersId) {
		this.tendersId = tendersId;
	}


	public String getApplyTenderId() {
		return applyTenderId;
	}

	public void setApplyTenderId(String applyTenderId) {
		this.applyTenderId = applyTenderId;
	}

	public GgzyRefTenderApplyPk(String tendersId, String applyTenderId, String noticeId) {
		super();
		this.tendersId = tendersId;
		this.applyTenderId = applyTenderId;
		this.noticeId = noticeId;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public GgzyRefTenderApplyPk(){}
}
