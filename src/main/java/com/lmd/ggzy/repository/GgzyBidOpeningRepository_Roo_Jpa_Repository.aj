// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyBidOpening;
import com.lmd.ggzy.repository.GgzyBidOpeningRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyBidOpeningRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyBidOpeningRepository extends JpaRepository<GgzyBidOpening, String>;
    
    declare parents: GgzyBidOpeningRepository extends JpaSpecificationExecutor<GgzyBidOpening>;
    
    declare @type: GgzyBidOpeningRepository: @Repository;
    
}
