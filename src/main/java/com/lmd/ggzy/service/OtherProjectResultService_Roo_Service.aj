// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.OtherProjectResult;
import com.lmd.ggzy.service.OtherProjectResultService;
import java.util.List;

privileged aspect OtherProjectResultService_Roo_Service {
    
    public abstract long OtherProjectResultService.countAllOtherProjectResults();    
    public abstract void OtherProjectResultService.deleteOtherProjectResult(OtherProjectResult otherProjectResult);    
    public abstract OtherProjectResult OtherProjectResultService.findOtherProjectResult(Long id);    
    public abstract List<OtherProjectResult> OtherProjectResultService.findAllOtherProjectResults();    
    public abstract List<OtherProjectResult> OtherProjectResultService.findOtherProjectResultEntries(int firstResult, int maxResults);    
    public abstract void OtherProjectResultService.saveOtherProjectResult(OtherProjectResult otherProjectResult);    
    public abstract OtherProjectResult OtherProjectResultService.updateOtherProjectResult(OtherProjectResult otherProjectResult);    
}
