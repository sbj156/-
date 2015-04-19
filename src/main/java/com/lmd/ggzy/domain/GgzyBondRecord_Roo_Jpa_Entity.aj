// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyBondRecord_Roo_Jpa_Entity {
    
    declare @type: GgzyBondRecord: @Entity;
    
    declare @type: GgzyBondRecord: @Table(name = "GGZY_BOND_RECORD");
    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "BOND_RECORD_ID", length = 32)
    private String GgzyBondRecord.bondRecordId;
    
    public String GgzyBondRecord.getBondRecordId() {
        return this.bondRecordId;
    }
    
    public void GgzyBondRecord.setBondRecordId(String id) {
        this.bondRecordId = id;
    }
    
}