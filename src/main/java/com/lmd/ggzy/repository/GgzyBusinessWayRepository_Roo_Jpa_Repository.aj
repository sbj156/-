// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyBusinessWay;
import com.lmd.ggzy.repository.GgzyBusinessWayRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyBusinessWayRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyBusinessWayRepository extends JpaRepository<GgzyBusinessWay, String>;
    
    declare parents: GgzyBusinessWayRepository extends JpaSpecificationExecutor<GgzyBusinessWay>;
    
    declare @type: GgzyBusinessWayRepository: @Repository;
    
}