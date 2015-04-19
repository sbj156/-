// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service;

import java.util.List;

import com.lmd.ggzy.domain.GgzyEvaluationReport;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;

privileged aspect GgzyEvaluationReportService_Roo_Service {
    
    public abstract long GgzyEvaluationReportService.countAllGgzyEvaluationReports();    
    public abstract void GgzyEvaluationReportService.deleteGgzyEvaluationReport(GgzyEvaluationReport ggzyEvaluationReport);    
    public abstract GgzyEvaluationReport GgzyEvaluationReportService.findGgzyEvaluationReport(GgzyNoticeTendersPk id);    
    public abstract List<GgzyEvaluationReport> GgzyEvaluationReportService.findAllGgzyEvaluationReports();    
    public abstract List<GgzyEvaluationReport> GgzyEvaluationReportService.findGgzyEvaluationReportEntries(int firstResult, int maxResults);    
    public abstract void GgzyEvaluationReportService.saveGgzyEvaluationReport(GgzyEvaluationReport ggzyEvaluationReport);    
    public abstract GgzyEvaluationReport GgzyEvaluationReportService.updateGgzyEvaluationReport(GgzyEvaluationReport ggzyEvaluationReport);    
}
