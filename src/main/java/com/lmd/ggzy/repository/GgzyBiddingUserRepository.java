package com.lmd.ggzy.repository;
import com.lmd.ggzy.domain.GgzyBiddingUser;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = GgzyBiddingUser.class)
public interface GgzyBiddingUserRepository {
	public GgzyBiddingUser findByUserId(Long userId);
}
