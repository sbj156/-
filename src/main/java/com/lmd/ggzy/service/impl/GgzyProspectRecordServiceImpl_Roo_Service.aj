// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyProspectRecord;
import com.lmd.ggzy.repository.GgzyProspectRecordRepository;

privileged aspect GgzyProspectRecordServiceImpl_Roo_Service {
    
    declare @type: GgzyProspectRecordServiceImpl: @Service;
    
    declare @type: GgzyProspectRecordServiceImpl: @Transactional;
    
    @Autowired
    GgzyProspectRecordRepository GgzyProspectRecordServiceImpl.ggzyProspectRecordRepository;
    
    public long GgzyProspectRecordServiceImpl.countAllGgzyProspectRecords() {
        return ggzyProspectRecordRepository.count();
    }
    
    public void GgzyProspectRecordServiceImpl.deleteGgzyProspectRecord(GgzyProspectRecord ggzyProspectRecord) {
        ggzyProspectRecordRepository.delete(ggzyProspectRecord);
    }
    
    public GgzyProspectRecord GgzyProspectRecordServiceImpl.findGgzyProspectRecord(String id) {
        return ggzyProspectRecordRepository.findOne(id);
    }
    
    public List<GgzyProspectRecord> GgzyProspectRecordServiceImpl.findAllGgzyProspectRecords() {
        return ggzyProspectRecordRepository.findAll();
    }
    
    public List<GgzyProspectRecord> GgzyProspectRecordServiceImpl.findGgzyProspectRecordEntries(int firstResult, int maxResults) {
        return ggzyProspectRecordRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyProspectRecordServiceImpl.saveGgzyProspectRecord(GgzyProspectRecord ggzyProspectRecord) {
        ggzyProspectRecordRepository.save(ggzyProspectRecord);
    }
    
    public GgzyProspectRecord GgzyProspectRecordServiceImpl.updateGgzyProspectRecord(GgzyProspectRecord ggzyProspectRecord) {
        return ggzyProspectRecordRepository.save(ggzyProspectRecord);
    }
    
}
