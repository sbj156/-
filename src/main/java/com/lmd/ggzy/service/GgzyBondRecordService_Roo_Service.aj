// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.GgzyBondRecord;
import com.lmd.ggzy.service.GgzyBondRecordService;
import java.util.List;

privileged aspect GgzyBondRecordService_Roo_Service {
    
    public abstract long GgzyBondRecordService.countAllGgzyBondRecords();    
    public abstract void GgzyBondRecordService.deleteGgzyBondRecord(GgzyBondRecord ggzyBondRecord);    
    public abstract GgzyBondRecord GgzyBondRecordService.findGgzyBondRecord(String id);    
    public abstract List<GgzyBondRecord> GgzyBondRecordService.findAllGgzyBondRecords();    
    public abstract List<GgzyBondRecord> GgzyBondRecordService.findGgzyBondRecordEntries(int firstResult, int maxResults);    
    public abstract void GgzyBondRecordService.saveGgzyBondRecord(GgzyBondRecord ggzyBondRecord);    
    public abstract GgzyBondRecord GgzyBondRecordService.updateGgzyBondRecord(GgzyBondRecord ggzyBondRecord);    
}