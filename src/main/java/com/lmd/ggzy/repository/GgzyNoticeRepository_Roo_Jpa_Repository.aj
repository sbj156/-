// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.repository.GgzyNoticeRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyNoticeRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyNoticeRepository extends JpaRepository<GgzyNotice, String>;
    
    declare parents: GgzyNoticeRepository extends JpaSpecificationExecutor<GgzyNotice>;
    
    declare @type: GgzyNoticeRepository: @Repository;
    
}