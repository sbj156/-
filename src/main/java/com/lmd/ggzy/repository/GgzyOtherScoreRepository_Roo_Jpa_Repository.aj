// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.lmd.ggzy.domain.GgzyOtherScore;
import com.lmd.ggzy.domain.pk.GgzyOtherScorePk;

privileged aspect GgzyOtherScoreRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyOtherScoreRepository extends JpaRepository<GgzyOtherScore, GgzyOtherScorePk>;
    
    declare parents: GgzyOtherScoreRepository extends JpaSpecificationExecutor<GgzyOtherScore>;
    
    declare @type: GgzyOtherScoreRepository: @Repository;
    
}
