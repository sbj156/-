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
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.pk.GgzyBusinessTypeMajorPK;

@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBusinessTypeMajor")
public class GgzyBusinessTypeMajor  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7858832201107899815L;

	/**
	 * @uml.property  name="id"
	 * @uml.associationEnd  
	 */
	@EmbeddedId
	private GgzyBusinessTypeMajorPK id;

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public GgzyBusinessTypeMajorPK getId() {
		return this.id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(GgzyBusinessTypeMajorPK id) {
		this.id = id;
	}

	/**
	 * @uml.property  name="majorType"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "MAJOR_TYPE_ID", referencedColumnName = "MAJOR_TYPE_ID", nullable = false, insertable = false, updatable = false)
	private GgzyMajorType majorType;

	/**
	 * @uml.property  name="businessType"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "BUSINESS_TYPE_ID", referencedColumnName = "BUSINESS_TYPE_ID", nullable = false, insertable = false, updatable = false)
	private GgzyBusinessType businessType;

	/**
	 * @uml.property  name="sortIndex"
	 */
	@Column(name = "SORT_INDEX", precision = 22)
	private BigDecimal sortIndex;

	/**
	 * @return
	 * @uml.property  name="majorType"
	 */
	public GgzyMajorType getMajorType() {
		return majorType;
	}

	/**
	 * @param majorTypeId
	 * @uml.property  name="majorType"
	 */
	public void setMajorType(GgzyMajorType majorTypeId) {
		this.id.setMajorTypeId(majorTypeId.getMajorTypeId());
		this.majorType = majorTypeId;
	}

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
				"majorTypeId", "businessTypeId").toString();
	}
}
