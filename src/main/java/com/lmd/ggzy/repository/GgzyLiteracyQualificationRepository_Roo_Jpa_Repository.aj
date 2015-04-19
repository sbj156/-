package com.lmd.ggzy.repository;

import org.aspectj.weaver.patterns.Declare;
import com.lmd.ggzy.domain.GgzyLiteracyQualification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;  


privileged aspect GgzyLiteracyQualificationRepository_Roo_Jpa_Repository {

	declare parents: GgzyLiteracyQualificationRepository extends JpaRepository<GgzyLiteracyQualification, String>;

	declare parents: GgzyLiteracyQualificationRepository extends JpaSpecificationExecutor<GgzyLiteracyQualification>;
	
	
	declare @type: GgzyLiteracyQualificationRepository: @Repository;
}

