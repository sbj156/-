package com.lmd.ggzy.repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBiddingResNotice;

@RooJpaRepository(domainType = GgzyBiddingResNotice.class)
public interface GgzyBiddingResNoticeRepository {
	@Query("select nvl(max(num),0) from GgzyBiddingResNotice")
    public int getMaxNum();
}
