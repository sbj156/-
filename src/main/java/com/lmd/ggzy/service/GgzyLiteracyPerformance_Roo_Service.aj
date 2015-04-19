package com.lmd.ggzy.service;

import java.util.List;

import com.lmd.ggzy.domain.GgzyLiteracyPerformance;

public aspect GgzyLiteracyPerformance_Roo_Service {

	public abstract long GgzyLiteracyPerformanceService.countAllGgzyLiteracyPerformances();    
    public abstract void GgzyLiteracyPerformanceService.deleteGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance);    
    public abstract GgzyLiteracyPerformance GgzyLiteracyPerformanceService.findGgzyLiteracyPerformance(String id);    
    public abstract List<GgzyLiteracyPerformance> GgzyLiteracyPerformanceService.findAllGgzyLiteracyPerformances();    
    public abstract List<GgzyLiteracyPerformance> GgzyLiteracyPerformanceService.findGgzyLiteracyPerformanceEntries(int firstResult, int maxResults);    
    public abstract void GgzyLiteracyPerformanceService.saveGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance);    
    public abstract GgzyLiteracyPerformance GgzyLiteracyPerformanceService.updateGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance);    

}
