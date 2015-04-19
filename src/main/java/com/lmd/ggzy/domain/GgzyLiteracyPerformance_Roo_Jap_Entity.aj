package com.lmd.ggzy.domain;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.Table;
privileged aspect GgzyLiteracyPerformanc_Roo_Jpa_Entity {

	 declare @type: GgzyLiteracyPerformance: @Entity;
	    
	    declare @type: GgzyLiteracyPerformance: @Table(name = "GGZY_LITERACY_PERFORMANCE");
	    
	    @Id
	    @GenericGenerator(name="uuid" ,strategy="uuid")
	    @GeneratedValue(generator="uuid")
	    @Column(name = "PERFORMANCE_ID", length = 32)
	    private String GgzyLiteracyPerformance.performanceId;
	    
	    public String GgzyLiteracyPerformance.getPerformanceId() {
	        return this.performanceId;
	    }
	    
	    public void GgzyLiteracyPerformance.setPerformanceId(String id) {
	        this.performanceId = id;
	    }
}
