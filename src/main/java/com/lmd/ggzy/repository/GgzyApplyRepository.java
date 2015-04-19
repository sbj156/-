package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyApply;

@RooJpaRepository(domainType = GgzyApply.class)
public interface GgzyApplyRepository {
}
