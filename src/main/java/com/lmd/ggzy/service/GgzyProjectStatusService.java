package com.lmd.ggzy.service;

import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyProjectStatus;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyProjectStatus.class })
public interface GgzyProjectStatusService extends BaseServiceTemplate<GgzyProjectStatus, String> {
	
}
