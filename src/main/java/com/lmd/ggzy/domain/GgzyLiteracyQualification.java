package com.lmd.ggzy.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaEntity(versionColumn = "", table = "GGZY_LITERACY_QUALIFICATION")
@RooDbManaged(automaticallyDelete = true)
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyLiteracyQualification")
public class GgzyLiteracyQualification  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7598783464645402063L;

	/**
	 * @uml.property  name="ggzyLiteracy"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name = "LITERACY_ID", referencedColumnName = "LITERACY_ID")
	private GgzyLiteracy ggzyLiteracy;

	/**
	 * @uml.property  name="literacyQuaSequence"
	 */
	@Column(name = "LITERACY_QUASEQUENCE", length = 50)
	private String literacyQuaSequence;

	/**
	 * @uml.property  name="literacyGrade"
	 */
	@Column(name = "LITERACY_GRADE", length = 50)
	private String literacyGrade;

	/**
	 * @uml.property  name="quaCertificateNumber"
	 */
	@Column(name = "QUA_CERTIFICATE_NUMBER", length = 50)
	private String quaCertificateNumber;

	/**
	 * @uml.property  name="reCertificateNumber"
	 */
	@Column(name = "RE_CERTIFICATE_NUMBER", length = 50)
	private String reCertificateNumber;

	/**
	 * @return
	 * @uml.property  name="ggzyLiteracy"
	 */
	public GgzyLiteracy getGgzyLiteracy() {
		return ggzyLiteracy;
	}

	/**
	 * @param ggzyLiteracy
	 * @uml.property  name="ggzyLiteracy"
	 */
	public void setGgzyLiteracy(GgzyLiteracy ggzyLiteracy) {
		this.ggzyLiteracy = ggzyLiteracy;
	}

	/**
	 * @return
	 * @uml.property  name="literacyQuaSequence"
	 */
	public String getLiteracyQuaSequence() {
		return literacyQuaSequence;
	}

	/**
	 * @param literacyQuaSequence
	 * @uml.property  name="literacyQuaSequence"
	 */
	public void setLiteracyQuaSequence(String literacyQuaSequence) {
		this.literacyQuaSequence = literacyQuaSequence;
	}

	/**
	 * @return
	 * @uml.property  name="literacyGrade"
	 */
	public String getLiteracyGrade() {
		return literacyGrade;
	}

	/**
	 * @param literacyGrade
	 * @uml.property  name="literacyGrade"
	 */
	public void setLiteracyGrade(String literacyGrade) {
		this.literacyGrade = literacyGrade;
	}

	/**
	 * @return
	 * @uml.property  name="quaCertificateNumber"
	 */
	public String getQuaCertificateNumber() {
		return quaCertificateNumber;
	}

	/**
	 * @param quaCertificateNumber
	 * @uml.property  name="quaCertificateNumber"
	 */
	public void setQuaCertificateNumber(String quaCertificateNumber) {
		this.quaCertificateNumber = quaCertificateNumber;
	}

	/**
	 * @return
	 * @uml.property  name="reCertificateNumber"
	 */
	public String getReCertificateNumber() {
		return reCertificateNumber;
	}

	/**
	 * @param reCertificateNumber
	 * @uml.property  name="reCertificateNumber"
	 */
	public void setReCertificateNumber(String reCertificateNumber) {
		this.reCertificateNumber = reCertificateNumber;
	}

	@Override
	public String toString() {
		return "GgzyLiteracyQualification [ggzyLiteracy=" + ggzyLiteracy
				+ ", literacyQuaSequence=" + literacyQuaSequence
				+ ", literacyGrade=" + literacyGrade
				+ ", quaCertificateNumber=" + quaCertificateNumber
				+ ", reCertificateNumber=" + reCertificateNumber + "]";
	}

}
