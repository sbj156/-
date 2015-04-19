package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Table;

privileged aspect GgzyLiteracyQualification_Roo_Jpa_Entity {

	declare @type: GgzyLiteracyQualification: @Entity;

	declare @type: GgzyLiteracyQualification: @Table(name = "GGZY_LITERACY_QUALIFICATION");

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@GeneratedValue(generator = "uuid")
	@Column(name = "QUALIFICATION_ID", length = 32)
	private String GgzyLiteracyQualification.qualificationId;

	public String GgzyLiteracyQualification.getQualificationId() {
		return this.qualificationId;
	}

	public void GgzyLiteracyQualification.setQualificationId(String id) {
		this.qualificationId = id;
	}
}
