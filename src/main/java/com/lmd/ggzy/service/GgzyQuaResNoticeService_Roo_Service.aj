// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyQuaResNotice;
import com.lmd.ggzy.service.GgzyQuaResNoticeService;
import java.util.List;

privileged aspect GgzyQuaResNoticeService_Roo_Service {
    
    public abstract long GgzyQuaResNoticeService.countAllGgzyQuaResNotices();    
    public abstract void GgzyQuaResNoticeService.deleteGgzyQuaResNotice(GgzyQuaResNotice ggzyQuaResNotice);    
    public abstract GgzyQuaResNotice GgzyQuaResNoticeService.findGgzyQuaResNotice(String id);    
    public abstract List<GgzyQuaResNotice> GgzyQuaResNoticeService.findAllGgzyQuaResNotices();    
    public abstract List<GgzyQuaResNotice> GgzyQuaResNoticeService.findGgzyQuaResNoticeEntries(int firstResult, int maxResults);    
    public abstract void GgzyQuaResNoticeService.saveGgzyQuaResNotice(GgzyQuaResNotice ggzyQuaResNotice);    
    public abstract GgzyQuaResNotice GgzyQuaResNoticeService.updateGgzyQuaResNotice(GgzyQuaResNotice ggzyQuaResNotice);    
}