// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyProQuaResult;
import com.lmd.ggzy.service.GgzyProQuaResultService;
import java.util.List;

privileged aspect GgzyProQuaResultService_Roo_Service {
    
    public abstract long GgzyProQuaResultService.countAllGgzyProQuaResults();    
    public abstract void GgzyProQuaResultService.deleteGgzyProQuaResult(GgzyProQuaResult ggzyProQuaResult);    
    public abstract GgzyProQuaResult GgzyProQuaResultService.findGgzyProQuaResult(String id);    
    public abstract List<GgzyProQuaResult> GgzyProQuaResultService.findAllGgzyProQuaResults();    
    public abstract List<GgzyProQuaResult> GgzyProQuaResultService.findGgzyProQuaResultEntries(int firstResult, int maxResults);    
    public abstract void GgzyProQuaResultService.saveGgzyProQuaResult(GgzyProQuaResult ggzyProQuaResult);    
    public abstract GgzyProQuaResult GgzyProQuaResultService.updateGgzyProQuaResult(GgzyProQuaResult ggzyProQuaResult);    
}
