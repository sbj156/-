// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyAttachment;
import com.lmd.ggzy.repository.GgzyAttachmentRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyAttachmentRepository_Roo_Jpa_Repository {
    
    declare parents: GgzyAttachmentRepository extends JpaRepository<GgzyAttachment, String>;
    
    declare parents: GgzyAttachmentRepository extends JpaSpecificationExecutor<GgzyAttachment>;
    
    declare @type: GgzyAttachmentRepository: @Repository;
    
    
}