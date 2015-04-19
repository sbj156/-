package com.lmd.ggzy.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyNotice;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyNotice.class })
public interface GgzyNoticeService  extends BaseService<GgzyNotice>{
	public abstract GgzyNotice makeNotice(GgzyNotice notice, String[] tendersIds);
}
