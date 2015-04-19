package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;
import com.ketayao.ketacustom.util.dwz.Page;
import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;
import com.lmd.ggzy.repository.GgzyDisciplinaryRecordRepository;


public aspect GgzyDisciplinaryRecordServiceImpl_Roo_Service {
	declare @type: GgzyDisciplinaryRecordServiceImpl: @Service;
    declare @type: GgzyDisciplinaryRecordServiceImpl: @Transactional;
    @Autowired
    GgzyDisciplinaryRecordRepository GgzyDisciplinaryRecordServiceImpl.ggzyDisciplinaryRecordRepository;
    
    public  long GgzyDisciplinaryRecordServiceImpl.countAllGgzyDisciplinaryRecords() {
    	return ggzyDisciplinaryRecordRepository.count();
	}    
    public  void GgzyDisciplinaryRecordServiceImpl.deleteGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord){
    	ggzyDisciplinaryRecordRepository.delete(ggzyDisciplinaryRecord);
    };    
    public  GgzyDisciplinaryRecord GgzyDisciplinaryRecordServiceImpl.findGgzyDisciplinaryRecord(String id){
    	return ggzyDisciplinaryRecordRepository.findOne(id);
    };    
    public  List<GgzyDisciplinaryRecord> GgzyDisciplinaryRecordServiceImpl.findAllGgzyDisciplinaryRecords(){
    	return ggzyDisciplinaryRecordRepository.findAll();
    };    
    public  List<GgzyDisciplinaryRecord> GgzyDisciplinaryRecordServiceImpl.findGgzyDisciplinaryRecordEntries(int firstResult, int maxResults){
    	return ggzyDisciplinaryRecordRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    	
    };    
    public  void GgzyDisciplinaryRecordServiceImpl.saveGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord){
    	ggzyDisciplinaryRecordRepository.save(ggzyDisciplinaryRecord);
    };    
    public  GgzyDisciplinaryRecord GgzyDisciplinaryRecordServiceImpl.updateGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord){
    	return ggzyDisciplinaryRecordRepository.save(ggzyDisciplinaryRecord);
    };    
}
