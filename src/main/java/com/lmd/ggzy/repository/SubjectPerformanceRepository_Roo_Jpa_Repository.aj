// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.SubjectPerformance;
import com.lmd.ggzy.repository.SubjectPerformanceRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect SubjectPerformanceRepository_Roo_Jpa_Repository {
    
    declare parents: SubjectPerformanceRepository extends JpaRepository<SubjectPerformance, String>;
    
    declare parents: SubjectPerformanceRepository extends JpaSpecificationExecutor<SubjectPerformance>;
    
    declare @type: SubjectPerformanceRepository: @Repository;
    
}
