package com.lmd.ggzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyBasePro;

/**
 * @author  mh_cxp
 */
@RooJpaRepository(domainType = GgzyBasePro.class)
public interface GgzyBaseProRepository {
	List<GgzyBasePro> findByAreaId(Long id);
	
	/**
	 * 获取当前项目顺序号
	 * @return
	 * @uml.property  name="currySN"
	 */
	@Query("select nvl(max(substring(p.proCode,12)),0) from GgzyBasePro p")
	public Integer getCurrySN();
}
