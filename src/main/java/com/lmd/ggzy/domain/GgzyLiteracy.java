package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_LITERACY")
@RooDbManaged(automaticallyDelete = true)
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyLiteracy")
public class GgzyLiteracy  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7694281754026445566L;

	/**
	 * @uml.property  name="ggzyLiteracyQualification"
	 */
	@OneToMany(mappedBy = "ggzyLiteracy", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	private Set<GgzyLiteracyQualification> ggzyLiteracyQualification;
	
	@OneToMany(mappedBy = "ggzyLiteracy", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE })
	private Set<GgzyLiteracyPerformance> ggzyLiteracyPerformance;

	/**
	 * @uml.property  name="literacyIdcode"
	 */
	@Column(name = "LITERACY_IDCODE", length = 18)
	private String literacyIdcode;

	/**
	 * @uml.property  name="literacySex"
	 */
	@Column(name = "LITERACY_SEX", length = 1)
	private String literacySex;

	/**
	 * @uml.property  name="literacyName"
	 */
	@Column(name = "LITERACY_NAME", length = 100)
	private String literacyName;

	/**
	 * @uml.property  name="literacyBirthday"
	 */
	@Column(name = "LITERACY_BIRTHDAY")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd")
	private Calendar literacyBirthday;

	/**
	 * @uml.property  name="areaCode"
	 */
	@Column(name = "LITERACY_AREACODE", length = 6)
	private String areaCode;

	/**
	 * @uml.property  name="literacyHighestdegree"
	 */
	@Column(name = "LITERACY_HIGHESTDEGREE", length = 50)
	private String literacyHighestdegree;

	/**
	 * @uml.property  name="literacyPhone"
	 */
	@Column(name = "LITERACY_Phone", length = 50)
	private String literacyPhone;

	/**
	 * @uml.property  name="literacyAddress"
	 */
	@Column(name = "LITERACY_ADDRESS", length = 50)
	private String literacyAddress;

	/**
	 * @uml.property  name="literacyPostCode"
	 */
	@Column(name = "LITERACY_POSTCODE", length = 6)
	private String literacyPostCode;

	/**
	 * @uml.property  name="literacyFirmCode"
	 */
	@Column(name = "LITERACY_FIRMCODE", length = 9)
	private String literacyFirmCode;

	/**
	 * @uml.property  name="literacyFirmName"
	 */
	@Column(name = "LITERACY_FIRMNAME", length = 10)
	private String literacyFirmName;

	/**
	 * @uml.property  name="literacyisOffice"
	 */
	@Column(name = "LITERACY_ISOFFICE", length = 50)
	private String literacyisOffice;

	/**
	 * @uml.property  name="literacyDuties"
	 */
	@Column(name = "LITERACY_DUTIES", length = 50)
	private String literacyDuties;

	/**
	 * @uml.property  name="literacyTechnicalTitle"
	 */
	@Column(name = "LITERACY_TECHNICALTITLE", length = 50)
	private String literacyTechnicalTitle;

	/**
	 * @uml.property  name="literacyWorkExperience"
	 */
	@Column(name = "LITERACY_WORKEXPERIENCE", length = 200)
	private String literacyWorkExperience;

	/**
	 * @uml.property  name="literacyWorkAgelimit"
	 */
	@Column(name = "LITERACY_WORKAGELIMIT", precision = 2)
	private BigDecimal literacyWorkAgelimit;

	/**
	 * @return
	 * @uml.property  name="ggzyLiteracyQualification"
	 */
	public Set<GgzyLiteracyQualification> getGgzyLiteracyQualification() {
		return ggzyLiteracyQualification;
	}

	/**
	 * @param ggzyLiteracyQualification
	 * @uml.property  name="ggzyLiteracyQualification"
	 */
	public void setGgzyLiteracyQualification(
			Set<GgzyLiteracyQualification> ggzyLiteracyQualification) {
		this.ggzyLiteracyQualification = ggzyLiteracyQualification;
	}

	/**
	 * @return
	 * @uml.property  name="literacyIdcode"
	 */
	public String getLiteracyIdcode() {
		return literacyIdcode;
	}

	/**
	 * @param literacyIdcode
	 * @uml.property  name="literacyIdcode"
	 */
	public void setLiteracyIdcode(String literacyIdcode) {
		this.literacyIdcode = literacyIdcode;
	}

	/**
	 * @return
	 * @uml.property  name="literacySex"
	 */
	public String getLiteracySex() {
		return literacySex;
	}

	/**
	 * @param literacySex
	 * @uml.property  name="literacySex"
	 */
	public void setLiteracySex(String literacySex) {
		this.literacySex = literacySex;
	}

	/**
	 * @return
	 * @uml.property  name="literacyName"
	 */
	public String getLiteracyName() {
		return literacyName;
	}

	/**
	 * @param literacyName
	 * @uml.property  name="literacyName"
	 */
	public void setLiteracyName(String literacyName) {
		this.literacyName = literacyName;
	}

	/**
	 * @return
	 * @uml.property  name="literacyBirthday"
	 */
	public Calendar getLiteracyBirthday() {
		return literacyBirthday;
	}

	/**
	 * @param literacyBirthday
	 * @uml.property  name="literacyBirthday"
	 */
	public void setLiteracyBirthday(Calendar literacyBirthday) {
		this.literacyBirthday = literacyBirthday;
	}

	/**
	 * @return
	 * @uml.property  name="areaCode"
	 */
	public String getAreaCode() {
		return areaCode;
	}

	/**
	 * @param areaCode
	 * @uml.property  name="areaCode"
	 */
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	/**
	 * @return
	 * @uml.property  name="literacyHighestdegree"
	 */
	public String getLiteracyHighestdegree() {
		return literacyHighestdegree;
	}

	/**
	 * @param literacyHighestdegree
	 * @uml.property  name="literacyHighestdegree"
	 */
	public void setLiteracyHighestdegree(String literacyHighestdegree) {
		this.literacyHighestdegree = literacyHighestdegree;
	}

	/**
	 * @return
	 * @uml.property  name="literacyPhone"
	 */
	public String getLiteracyPhone() {
		return literacyPhone;
	}

	/**
	 * @param literacyPhone
	 * @uml.property  name="literacyPhone"
	 */
	public void setLiteracyPhone(String literacyPhone) {
		this.literacyPhone = literacyPhone;
	}

	/**
	 * @return
	 * @uml.property  name="literacyAddress"
	 */
	public String getLiteracyAddress() {
		return literacyAddress;
	}

	/**
	 * @param literacyAddress
	 * @uml.property  name="literacyAddress"
	 */
	public void setLiteracyAddress(String literacyAddress) {
		this.literacyAddress = literacyAddress;
	}

	/**
	 * @return
	 * @uml.property  name="literacyPostCode"
	 */
	public String getLiteracyPostCode() {
		return literacyPostCode;
	}

	/**
	 * @param literacyPostCode
	 * @uml.property  name="literacyPostCode"
	 */
	public void setLiteracyPostCode(String literacyPostCode) {
		this.literacyPostCode = literacyPostCode;
	}

	/**
	 * @return
	 * @uml.property  name="literacyFirmCode"
	 */
	public String getLiteracyFirmCode() {
		return literacyFirmCode;
	}

	/**
	 * @param literacyFirmCode
	 * @uml.property  name="literacyFirmCode"
	 */
	public void setLiteracyFirmCode(String literacyFirmCode) {
		this.literacyFirmCode = literacyFirmCode;
	}

	/**
	 * @return
	 * @uml.property  name="literacyFirmName"
	 */
	public String getLiteracyFirmName() {
		return literacyFirmName;
	}

	/**
	 * @param literacyFirmName
	 * @uml.property  name="literacyFirmName"
	 */
	public void setLiteracyFirmName(String literacyFirmName) {
		this.literacyFirmName = literacyFirmName;
	}

	/**
	 * @return
	 * @uml.property  name="literacyisOffice"
	 */
	public String getLiteracyisOffice() {
		return literacyisOffice;
	}

	/**
	 * @param literacyisOffice
	 * @uml.property  name="literacyisOffice"
	 */
	public void setLiteracyisOffice(String literacyisOffice) {
		this.literacyisOffice = literacyisOffice;
	}

	/**
	 * @return
	 * @uml.property  name="literacyDuties"
	 */
	public String getLiteracyDuties() {
		return literacyDuties;
	}

	/**
	 * @param literacyDuties
	 * @uml.property  name="literacyDuties"
	 */
	public void setLiteracyDuties(String literacyDuties) {
		this.literacyDuties = literacyDuties;
	}

	/**
	 * @return
	 * @uml.property  name="literacyTechnicalTitle"
	 */
	public String getLiteracyTechnicalTitle() {
		return literacyTechnicalTitle;
	}

	/**
	 * @param literacyTechnicalTitle
	 * @uml.property  name="literacyTechnicalTitle"
	 */
	public void setLiteracyTechnicalTitle(String literacyTechnicalTitle) {
		this.literacyTechnicalTitle = literacyTechnicalTitle;
	}

	/**
	 * @return
	 * @uml.property  name="literacyWorkExperience"
	 */
	public String getLiteracyWorkExperience() {
		return literacyWorkExperience;
	}

	/**
	 * @param literacyWorkExperience
	 * @uml.property  name="literacyWorkExperience"
	 */
	public void setLiteracyWorkExperience(String literacyWorkExperience) {
		this.literacyWorkExperience = literacyWorkExperience;
	}

	/**
	 * @return
	 * @uml.property  name="literacyWorkAgelimit"
	 */
	public BigDecimal getLiteracyWorkAgelimit() {
		return literacyWorkAgelimit;
	}

	/**
	 * @param literacyWorkAgelimit
	 * @uml.property  name="literacyWorkAgelimit"
	 */
	public void setLiteracyWorkAgelimit(BigDecimal literacyWorkAgelimit) {
		this.literacyWorkAgelimit = literacyWorkAgelimit;
	}

	public Set<GgzyLiteracyPerformance> getGgzyLiteracyPerformance() {
		return ggzyLiteracyPerformance;
	}

	public void setGgzyLiteracyPerformance(
			Set<GgzyLiteracyPerformance> ggzyLiteracyPerformance) {
		this.ggzyLiteracyPerformance = ggzyLiteracyPerformance;
	}

	@Override
	public String toString() {
		return "GgzyLiteracy [ggzyLiteracyQualification="
				+ ggzyLiteracyQualification + ", ggzyLiteracyPerformance="
				+ ggzyLiteracyPerformance + ", literacyIdcode="
				+ literacyIdcode + ", literacySex=" + literacySex
				+ ", literacyName=" + literacyName + ", literacyBirthday="
				+ literacyBirthday + ", areaCode=" + areaCode
				+ ", literacyHighestdegree=" + literacyHighestdegree
				+ ", literacyPhone=" + literacyPhone + ", literacyAddress="
				+ literacyAddress + ", literacyPostCode=" + literacyPostCode
				+ ", literacyFirmCode=" + literacyFirmCode
				+ ", literacyFirmName=" + literacyFirmName
				+ ", literacyisOffice=" + literacyisOffice
				+ ", literacyDuties=" + literacyDuties
				+ ", literacyTechnicalTitle=" + literacyTechnicalTitle
				+ ", literacyWorkExperience=" + literacyWorkExperience
				+ ", literacyWorkAgelimit=" + literacyWorkAgelimit + "]";
	}
}
