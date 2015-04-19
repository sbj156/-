package com.lmd.ggzy.repository;
 
import org.aspectj.weaver.patterns.Declare;
import com.lmd.ggzy.domain.GgzyLiteracy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect GgzyLiteracyMessageRepository_Roo_Jpa_Repository {

	declare parents: GgzyLiteracyRepository extends JpaRepository<GgzyLiteracy, String>;

	declare parents: GgzyLiteracyRepository extends JpaSpecificationExecutor<GgzyLiteracy>;
 
	
	declare @type: GgzyLiteracyRepository: @Repository;
}
