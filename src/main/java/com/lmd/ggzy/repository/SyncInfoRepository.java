package com.lmd.ggzy.repository;
import com.lmd.ggzy.domain.SyncInfo;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = SyncInfo.class)
public interface SyncInfoRepository {
}
