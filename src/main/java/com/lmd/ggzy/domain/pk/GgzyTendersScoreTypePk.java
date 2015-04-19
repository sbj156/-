package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

@Configurable
@Embeddable
@RooIdentifier(dbManaged = true)
public class GgzyTendersScoreTypePk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2569649437186038248L;

	/**
	 * @uml.property  name="tendersId"
	 */
	@Column(name = "TENDERS_ID", nullable = false, length = 32)
	private String tendersId;
	
	/**
	 * @uml.property  name="scoreTypeId"
	 */
	@Column(name = "SCORE_TYPE_ID", nullable = false)
	private Long scoreTypeId;

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

	public GgzyTendersScoreTypePk(String tendersId,String noticeId, Long scoreTypeId) {
		super();
		this.tendersId = tendersId;
		this.scoreTypeId = scoreTypeId;
		this.noticeId = noticeId;
	}
	
	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public GgzyTendersScoreTypePk(){}
}
