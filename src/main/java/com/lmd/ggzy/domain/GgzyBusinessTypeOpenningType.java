package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;

import com.lmd.ggzy.domain.pk.GgzyBusinessOpenTypePk;

/**
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooJpaEntity(identifierType = GgzyBusinessOpenTypePk.class, versionField = "", table = "GGZY_BUSINESS_OPENNING_TYPE")
@RooDbManaged(automaticallyDelete = true)
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType")
@Entity
@Table(name = "GGZY_BUSINESS_OPENNING_TYPE")
public class GgzyBusinessTypeOpenningType {

	@EmbeddedId
	private GgzyBusinessOpenTypePk id;

	@Column
	private int sortIndex;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BUSINESS_TYPE_ID", insertable = false, nullable = false, updatable = false)
	private GgzyBusinessType businessType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OPENNING_TYPE_ID", insertable = false, nullable = false, updatable = false)
	private BidOpenningType openningType;

	public GgzyBusinessOpenTypePk getId() {
		return id;
	}

	public void setId(GgzyBusinessOpenTypePk id) {
		this.id = id;
	}

	public int getSortIndex() {
		return sortIndex;
	}

	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}

	public GgzyBusinessType getBusinessType() {
		return businessType;
	}

	public void setBusinessType(GgzyBusinessType businessType) {
		this.businessType = businessType;
	}

	public BidOpenningType getOpenningType() {
		return openningType;
	}

	public void setOpenningType(BidOpenningType openningType) {
		this.openningType = openningType;
	}

}
