package com.lmd.ggzy.repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBusinessTypeMajor;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeMajorPK;

@RooJpaRepository(domainType = GgzyBusinessTypeMajor.class)
public interface GgzyBusinessTypeMajorRepository {
	
	@Modifying
	@Query("delete GgzyBusinessTypeMajor where id=?1")
	public int deleteByPk(GgzyBusinessTypeMajorPK pk);
}
