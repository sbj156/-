// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyBidSite;
import com.lmd.ggzy.repository.GgzyBidSiteRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyBidSiteRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyBidSiteRepository extends JpaRepository<GgzyBidSite, Long>;
    
    declare parents: GgzyBidSiteRepository extends JpaSpecificationExecutor<GgzyBidSite>;
    
    declare @type: GgzyBidSiteRepository: @Repository;
    
}
