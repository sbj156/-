// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain.data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect DataBlob_Roo_Jpa_Entity {
    
    declare @type: DataBlob: @Entity;
    
    declare @type: DataBlob: @Table(name = "GGZY_DATA_BLOB");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long DataBlob.id;
    
    @Version
    @Column(name = "version")
    private Integer DataBlob.version;
    
    public Long DataBlob.getId() {
        return this.id;
    }
    
    public void DataBlob.setId(Long id) {
        this.id = id;
    }
    
    public Integer DataBlob.getVersion() {
        return this.version;
    }
    
    public void DataBlob.setVersion(Integer version) {
        this.version = version;
    }
    
}
