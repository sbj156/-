package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

@RooIdentifier(dbManaged = true)
@Embeddable
@Configurable
public class GgzyExpertScorePk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6264249105804934809L;

	/**
	 * @uml.property  name="applyTenderId"
	 */
	@Column(name = "APPLY_TENDER_ID", nullable = false, length = 32)
	private String applyTenderId;
	
	/**
	 * @uml.property  name="expertId"
	 */
	@Column(name = "EXPERT_ID", nullable = false, length = 32)
	private String expertId;
	

	public GgzyExpertScorePk(){}

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
	 * @uml.property  name="expertId"
	 */
	public String getExpertId() {
		return expertId;
	}

	/**
	 * @param expertId
	 * @uml.property  name="expertId"
	 */
	public void setExpertId(String expertId) {
		this.expertId = expertId;
	}

	public GgzyExpertScorePk(String applyTenderId, String expertId) {
		super();
		this.applyTenderId = applyTenderId;
		this.expertId = expertId;
	}

}
