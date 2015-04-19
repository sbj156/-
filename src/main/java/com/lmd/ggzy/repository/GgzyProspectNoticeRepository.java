package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyProspectNotice;

@RooJpaRepository(domainType = GgzyProspectNotice.class)
public interface GgzyProspectNoticeRepository {
}
