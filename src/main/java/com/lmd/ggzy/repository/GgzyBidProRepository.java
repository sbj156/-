package com.lmd.ggzy.repository;
import java.util.Map;

import org.springframework.data.jpa.repository.Query;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBidPro;

@RooJpaRepository(domainType = GgzyBidPro.class)
public interface GgzyBidProRepository {
	/**
	 * 获取招标项目顺序号
	 * @return
	 */
	@Query("select nvl(max(substring(p.bidProCode,18)),0) from GgzyBidPro p where p.basePro.proCode=?1")
	public Integer getBidProCodeSN(String proCode);
	
	@Query("select nvl(max(substring(p.proCode,12)),0) from GgzyBidPro p where substring(p.proCode,1,11)=?1")
	public Integer getJnProCodeSN(String proCode);
}
