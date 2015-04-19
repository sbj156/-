package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;

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

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BUSINESS_WAY")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBusinessTypeWays" })
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBusinessWay")
public class GgzyBusinessWay  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1458064883376215357L;

	/**
	 * @uml.property  name="ggzyBusinessTypeWays"
	 */
	@OneToMany(mappedBy = "businessWay", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	private Set<GgzyBusinessTypeWay> ggzyBusinessTypeWays;

	/**
	 * @uml.property  name="name"
	 */
	@Column(name = "NAME", length = 50)
	private String name;

	/**
	 * @uml.property  name="code"
	 */
	@Column(name = "CODE")
	private Character code;

	/**
	 * @return
	 * @uml.property  name="ggzyBusinessTypeWays"
	 */
	public Set<GgzyBusinessTypeWay> getGgzyBusinessTypeWays() {
		return ggzyBusinessTypeWays;
	}

	/**
	 * @param ggzyBusinessTypeWays
	 * @uml.property  name="ggzyBusinessTypeWays"
	 */
	public void setGgzyBusinessTypeWays(
			Set<GgzyBusinessTypeWay> ggzyBusinessTypeWays) {
		this.ggzyBusinessTypeWays = ggzyBusinessTypeWays;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="code"
	 */
	public Character getCode() {
		return code;
	}

	/**
	 * @param code
	 * @uml.property  name="code"
	 */
	public void setCode(Character code) {
		this.code = code;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"ggzyBusinessTypeWays").toString();
	}
}
