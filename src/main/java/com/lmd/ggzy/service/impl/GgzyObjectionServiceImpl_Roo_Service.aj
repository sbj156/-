// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyObjection;
import com.lmd.ggzy.repository.GgzyObjectionRepository;

privileged aspect GgzyObjectionServiceImpl_Roo_Service {
    
    declare @type: GgzyObjectionServiceImpl: @Service;
    
    declare @type: GgzyObjectionServiceImpl: @Transactional;
    
    @Autowired
    GgzyObjectionRepository GgzyObjectionServiceImpl.ggzyObjectionRepository;
    
    public long GgzyObjectionServiceImpl.countAllGgzyObjections() {
        return ggzyObjectionRepository.count();
    }
    
    public void GgzyObjectionServiceImpl.deleteGgzyObjection(GgzyObjection ggzyObjection) {
        ggzyObjectionRepository.delete(ggzyObjection);
    }
    
    public GgzyObjection GgzyObjectionServiceImpl.findGgzyObjection(String id) {
        return ggzyObjectionRepository.findOne(id);
    }
    
    public List<GgzyObjection> GgzyObjectionServiceImpl.findAllGgzyObjections() {
        return ggzyObjectionRepository.findAll();
    }
    
    public List<GgzyObjection> GgzyObjectionServiceImpl.findGgzyObjectionEntries(int firstResult, int maxResults) {
        return ggzyObjectionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyObjectionServiceImpl.saveGgzyObjection(GgzyObjection ggzyObjection) {
        ggzyObjectionRepository.save(ggzyObjection);
    }
    
    public GgzyObjection GgzyObjectionServiceImpl.updateGgzyObjection(GgzyObjection ggzyObjection) {
        return ggzyObjectionRepository.save(ggzyObjection);
    }
    
}
