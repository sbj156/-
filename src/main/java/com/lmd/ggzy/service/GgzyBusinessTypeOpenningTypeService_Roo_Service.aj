// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType;
import com.lmd.ggzy.domain.pk.GgzyBusinessOpenTypePk;
import com.lmd.ggzy.service.GgzyBusinessTypeOpenningTypeService;
import java.util.List;

privileged aspect GgzyBusinessTypeOpenningTypeService_Roo_Service {
    
    public abstract long GgzyBusinessTypeOpenningTypeService.countAllGgzyBusinessTypeOpenningTypes();    
    public abstract void GgzyBusinessTypeOpenningTypeService.deleteGgzyBusinessTypeOpenningType(GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType);    
    public abstract GgzyBusinessTypeOpenningType GgzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningType(GgzyBusinessOpenTypePk id);    
    public abstract List<GgzyBusinessTypeOpenningType> GgzyBusinessTypeOpenningTypeService.findAllGgzyBusinessTypeOpenningTypes();    
    public abstract List<GgzyBusinessTypeOpenningType> GgzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningTypeEntries(int firstResult, int maxResults);    
    public abstract void GgzyBusinessTypeOpenningTypeService.saveGgzyBusinessTypeOpenningType(GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType);    
    public abstract GgzyBusinessTypeOpenningType GgzyBusinessTypeOpenningTypeService.updateGgzyBusinessTypeOpenningType(GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType);    
}
