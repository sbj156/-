// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyProspectRecord_Roo_Jpa_Entity {
    
    declare @type: GgzyProspectRecord: @Entity;
    
    declare @type: GgzyProspectRecord: @Table(name = "GGZY_PROSPECT_RECORD");
    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "PROSPECT_RECORD_ID", length = 32)
    private String GgzyProspectRecord.prospectRecordId;
    
    public String GgzyProspectRecord.getProspectRecordId() {
        return this.prospectRecordId;
    }
    
    public void GgzyProspectRecord.setProspectRecordId(String id) {
        this.prospectRecordId = id;
    }
    
}
