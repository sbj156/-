// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyBasePro;
import com.lmd.ggzy.repository.GgzyBaseProRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyBaseProRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyBaseProRepository extends JpaRepository<GgzyBasePro, String>;
    
    declare parents: GgzyBaseProRepository extends JpaSpecificationExecutor<GgzyBasePro>;
    
    declare @type: GgzyBaseProRepository: @Repository;
    
}
