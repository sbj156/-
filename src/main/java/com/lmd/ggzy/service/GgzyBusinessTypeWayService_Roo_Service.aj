// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import java.util.List;

import com.lmd.ggzy.domain.GgzyBusinessTypeWay;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeWayPK;

privileged aspect GgzyBusinessTypeWayService_Roo_Service {
    
    public abstract long GgzyBusinessTypeWayService.countAllGgzyBusinessTypeWays();    
    public abstract void GgzyBusinessTypeWayService.deleteGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay);    
    public abstract GgzyBusinessTypeWay GgzyBusinessTypeWayService.findGgzyBusinessTypeWay(GgzyBusinessTypeWayPK id);    
    public abstract List<GgzyBusinessTypeWay> GgzyBusinessTypeWayService.findAllGgzyBusinessTypeWays();    
    public abstract List<GgzyBusinessTypeWay> GgzyBusinessTypeWayService.findGgzyBusinessTypeWayEntries(int firstResult, int maxResults);    
    public abstract void GgzyBusinessTypeWayService.saveGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay);    
    public abstract GgzyBusinessTypeWay GgzyBusinessTypeWayService.updateGgzyBusinessTypeWay(GgzyBusinessTypeWay ggzyBusinessTypeWay);    
}
