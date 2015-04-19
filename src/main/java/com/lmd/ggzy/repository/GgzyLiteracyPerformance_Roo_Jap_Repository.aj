package com.lmd.ggzy.repository;

import org.aspectj.weaver.patterns.Declare;
import com.lmd.ggzy.domain.GgzyLiteracyPerformance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;  

public aspect GgzyLiteracyPerformance_Roo_Jap_Repository {

	declare parents: GgzyLiteracyPerformanceRepository extends JpaRepository<GgzyLiteracyPerformance, String>;

	declare parents: GgzyLiteracyPerformanceRepository extends JpaSpecificationExecutor<GgzyLiteracyPerformance>;


	declare @type: GgzyLiteracyPerformanceRepository: @Repository;
}
