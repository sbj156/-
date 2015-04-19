// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyProQuaDoc;
import com.lmd.ggzy.repository.GgzyProQuaDocRepository;

privileged aspect GgzyProQuaDocServiceImpl_Roo_Service {
    
    declare @type: GgzyProQuaDocServiceImpl: @Service;
    
    declare @type: GgzyProQuaDocServiceImpl: @Transactional;
    
    @Autowired
    GgzyProQuaDocRepository GgzyProQuaDocServiceImpl.ggzyProQuaDocRepository;
    
    public long GgzyProQuaDocServiceImpl.countAllGgzyProQuaDocs() {
        return ggzyProQuaDocRepository.count();
    }
    
    public void GgzyProQuaDocServiceImpl.deleteGgzyProQuaDoc(GgzyProQuaDoc ggzyProQuaDoc) {
        ggzyProQuaDocRepository.delete(ggzyProQuaDoc);
    }
    
    public GgzyProQuaDoc GgzyProQuaDocServiceImpl.findGgzyProQuaDoc(String id) {
        return ggzyProQuaDocRepository.findOne(id);
    }
    
    public List<GgzyProQuaDoc> GgzyProQuaDocServiceImpl.findAllGgzyProQuaDocs() {
        return ggzyProQuaDocRepository.findAll();
    }
    
    public List<GgzyProQuaDoc> GgzyProQuaDocServiceImpl.findGgzyProQuaDocEntries(int firstResult, int maxResults) {
        return ggzyProQuaDocRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyProQuaDocServiceImpl.saveGgzyProQuaDoc(GgzyProQuaDoc ggzyProQuaDoc) {
        ggzyProQuaDocRepository.save(ggzyProQuaDoc);
    }
    
    public GgzyProQuaDoc GgzyProQuaDocServiceImpl.updateGgzyProQuaDoc(GgzyProQuaDoc ggzyProQuaDoc) {
        return ggzyProQuaDocRepository.save(ggzyProQuaDoc);
    }
    
}