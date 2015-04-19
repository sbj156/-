package com.lmd.ggzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyAuditRes;

@RooJpaRepository(domainType = GgzyAuditRes.class)
public interface GgzyAuditResRepository {
	
	@Query("from GgzyAuditRes r where r.auditTabPk=:tabpk order by r.auditTime desc")
	public List<GgzyAuditRes> getByTabPk(@Param(value = "tabpk") String tabPk);
}
