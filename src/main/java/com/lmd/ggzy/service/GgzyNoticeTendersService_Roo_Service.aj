// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.service.GgzyNoticeTendersService;
import java.util.List;

privileged aspect GgzyNoticeTendersService_Roo_Service {
    
    public abstract long GgzyNoticeTendersService.countAllGgzyNoticeTenderses();    
    public abstract void GgzyNoticeTendersService.deleteGgzyNoticeTenders(GgzyNoticeTenders ggzyNoticeTenders);    
    public abstract GgzyNoticeTenders GgzyNoticeTendersService.findGgzyNoticeTenders(GgzyNoticeTendersPk id);    
    public abstract List<GgzyNoticeTenders> GgzyNoticeTendersService.findAllGgzyNoticeTenderses();    
    public abstract List<GgzyNoticeTenders> GgzyNoticeTendersService.findGgzyNoticeTendersEntries(int firstResult, int maxResults);    
    public abstract void GgzyNoticeTendersService.saveGgzyNoticeTenders(GgzyNoticeTenders ggzyNoticeTenders);    
    public abstract GgzyNoticeTenders GgzyNoticeTendersService.updateGgzyNoticeTenders(GgzyNoticeTenders ggzyNoticeTenders);    
}