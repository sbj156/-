package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.GgzyLiteracyPerformance;

import com.lmd.ggzy.repository.GgzyLiteracyPerformanceRepository;
import com.lmd.ggzy.repository.GgzyLiteracyPerformanceRepository;
import com.lmd.ggzy.service.impl.GgzyLiteracyPerformanceServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
privileged aspect GgzyLiteracyPerformanceServiceImpl_Roo_Service {

	
declare @type: GgzyLiteracyPerformanceServiceImpl: @Service;
    
    declare @type: GgzyLiteracyPerformanceServiceImpl: @Transactional;
    
    @Autowired 

    GgzyLiteracyPerformanceRepository GgzyLiteracyPerformanceServiceImpl.ggzyLiteracyPerformanceRepository;
	
    public long GgzyLiteracyPerformanceServiceImpl.countAllGgzyLiteracyPerformances() {
        return ggzyLiteracyPerformanceRepository.count();
    }
    
    public void GgzyLiteracyPerformanceServiceImpl.deleteGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance) {
    	ggzyLiteracyPerformanceRepository.delete(ggzyLiteracyPerformance);
    }
    
    public GgzyLiteracyPerformance GgzyLiteracyPerformanceServiceImpl.findGgzyLiteracyPerformance(String id) {
        return ggzyLiteracyPerformanceRepository.findOne(id);
    }
    
    public List<GgzyLiteracyPerformance> GgzyLiteracyPerformanceServiceImpl.findAllGgzyLiteracyPerformances() {
        return ggzyLiteracyPerformanceRepository.findAll();
    }
    
    public List<GgzyLiteracyPerformance> GgzyLiteracyPerformanceServiceImpl.findGgzyLiteracyPerformanceEntries(int firstResult, int maxResults) {
        return ggzyLiteracyPerformanceRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyLiteracyPerformanceServiceImpl.saveGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance) {
    	ggzyLiteracyPerformanceRepository.save(ggzyLiteracyPerformance);
    }
    
    public GgzyLiteracyPerformance GgzyLiteracyPerformanceServiceImpl.updateGgzyLiteracyPerformance(GgzyLiteracyPerformance ggzyLiteracyPerformance) {
        return ggzyLiteracyPerformanceRepository.save(ggzyLiteracyPerformance);
    }
}
