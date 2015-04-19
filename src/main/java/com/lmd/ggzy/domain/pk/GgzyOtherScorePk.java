package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;

@Configurable
@Embeddable
public class GgzyOtherScorePk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4685897435547717749L;

	/**
	 * @uml.property  name="applyTenderId"
	 */
	@Column(name = "APPLY_TENDER_ID", nullable = false, length = 32)
	private String applyTenderId;
	

	/**
	 * @uml.property  name="tendersId"
	 */
	@Column(name = "TENDERS_ID", nullable = false, length = 32)
	private String tendersId;
	
	@Column(name = "NOTICE_ID", nullable = false, length = 32)
	private String noticeId;
	
	/**
	 * @uml.property  name="scoreTypeId"
	 */
	@Column(name = "SCORE_TYPE_ID", nullable = false)
	private Long scoreTypeId;

	/**
	 * @return
	 * @uml.property  name="applyTenderId"
	 */
	public String getApplyTenderId() {
		return applyTenderId;
	}

	/**
	 * @param applyTenderId
	 * @uml.property  name="applyTenderId"
	 */
	public void setApplyTenderId(String applyTenderId) {
		this.applyTenderId = applyTenderId;
	}

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

	/**
	 * @return
	 * @uml.property  name="scoreTypeId"
	 */
	public Long getScoreTypeId() {
		return scoreTypeId;
	}

	/**
	 * @param scoreTypeId
	 * @uml.property  name="scoreTypeId"
	 */
	public void setScoreTypeId(Long scoreTypeId) {
		this.scoreTypeId = scoreTypeId;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	
}
