// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package com.lmd.ggzy.repository;
import com.lmd.ggzy.domain.GgzyProQuaDoc;
import com.lmd.ggzy.repository.GgzyProQuaDocRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyProQuaDocRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyProQuaDocRepository extends JpaRepository<GgzyProQuaDoc, String>;
    
    declare parents: GgzyProQuaDocRepository extends JpaSpecificationExecutor<GgzyProQuaDoc>;
    
    declare @type: GgzyProQuaDocRepository: @Repository;
    
}
