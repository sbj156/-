// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyBidSite;
import com.lmd.ggzy.service.GgzyBidSiteService;
import java.util.List;

privileged aspect GgzyBidSiteService_Roo_Service {
    
    public abstract long GgzyBidSiteService.countAllGgzyBidSites();    
    public abstract void GgzyBidSiteService.deleteGgzyBidSite(GgzyBidSite ggzyBidSite);    
    public abstract GgzyBidSite GgzyBidSiteService.findGgzyBidSite(Long id);    
    public abstract List<GgzyBidSite> GgzyBidSiteService.findAllGgzyBidSites();    
    public abstract List<GgzyBidSite> GgzyBidSiteService.findGgzyBidSiteEntries(int firstResult, int maxResults);    
    public abstract void GgzyBidSiteService.saveGgzyBidSite(GgzyBidSite ggzyBidSite);    
    public abstract GgzyBidSite GgzyBidSiteService.updateGgzyBidSite(GgzyBidSite ggzyBidSite);    
}
