// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyExpert;
import com.lmd.ggzy.repository.GgzyExpertRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyExpertRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyExpertRepository extends JpaRepository<GgzyExpert, String>;
    
    declare parents: GgzyExpertRepository extends JpaSpecificationExecutor<GgzyExpert>;
    
    declare @type: GgzyExpertRepository: @Repository;
    
}
