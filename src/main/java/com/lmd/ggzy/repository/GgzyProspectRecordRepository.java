package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyProspectRecord;

@RooJpaRepository(domainType = GgzyProspectRecord.class)
public interface GgzyProspectRecordRepository {
}
