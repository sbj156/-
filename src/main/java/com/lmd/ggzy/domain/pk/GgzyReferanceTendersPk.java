package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

@RooIdentifier(dbManaged = true)
@Configurable
@Embeddable
public class GgzyReferanceTendersPk implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2217434604868878342L;
	@Column(name = "TENDERS_ID", length = 32, nullable = false)
	private String tendersId;

	public String getTendersId() {
		return tendersId;
	}

	public void setTendersId(String tendersId) {
		this.tendersId = tendersId;
	}

	public GgzyReferanceTendersPk(String tendersId) {
		super();
		this.tendersId = tendersId;
	}

	public GgzyReferanceTendersPk() {
		super();
	}
	
	
}
