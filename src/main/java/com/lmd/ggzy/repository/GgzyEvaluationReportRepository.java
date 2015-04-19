package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyEvaluationReport;

@RooJpaRepository(domainType = GgzyEvaluationReport.class)
public interface GgzyEvaluationReportRepository {
}
