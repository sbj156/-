package com.lmd.ggzy.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyContract;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyContract.class })
public interface GgzyContractService  extends BaseService<GgzyContract>{
}
