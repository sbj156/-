// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyTenderDoc;
import com.lmd.ggzy.repository.GgzyTenderDocRepository;

privileged aspect GgzyTenderDocServiceImpl_Roo_Service {
    
    declare @type: GgzyTenderDocServiceImpl: @Service;
    
    declare @type: GgzyTenderDocServiceImpl: @Transactional;
    
    @Autowired
    GgzyTenderDocRepository GgzyTenderDocServiceImpl.ggzyTenderDocRepository;
    
    public long GgzyTenderDocServiceImpl.countAllGgzyTenderDocs() {
        return ggzyTenderDocRepository.count();
    }
    
    public void GgzyTenderDocServiceImpl.deleteGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc) {
        ggzyTenderDocRepository.delete(ggzyTenderDoc);
    }
    
    public GgzyTenderDoc GgzyTenderDocServiceImpl.findGgzyTenderDoc(String id) {
        return ggzyTenderDocRepository.findOne(id);
    }
    
    public List<GgzyTenderDoc> GgzyTenderDocServiceImpl.findAllGgzyTenderDocs() {
        return ggzyTenderDocRepository.findAll();
    }
    
    public List<GgzyTenderDoc> GgzyTenderDocServiceImpl.findGgzyTenderDocEntries(int firstResult, int maxResults) {
        return ggzyTenderDocRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyTenderDocServiceImpl.saveGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc) {
        ggzyTenderDocRepository.save(ggzyTenderDoc);
    }
    
    public GgzyTenderDoc GgzyTenderDocServiceImpl.updateGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc) {
        return ggzyTenderDocRepository.save(ggzyTenderDoc);
    }
    
}