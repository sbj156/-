// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyTenderDoc;
import com.lmd.ggzy.service.GgzyTenderDocService;
import java.util.List;

privileged aspect GgzyTenderDocService_Roo_Service {
    
    public abstract long GgzyTenderDocService.countAllGgzyTenderDocs();    
    public abstract void GgzyTenderDocService.deleteGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc);    
    public abstract GgzyTenderDoc GgzyTenderDocService.findGgzyTenderDoc(String id);    
    public abstract List<GgzyTenderDoc> GgzyTenderDocService.findAllGgzyTenderDocs();    
    public abstract List<GgzyTenderDoc> GgzyTenderDocService.findGgzyTenderDocEntries(int firstResult, int maxResults);    
    public abstract void GgzyTenderDocService.saveGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc);    
    public abstract GgzyTenderDoc GgzyTenderDocService.updateGgzyTenderDoc(GgzyTenderDoc ggzyTenderDoc);    
}