package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyMajorType;

@RooJpaRepository(domainType = GgzyMajorType.class)
public interface GgzyMajorTypeRepository {
}
