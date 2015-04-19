package com.lmd.ggzy.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyBasePro;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyBasePro.class })
public interface GgzyBaseProService extends BaseService<GgzyBasePro> {
}
