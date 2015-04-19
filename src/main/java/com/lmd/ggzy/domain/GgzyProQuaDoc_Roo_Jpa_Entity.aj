// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyProQuaDoc_Roo_Jpa_Entity {
    
    declare @type: GgzyProQuaDoc: @Entity;
    
    declare @type: GgzyProQuaDoc: @Table(name = "GGZY_PRO_QUA_DOC");
    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "PRO_QUA_DOC_ID", length = 32)
    private String GgzyProQuaDoc.proQuaDocId;
    
    public String GgzyProQuaDoc.getProQuaDocId() {
        return this.proQuaDocId;
    }
    
    public void GgzyProQuaDoc.setProQuaDocId(String id) {
        this.proQuaDocId = id;
    }
    
}
