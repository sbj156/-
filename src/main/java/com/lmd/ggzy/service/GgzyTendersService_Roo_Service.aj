// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyTenders;
import com.lmd.ggzy.service.GgzyTendersService;
import java.util.List;

privileged aspect GgzyTendersService_Roo_Service {
    
    public abstract long GgzyTendersService.countAllGgzyTenderses();    
    public abstract void GgzyTendersService.deleteGgzyTenders(GgzyTenders ggzyTenders);    
    public abstract GgzyTenders GgzyTendersService.findGgzyTenders(String id);    
    public abstract List<GgzyTenders> GgzyTendersService.findAllGgzyTenderses();    
    public abstract List<GgzyTenders> GgzyTendersService.findGgzyTendersEntries(int firstResult, int maxResults);    
    public abstract void GgzyTendersService.saveGgzyTenders(GgzyTenders ggzyTenders);    
    public abstract GgzyTenders GgzyTendersService.updateGgzyTenders(GgzyTenders ggzyTenders);    
}
