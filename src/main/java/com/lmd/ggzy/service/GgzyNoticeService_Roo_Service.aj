// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.service.GgzyNoticeService;
import java.util.List;

privileged aspect GgzyNoticeService_Roo_Service {
    
    public abstract long GgzyNoticeService.countAllGgzyNotices();    
    public abstract void GgzyNoticeService.deleteGgzyNotice(GgzyNotice ggzyNotice);    
    public abstract GgzyNotice GgzyNoticeService.findGgzyNotice(String id);    
    public abstract List<GgzyNotice> GgzyNoticeService.findAllGgzyNotices();    
    public abstract List<GgzyNotice> GgzyNoticeService.findGgzyNoticeEntries(int firstResult, int maxResults);    
    public abstract GgzyNotice GgzyNoticeService.saveGgzyNotice(GgzyNotice ggzyNotice);    
    public abstract GgzyNotice GgzyNoticeService.updateGgzyNotice(GgzyNotice ggzyNotice);    
}
