package com.lmd.ggzy.domain.pk;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;

/**
 * 
 * @author mh_cxp
 * 
 */
@Configurable
@Embeddable
@RooIdentifier(dbManaged = true)
public class GgzyBusinessOpenTypePk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7289616257074032095L;

	@Column(name = "OPENNING_TYPE_ID")
	private Long openningTypeId;

	@Column(name = "BUSINESS_TYPE_ID", length = 32)
	private String businessTypeId;

	public GgzyBusinessOpenTypePk() {
		super();
	}

	public GgzyBusinessOpenTypePk(Long openningTypeId, String businessTypeId) {
		super();
		this.openningTypeId = openningTypeId;
		this.businessTypeId = businessTypeId;
	}

	public Long getOpenningTypeId() {
		return openningTypeId;
	}

	public void setOpenningTypeId(Long openningTypeId) {
		this.openningTypeId = openningTypeId;
	}

	public String getBusinessTypeId() {
		return businessTypeId;
	}

	public void setBusinessTypeId(String businessTypeId) {
		this.businessTypeId = businessTypeId;
	}

}
