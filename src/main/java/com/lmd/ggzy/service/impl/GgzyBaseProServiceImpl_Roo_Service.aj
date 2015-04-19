// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyBasePro;
import com.lmd.ggzy.repository.GgzyBaseProRepository;

privileged aspect GgzyBaseProServiceImpl_Roo_Service {
    
    declare @type: GgzyBaseProServiceImpl: @Service;
    
    declare @type: GgzyBaseProServiceImpl: @Transactional;
    
    @Autowired
    GgzyBaseProRepository GgzyBaseProServiceImpl.ggzyBaseProRepository;
    
    public long GgzyBaseProServiceImpl.countAllGgzyBaseProes() {
        return ggzyBaseProRepository.count();
    }
    
    public void GgzyBaseProServiceImpl.deleteGgzyBasePro(GgzyBasePro ggzyBasePro) {
        ggzyBaseProRepository.delete(ggzyBasePro);
    }
    
    public GgzyBasePro GgzyBaseProServiceImpl.findGgzyBasePro(String id) {
    	System.out.println(ggzyBaseProRepository);
        return ggzyBaseProRepository.findOne(id);
    }
    
    public List<GgzyBasePro> GgzyBaseProServiceImpl.findAllGgzyBaseProes() {
        return ggzyBaseProRepository.findAll();
    }
    
    public List<GgzyBasePro> GgzyBaseProServiceImpl.findGgzyBaseProEntries(int firstResult, int maxResults) {
        return ggzyBaseProRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyBaseProServiceImpl.saveGgzyBasePro(GgzyBasePro ggzyBasePro) {
//    	ggzyBaseProRepository.saveAndFlush(ggzyBasePro);
//    	System.out.println(ggzyBasePro);
        ggzyBaseProRepository.save(ggzyBasePro);
    }
    
    public GgzyBasePro GgzyBaseProServiceImpl.updateGgzyBasePro(GgzyBasePro ggzyBasePro) {
        return ggzyBaseProRepository.save(ggzyBasePro);
    }
    
}
