package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBiddingCandidate;

@RooJpaRepository(domainType = GgzyBiddingCandidate.class)
public interface GgzyBiddingCandidateRepository {
}
