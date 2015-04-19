package com.lmd.ggzy.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyApply;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyApply.class })
public interface GgzyApplyService extends BaseService<GgzyApply>{
    public void updateOfficial(String[] applyIds, boolean official);

}
