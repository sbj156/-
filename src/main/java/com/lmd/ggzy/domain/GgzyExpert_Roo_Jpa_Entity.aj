// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyExpert_Roo_Jpa_Entity {
    
    declare @type: GgzyExpert: @Entity;
    
    declare @type: GgzyExpert: @Table(name = "GGZY_EXPERT");
    
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "id", length = 32)
    @Id
    private String GgzyExpert.id;
    
    
    public String GgzyExpert.getId() {
        return this.id;
    }
    
    public void GgzyExpert.setId(String id) {
        this.id = id;
    }
}
