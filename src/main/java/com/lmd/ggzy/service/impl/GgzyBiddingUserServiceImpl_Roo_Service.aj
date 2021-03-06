// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.GgzyBiddingUser;
import com.lmd.ggzy.repository.GgzyBiddingUserRepository;
import com.lmd.ggzy.service.impl.GgzyBiddingUserServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GgzyBiddingUserServiceImpl_Roo_Service {
    
    declare @type: GgzyBiddingUserServiceImpl: @Service;
    
    declare @type: GgzyBiddingUserServiceImpl: @Transactional;
    
    @Autowired
    GgzyBiddingUserRepository GgzyBiddingUserServiceImpl.ggzyBiddingUserRepository;
    
    public long GgzyBiddingUserServiceImpl.countAllGgzyBiddingUsers() {
        return ggzyBiddingUserRepository.count();
    }
    
    public void GgzyBiddingUserServiceImpl.deleteGgzyBiddingUser(GgzyBiddingUser ggzyBiddingUser) {
        ggzyBiddingUserRepository.delete(ggzyBiddingUser);
    }
    
    public GgzyBiddingUser GgzyBiddingUserServiceImpl.findGgzyBiddingUser(Long id) {
        return ggzyBiddingUserRepository.findOne(id);
    }
    
    public List<GgzyBiddingUser> GgzyBiddingUserServiceImpl.findAllGgzyBiddingUsers() {
        return ggzyBiddingUserRepository.findAll();
    }
    
    public List<GgzyBiddingUser> GgzyBiddingUserServiceImpl.findGgzyBiddingUserEntries(int firstResult, int maxResults) {
        return ggzyBiddingUserRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyBiddingUserServiceImpl.saveGgzyBiddingUser(GgzyBiddingUser ggzyBiddingUser) {
    	GgzyBiddingUser biddingUserOld = ggzyBiddingUserRepository.findOne(ggzyBiddingUser.getUser().getId());
    	if(biddingUserOld != null){
    		biddingUserOld.setBiddingSubject(ggzyBiddingUser.getBiddingSubject());
    		ggzyBiddingUserRepository.save(biddingUserOld);
    		return ;
    	}
        ggzyBiddingUserRepository.save(ggzyBiddingUser);
    }
    
    public GgzyBiddingUser GgzyBiddingUserServiceImpl.updateGgzyBiddingUser(GgzyBiddingUser ggzyBiddingUser) {
        return ggzyBiddingUserRepository.save(ggzyBiddingUser);
    }
    
}
