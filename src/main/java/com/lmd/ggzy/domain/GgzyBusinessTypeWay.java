package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.pk.GgzyBusinessTypeWayPK;

@RooJavaBean
@RooJpaEntity(identifierType = GgzyBusinessTypeWayPK.class, versionField = "", table = "GGZY_BUSINESS_TYPE_WAY")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "businessTypeId", "businessWayId" })
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBusinessTypeWay")
public class GgzyBusinessTypeWay  {

	/**
	 *
	 */
	private static final long serialVersionUID = 6691829526472292857L;

	/**
	 * @uml.property  name="id"
	 * @uml.associationEnd
	 */
	@EmbeddedId
	private GgzyBusinessTypeWayPK id;

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public GgzyBusinessTypeWayPK getId() {
		return this.id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(GgzyBusinessTypeWayPK id) {
		this.id = id;
	}

	/**
	 * @uml.property  name="businessType"
	 * @uml.associationEnd
	 */
	@ManyToOne
	@JoinColumn(name = "BUSINESS_TYPE_ID", referencedColumnName = "BUSINESS_TYPE_ID", nullable = false, insertable = false, updatable = false)
	private GgzyBusinessType businessType;

	/**
	 * @uml.property  name="businessWay"
	 * @uml.associationEnd
	 */
	@ManyToOne
	@JoinColumn(name = "BUSINESS_WAY_ID", referencedColumnName = "BUSINESS_WAY_ID", nullable = false, insertable = false, updatable = false)
	private GgzyBusinessWay businessWay;

	/**
	 * @uml.property  name="sortIndex"
	 */
	@Column(name = "SORT_INDEX", precision = 22)
	private BigDecimal sortIndex;

	/**
	 * @return
	 * @uml.property  name="businessType"
	 */
	public GgzyBusinessType getBusinessType() {
		return businessType;
	}

	/**
	 * @param businessTypeId
	 * @uml.property  name="businessType"
	 */
	public void setBusinessType(GgzyBusinessType businessTypeId) {
		this.id.setBusinessTypeId(businessTypeId.getBusinessTypeId());
		this.businessType = businessTypeId;
	}

	/**
	 * @return
	 * @uml.property  name="businessWay"
	 */
	public GgzyBusinessWay getBusinessWay() {
		return businessWay;
	}

	/**
	 * @param businessWayId
	 * @uml.property  name="businessWay"
	 */
	public void setBusinessWay(GgzyBusinessWay businessWayId) {
		this.id.setBusinessWayId(businessWayId.getBusinessWayId());
		this.businessWay = businessWayId;
	}

	/**
	 * @return
	 * @uml.property  name="sortIndex"
	 */
	public BigDecimal getSortIndex() {
		return sortIndex;
	}

	/**
	 * @param sortIndex
	 * @uml.property  name="sortIndex"
	 */
	public void setSortIndex(BigDecimal sortIndex) {
		this.sortIndex = sortIndex;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"businessTypeId", "businessWayId").toString();
	}

}
