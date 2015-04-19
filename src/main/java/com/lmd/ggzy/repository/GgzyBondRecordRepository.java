package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBondRecord;

@RooJpaRepository(domainType = GgzyBondRecord.class)
public interface GgzyBondRecordRepository {
}
