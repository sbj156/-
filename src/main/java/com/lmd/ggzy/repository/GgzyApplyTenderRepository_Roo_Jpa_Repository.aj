// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyApplyTender;
import com.lmd.ggzy.repository.GgzyApplyTenderRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyApplyTenderRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyApplyTenderRepository extends JpaRepository<GgzyApplyTender, String>;
    
    declare parents: GgzyApplyTenderRepository extends JpaSpecificationExecutor<GgzyApplyTender>;
    
    declare @type: GgzyApplyTenderRepository: @Repository;
    
}
