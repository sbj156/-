package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyNotice;

@RooJpaRepository(domainType = GgzyNotice.class)
public interface GgzyNoticeRepository {
}
