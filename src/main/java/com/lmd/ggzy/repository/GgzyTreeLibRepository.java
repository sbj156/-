package com.lmd.ggzy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.lmd.ggzy.domain.GgzyTreeLib;

@Repository
public interface GgzyTreeLibRepository extends JpaRepository<GgzyTreeLib, Long>, JpaSpecificationExecutor<GgzyTreeLib>{

	GgzyTreeLib getByNameAndParentId(String name, Long id);
	
	GgzyTreeLib getByName(String name);
	
	@Query("from GgzyTreeLib o order by o.priority ASC")
	List<GgzyTreeLib> findAllWithCache();

}
