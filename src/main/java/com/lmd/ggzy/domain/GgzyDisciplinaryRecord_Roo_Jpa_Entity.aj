package com.lmd.ggzy.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyDisciplinaryRecord_Roo_Jpa_Entity {

	declare @type: GgzyDisciplinaryRecord: @Entity;
	
	declare @type: GgzyDisciplinaryRecord: @Table(name = "GGZY_DISCIPLINARY_RECORD");
	@Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "DISCIPLINARY_ID", length = 32)
    private String GgzyDisciplinaryRecord.disciplinaryId;
    
	 public String GgzyDisciplinaryRecord.getdisciplinaryId() {
	        return this.disciplinaryId;
	    }
	    
	    public void GgzyDisciplinaryRecord.setdisciplinaryId(String id) {
	        this.disciplinaryId = id;
	    }
   
}
