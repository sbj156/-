package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyLiteracy;
import com.lmd.ggzy.repository.GgzyLiteracyRepository;


privileged aspect GgzyLiteracyServiceImpl_Roo_Service {

	 	declare @type: GgzyLiteracyServiceImpl: @Service;
	    
	    declare @type: GgzyLiteracyServiceImpl: @Transactional;
	    
	    @Autowired 

	    GgzyLiteracyRepository GgzyLiteracyServiceImpl.ggzyLiteracyRepository;
		
	    public long GgzyLiteracyServiceImpl.countAllGgzyLiteracies() {
	        return ggzyLiteracyRepository.count();
	    }
	    
	    public void GgzyLiteracyServiceImpl.deleteGgzyLiteracy(GgzyLiteracy ggzyLiteracy) {
	    	ggzyLiteracyRepository.delete(ggzyLiteracy);
	    }
	    
	    public GgzyLiteracy GgzyLiteracyServiceImpl.findGgzyLiteracy(String id) {
	        return ggzyLiteracyRepository.findOne(id);
	    }
	    
	    public List<GgzyLiteracy> GgzyLiteracyServiceImpl.findAllGgzyLiteracies() {
	        return ggzyLiteracyRepository.findAll();
	    }
	    
	    public List<GgzyLiteracy> GgzyLiteracyServiceImpl.findGgzyLiteracyEntries(int firstResult, int maxResults) {
	        return ggzyLiteracyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
	    }
	    
	    public void GgzyLiteracyServiceImpl.saveGgzyLiteracy(GgzyLiteracy ggzyLiteracy) {
	    	ggzyLiteracyRepository.save(ggzyLiteracy);
	    }
	    
	    public GgzyLiteracy GgzyLiteracyServiceImpl.updateGgzyLiteracy(GgzyLiteracy ggzyLiteracy) {
	        return ggzyLiteracyRepository.save(ggzyLiteracy);
	    }
	    
}
