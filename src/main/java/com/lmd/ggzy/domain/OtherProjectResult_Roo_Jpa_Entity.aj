// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import com.lmd.ggzy.domain.OtherProjectResult;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect OtherProjectResult_Roo_Jpa_Entity {
    
    declare @type: OtherProjectResult: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long OtherProjectResult.id;
    
    
    public Long OtherProjectResult.getId() {
        return this.id;
    }
    
    public void OtherProjectResult.setId(Long id) {
        this.id = id;
    }
}
