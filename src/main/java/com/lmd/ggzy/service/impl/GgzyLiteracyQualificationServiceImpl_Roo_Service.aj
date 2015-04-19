package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.GgzyLiteracyQualification;
import com.lmd.ggzy.repository.GgzyLiteracyQualificationRepository;
import com.lmd.ggzy.service.impl.GgzyLiteracyQualificationServiceImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GgzyLiteracyQualificationServiceImpl_Roo_Service {

	declare @type: GgzyLiteracyQualificationServiceImpl: @Service;
    
    declare @type: GgzyLiteracyQualificationServiceImpl: @Transactional;
    
    @Autowired 

    GgzyLiteracyQualificationRepository GgzyLiteracyQualificationServiceImpl.ggzyLiteracyQualificationRepository;
	
    public long GgzyLiteracyQualificationServiceImpl.countAllGgzyLiteracyQualifications() {
        return ggzyLiteracyQualificationRepository.count();
    }
    
    public void GgzyLiteracyQualificationServiceImpl.deleteGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification) {
    	ggzyLiteracyQualificationRepository.delete(ggzyLiteracyQualification);
    }
    
    public GgzyLiteracyQualification GgzyLiteracyQualificationServiceImpl.findGgzyLiteracyQualification(String id) {
        return ggzyLiteracyQualificationRepository.findOne(id);
    }
    
    public List<GgzyLiteracyQualification> GgzyLiteracyQualificationServiceImpl.findAllGgzyLiteracyQualifications() {
        return ggzyLiteracyQualificationRepository.findAll();
    }
    
    public List<GgzyLiteracyQualification> GgzyLiteracyQualificationServiceImpl.findGgzyLiteracyQualificationEntries(int firstResult, int maxResults) {
        return ggzyLiteracyQualificationRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void GgzyLiteracyQualificationServiceImpl.saveGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification) {
    	ggzyLiteracyQualificationRepository.save(ggzyLiteracyQualification);
    }
    
    public GgzyLiteracyQualification GgzyLiteracyQualificationServiceImpl.updateGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification) {
        return ggzyLiteracyQualificationRepository.save(ggzyLiteracyQualification);
    }
}
