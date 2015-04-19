// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.OtherProjectResult;
import com.lmd.ggzy.repository.OtherProjectResultRepository;
import com.lmd.ggzy.service.impl.OtherProjectResultServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OtherProjectResultServiceImpl_Roo_Service {
    
    declare @type: OtherProjectResultServiceImpl: @Service;
    
    declare @type: OtherProjectResultServiceImpl: @Transactional;
    
    @Autowired
    OtherProjectResultRepository OtherProjectResultServiceImpl.otherProjectResultRepository;
    
    public long OtherProjectResultServiceImpl.countAllOtherProjectResults() {
        return otherProjectResultRepository.count();
    }
    
    public void OtherProjectResultServiceImpl.deleteOtherProjectResult(OtherProjectResult otherProjectResult) {
        otherProjectResultRepository.delete(otherProjectResult);
    }
    
    public OtherProjectResult OtherProjectResultServiceImpl.findOtherProjectResult(Long id) {
        return otherProjectResultRepository.findOne(id);
    }
    
    public List<OtherProjectResult> OtherProjectResultServiceImpl.findAllOtherProjectResults() {
        return otherProjectResultRepository.findAll();
    }
    
    public List<OtherProjectResult> OtherProjectResultServiceImpl.findOtherProjectResultEntries(int firstResult, int maxResults) {
        return otherProjectResultRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void OtherProjectResultServiceImpl.saveOtherProjectResult(OtherProjectResult otherProjectResult) {
        otherProjectResultRepository.save(otherProjectResult);
    }
    
    public OtherProjectResult OtherProjectResultServiceImpl.updateOtherProjectResult(OtherProjectResult otherProjectResult) {
        return otherProjectResultRepository.save(otherProjectResult);
    }
    
}