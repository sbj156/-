package com.lmd.ggzy.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyBusinessTypeMajor;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeMajorPK;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyBusinessTypeMajor.class })
public interface GgzyBusinessTypeMajorService  extends BaseService<GgzyBusinessTypeMajor>{
	
	public void deleteByPk(GgzyBusinessTypeMajorPK pk); 
}
