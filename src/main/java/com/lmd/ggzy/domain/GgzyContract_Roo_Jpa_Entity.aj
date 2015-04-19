// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyContract_Roo_Jpa_Entity {
    
    declare @type: GgzyContract: @Entity;
    
    declare @type: GgzyContract: @Table(name = "GGZY_CONTRACT");
    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "CONTRACT_ID", length = 32)
    private String GgzyContract.contractId;
    
    public String GgzyContract.getContractId() {
        return this.contractId;
    }
    
    public void GgzyContract.setContractId(String id) {
        this.contractId = id;
    }
    
}
