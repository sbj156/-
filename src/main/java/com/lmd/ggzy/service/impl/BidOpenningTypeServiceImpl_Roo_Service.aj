// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.BidOpenningType;
import com.lmd.ggzy.repository.BidOpenningTypeRepository;
import com.lmd.ggzy.service.impl.BidOpenningTypeServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BidOpenningTypeServiceImpl_Roo_Service {
    
    declare @type: BidOpenningTypeServiceImpl: @Service;
    
    declare @type: BidOpenningTypeServiceImpl: @Transactional;
    
    @Autowired
    BidOpenningTypeRepository BidOpenningTypeServiceImpl.bidOpenningTypeRepository;
    
    public long BidOpenningTypeServiceImpl.countAllBidOpenningTypes() {
        return bidOpenningTypeRepository.count();
    }
    
    public void BidOpenningTypeServiceImpl.deleteBidOpenningType(BidOpenningType bidOpenningType) {
        bidOpenningTypeRepository.delete(bidOpenningType);
    }
    
    public BidOpenningType BidOpenningTypeServiceImpl.findBidOpenningType(Long id) {
        return bidOpenningTypeRepository.findOne(id);
    }
    
    public List<BidOpenningType> BidOpenningTypeServiceImpl.findAllBidOpenningTypes() {
        return bidOpenningTypeRepository.findAll();
    }
    
    public List<BidOpenningType> BidOpenningTypeServiceImpl.findBidOpenningTypeEntries(int firstResult, int maxResults) {
        return bidOpenningTypeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void BidOpenningTypeServiceImpl.saveBidOpenningType(BidOpenningType bidOpenningType) {
        bidOpenningTypeRepository.save(bidOpenningType);
    }
    
    public BidOpenningType BidOpenningTypeServiceImpl.updateBidOpenningType(BidOpenningType bidOpenningType) {
        return bidOpenningTypeRepository.save(bidOpenningType);
    }
    
}
