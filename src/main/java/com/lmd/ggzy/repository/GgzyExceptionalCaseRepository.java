package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyExceptionalCase;

@RooJpaRepository(domainType = GgzyExceptionalCase.class)
public interface GgzyExceptionalCaseRepository {
}
