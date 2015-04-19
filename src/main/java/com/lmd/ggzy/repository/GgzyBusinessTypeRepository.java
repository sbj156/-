package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBusinessType;

@RooJpaRepository(domainType = GgzyBusinessType.class)
public interface GgzyBusinessTypeRepository {
}
