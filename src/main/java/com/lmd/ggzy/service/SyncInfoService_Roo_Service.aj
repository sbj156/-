// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.SyncInfo;
import com.lmd.ggzy.service.SyncInfoService;
import java.util.List;

privileged aspect SyncInfoService_Roo_Service {
    
    public abstract long SyncInfoService.countAllSyncInfoes();    
    public abstract void SyncInfoService.deleteSyncInfo(SyncInfo syncInfo);    
    public abstract SyncInfo SyncInfoService.findSyncInfo(String id);    
    public abstract List<SyncInfo> SyncInfoService.findAllSyncInfoes();    
    public abstract List<SyncInfo> SyncInfoService.findSyncInfoEntries(int firstResult, int maxResults);    
    public abstract void SyncInfoService.saveSyncInfo(SyncInfo syncInfo);    
    public abstract SyncInfo SyncInfoService.updateSyncInfo(SyncInfo syncInfo);    
}