// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyQualification_Roo_Jpa_Entity {
    
    declare @type: GgzyQualification: @Entity;
    
    declare @type: GgzyQualification: @Table(name = "GGZY_QUALIFICATION");
    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "QUALIFICATION_ID", length = 32)
    private String GgzyQualification.qualificationId;
    
    public String GgzyQualification.getQualificationId() {
        return this.qualificationId;
    }
    
    public void GgzyQualification.setQualificationId(String id) {
        this.qualificationId = id;
    }
    
}