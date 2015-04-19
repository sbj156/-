package com.lmd.ggzy.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BASE_PRO")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBidProes" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBasePro", include="non-lazy")
public class GgzyBasePro  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3979583444145052175L;

	/**
	 * @uml.property  name="ggzyBidProes"
	 */
	@OneToMany(mappedBy = "basePro", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE,CascadeType.REMOVE }, fetch=FetchType.LAZY)
	private Set<GgzyBidPro> ggzyBidProes;

	/**
	 * @uml.property  name="area"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "area_code")
	private GgzyTreeLib area;

	/**
	 * 编码规则：采用组合码，编码长度为17位。排列顺序从左至右依次为：前11位由交易平台标识代码组成，后6位由项目序列号组成，项目序列号的取值从000001-999999
	 * @uml.property  name="proCode"
	 */
	@Column(name = "PRO_CODE", length = 17)
	private String proCode;

	/**
	 * @uml.property  name="proName"
	 */
	@Column(name = "PRO_NAME", length = 200)
	private String proName;

	/**
	 * @uml.property  name="proAddress"
	 */
	@Column(name = "PRO_ADDRESS", length = 200)
	private String proAddress;

	/**
	 * @uml.property  name="legalPerson"
	 */
	@Column(name = "LEGAL_PERSON", length = 100)
	private String legalPerson;

	/**
	 * @uml.property  name="industryType"
	 */
	@Column(name = "INDUSTRY_TYPE", length = 3)
	private String industryType;

	/**
	 * @uml.property  name="capticalSource"
	 */
	@Column(name = "CAPTICAL_SOURCE", length = 1000)
	private String capticalSource;

	/**
	 * @uml.property  name="proScal"
	 */
	@Column(name = "PRO_SCAL", length = 1000)
	private String proScal;

	/**
	 * @uml.property  name="contactPerson"
	 */
	@Column(name = "CONTACT_PERSON", length = 100)
	private String contactPerson;

	/**
	 * @uml.property  name="contactWay"
	 */
	@Column(name = "CONTACT_WAY", length = 100)
	private String contactWay;

	/**
	 * @return
	 * @uml.property  name="ggzyBidProes"
	 */
	public Set<GgzyBidPro> getGgzyBidProes() {
		return ggzyBidProes;
	}

	/**
	 * @param ggzyBidProes
	 * @uml.property  name="ggzyBidProes"
	 */
	public void setGgzyBidProes(Set<GgzyBidPro> ggzyBidProes) {
		this.ggzyBidProes = ggzyBidProes;
	}

	/**
	 * @return
	 * @uml.property  name="proCode"
	 */
	public String getProCode() {
		return proCode;
	}

	/**
	 * @param proCode
	 * @uml.property  name="proCode"
	 */
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	/**
	 * @return
	 * @uml.property  name="proName"
	 */
	public String getProName() {
		return proName;
	}

	/**
	 * @param proName
	 * @uml.property  name="proName"
	 */
	public void setProName(String proName) {
		this.proName = proName;
	}

	/**
	 * @return
	 * @uml.property  name="area"
	 */
	public GgzyTreeLib getArea() {
		return area;
	}

	/**
	 * @param area
	 * @uml.property  name="area"
	 */
	public void setArea(GgzyTreeLib area) {
		this.area = area;
	}

	/**
	 * @return
	 * @uml.property  name="proAddress"
	 */
	public String getProAddress() {
		return proAddress;
	}

	/**
	 * @param proAddress
	 * @uml.property  name="proAddress"
	 */
	public void setProAddress(String proAddress) {
		this.proAddress = proAddress;
	}

	/**
	 * @return
	 * @uml.property  name="legalPerson"
	 */
	public String getLegalPerson() {
		return legalPerson;
	}

	/**
	 * @param legalPerson
	 * @uml.property  name="legalPerson"
	 */
	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	/**
	 * @return
	 * @uml.property  name="industryType"
	 */
	public String getIndustryType() {
		return industryType;
	}

	/**
	 * @param industryType
	 * @uml.property  name="industryType"
	 */
	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	/**
	 * @return
	 * @uml.property  name="capticalSource"
	 */
	public String getCapticalSource() {
		return capticalSource;
	}

	/**
	 * @param capticalSource
	 * @uml.property  name="capticalSource"
	 */
	public void setCapticalSource(String capticalSource) {
		this.capticalSource = capticalSource;
	}

	/**
	 * @return
	 * @uml.property  name="proScal"
	 */
	public String getProScal() {
		return proScal;
	}

	/**
	 * @param proScal
	 * @uml.property  name="proScal"
	 */
	public void setProScal(String proScal) {
		this.proScal = proScal;
	}

	/**
	 * @return
	 * @uml.property  name="contactPerson"
	 */
	public String getContactPerson() {
		return contactPerson;
	}

	/**
	 * @param contactPerson
	 * @uml.property  name="contactPerson"
	 */
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	/**
	 * @return
	 * @uml.property  name="contactWay"
	 */
	public String getContactWay() {
		return contactWay;
	}

	/**
	 * @param contactWay
	 * @uml.property  name="contactWay"
	 */
	public void setContactWay(String contactWay) {
		this.contactWay = contactWay;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"ggzyBidProes").toString();
	}
}
