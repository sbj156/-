package com.lmd.ggzy.repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.domain.GgzyTenders;

@RooJpaRepository(domainType = GgzyTenders.class)
public interface GgzyTendersRepository {
	
	/**
	 * 根据bidProId查询 招标项目编号,及标段顺序号
	 * @param bidProId
	 * @return 一维数组[0]=招标项目编号,[1]=标段顺序号
	 */
	@Query(value= "select max(b.bidProCode) as aa, nvl(max(substring(t.tendersCode,21)),0) as bb from GgzyBidPro b left join b.ggzyTenderss t where b.bidProId=:bidProId")
	public Object getNextTendersCode(@Param(value = "bidProId")String bidProId);
	
	@Modifying
	@Query("update GgzyTenders t set t.notice=:notice")
	public int updateNotice(@Param("notice") GgzyNotice notice);
}
