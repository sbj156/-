package com.lmd.ggzy.domain;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Table;
privileged aspect GgzyLiteracy_Roo_Jpa_Entity {

	 declare @type: GgzyLiteracy: @Entity;
	    
	    declare @type: GgzyLiteracy: @Table(name = "GGZY_LITERACY");
	    
	    @Id
	    @GenericGenerator(name="uuid" ,strategy="uuid")
	    @GeneratedValue(generator="uuid")
	    @Column(name = "LITERACY_ID", length = 32)
	    private String GgzyLiteracy.literacyId;
	    
	    public String GgzyLiteracy.getLiteracyId() {
	        return this.literacyId;
	    }
	    
	    public void GgzyLiteracy.setLiteracyId(String id) {
	        this.literacyId = id;
	    }
}
