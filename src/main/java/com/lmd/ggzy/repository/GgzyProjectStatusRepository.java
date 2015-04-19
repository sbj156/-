package com.lmd.ggzy.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

import com.lmd.ggzy.domain.GgzyProjectStatus;

@RooJpaRepository(domainType = GgzyProjectStatus.class)
@Repository
public interface GgzyProjectStatusRepository extends BaseRepository<GgzyProjectStatus, String>{

}
