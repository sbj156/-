package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.SubjectPerformance;

@RooJpaRepository(domainType = SubjectPerformance.class)
public interface SubjectPerformanceRepository {
}
