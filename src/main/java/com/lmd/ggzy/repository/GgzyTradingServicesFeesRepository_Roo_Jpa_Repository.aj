// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyTradingServicesFees;
import com.lmd.ggzy.domain.pk.GgzyRefTenderApplyPk;
import com.lmd.ggzy.repository.GgzyTradingServicesFeesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyTradingServicesFeesRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyTradingServicesFeesRepository extends JpaRepository<GgzyTradingServicesFees, GgzyRefTenderApplyPk>;
    
    declare parents: GgzyTradingServicesFeesRepository extends JpaSpecificationExecutor<GgzyTradingServicesFees>;
    
    declare @type: GgzyTradingServicesFeesRepository: @Repository;
    
}