package com.lmd.ggzy.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.util.dwz.Page;
import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;

public aspect GgzyDisciplinaryRecordService_Roo_Service {
	public abstract long GgzyDisciplinaryRecordService.countAllGgzyDisciplinaryRecords();    
    public abstract void GgzyDisciplinaryRecordService.deleteGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord);    
    public abstract GgzyDisciplinaryRecord GgzyDisciplinaryRecordService.findGgzyDisciplinaryRecord(String id);    
    public abstract List<GgzyDisciplinaryRecord> GgzyDisciplinaryRecordService.findAllGgzyDisciplinaryRecords();    
    public abstract List<GgzyDisciplinaryRecord> GgzyDisciplinaryRecordService.findGgzyDisciplinaryRecordEntries(int firstResult, int maxResults);    
    public abstract void GgzyDisciplinaryRecordService.saveGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord);    
    public abstract GgzyDisciplinaryRecord GgzyDisciplinaryRecordService.updateGgzyDisciplinaryRecord(GgzyDisciplinaryRecord ggzyDisciplinaryRecord);    
    public abstract  List<GgzyDisciplinaryRecord> GgzyDisciplinaryRecordService.findByExample(
			Specification<GgzyDisciplinaryRecord> specification, Page page) ;
}
