// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyBusinessTypeWay;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeWayPK;
import com.lmd.ggzy.repository.GgzyBusinessTypeWayRepository;

privileged aspect GgzyBusinessTypeWayServiceImpl_Roo_Service {
    
    declare @type: GgzyBusinessTypeWayServiceImpl: @Service;
    
    declare @type: GgzyBusinessTypeWayServiceImpl: @Transactional;
    
    @Autowired
    GgzyBusinessTypeWayRepository GgzyBusinessTypeWayServiceImpl.ggzyBusinessTypeWayRepository;
    
    public long GgzyBusinessTypeWayServiceImpl.countAllGgzyBusinessTypeWays() {
        return ggzyBusinessTypeWayRepository.count();
    }
    
    public void GgzyBusinessTypeWayServiceImpl.deleteGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay) {
        ggzyBusinessTypeWayRepository.delete(ggzyBusinessTypeWay);
    }
    
    public GgzyBusinessTypeWay GgzyBusinessTypeWayServiceImpl.findGgzyBusinessTypeWay(GgzyBusinessTypeWayPK id) {
        return ggzyBusinessTypeWayRepository.findOne(id);
    }
    
    public List<GgzyBusinessTypeWay> GgzyBusinessTypeWayServiceImpl.findAllGgzyBusinessTypeWays() {
        return ggzyBusinessTypeWayRepository.findAll();
    }
    
    public List<GgzyBusinessTypeWay> GgzyBusinessTypeWayServiceImpl.findGgzyBusinessTypeWayEntries(int firstResult, int maxResults) {
        return ggzyBusinessTypeWayRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyBusinessTypeWayServiceImpl.saveGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay) {
        ggzyBusinessTypeWayRepository.save(ggzyBusinessTypeWay);
    }
    
    public GgzyBusinessTypeWay GgzyBusinessTypeWayServiceImpl.updateGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay) {
        return ggzyBusinessTypeWayRepository.save(ggzyBusinessTypeWay);
    }
    
}
