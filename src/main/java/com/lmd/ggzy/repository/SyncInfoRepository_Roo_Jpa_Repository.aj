// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.SyncInfo;
import com.lmd.ggzy.repository.SyncInfoRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect SyncInfoRepository_Roo_Jpa_Repository {
    
    declare parents: SyncInfoRepository extends JpaRepository<SyncInfo, String>;
    
    declare parents: SyncInfoRepository extends JpaSpecificationExecutor<SyncInfo>;
    
    declare @type: SyncInfoRepository: @Repository;
    
}
