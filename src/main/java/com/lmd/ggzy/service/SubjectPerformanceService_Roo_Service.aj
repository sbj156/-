// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import com.lmd.ggzy.domain.SubjectPerformance;
import com.lmd.ggzy.service.SubjectPerformanceService;
import java.util.List;

privileged aspect SubjectPerformanceService_Roo_Service {
    
    public abstract long SubjectPerformanceService.countAllSubjectPerformances();    
    public abstract void SubjectPerformanceService.deleteSubjectPerformance(SubjectPerformance subjectPerformance);    
    public abstract SubjectPerformance SubjectPerformanceService.findSubjectPerformance(String id);    
    public abstract List<SubjectPerformance> SubjectPerformanceService.findAllSubjectPerformances();    
    public abstract List<SubjectPerformance> SubjectPerformanceService.findSubjectPerformanceEntries(int firstResult, int maxResults);    
    public abstract void SubjectPerformanceService.saveSubjectPerformance(SubjectPerformance subjectPerformance);    
    public abstract SubjectPerformance SubjectPerformanceService.updateSubjectPerformance(SubjectPerformance subjectPerformance);    
}