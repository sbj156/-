package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyContract;

@RooJpaRepository(domainType = GgzyContract.class)
public interface GgzyContractRepository {
}
