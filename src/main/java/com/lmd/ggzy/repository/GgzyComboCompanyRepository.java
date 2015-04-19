package com.lmd.ggzy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

import com.lmd.ggzy.domain.GgzyComboCompany;



@Repository
@RooJpaRepository(domainType = GgzyComboCompany.class)
public interface GgzyComboCompanyRepository extends JpaRepository<GgzyComboCompany, Long>,JpaSpecificationExecutor<GgzyComboCompany>{

}
