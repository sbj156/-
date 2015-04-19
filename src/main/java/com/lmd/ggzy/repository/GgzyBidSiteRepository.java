package com.lmd.ggzy.repository;
import java.util.Calendar;

import com.lmd.ggzy.domain.GgzyBidSite;
import com.mysema.query.annotations.QueryProjection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = GgzyBidSite.class)
public interface GgzyBidSiteRepository {
	
	/**
	 * 查询指定时间开标项目数量
	 * @return
	 */
	@Query("select count(1) from GgzyBidSite bs where trunc(decode(bs.qua,0,bs.notice.bidDocSubEndtime,bs.notice.quaTime),'dd')=trunc(:date_)")
	public int bidAmount(@Param("date_") Calendar date);
}
