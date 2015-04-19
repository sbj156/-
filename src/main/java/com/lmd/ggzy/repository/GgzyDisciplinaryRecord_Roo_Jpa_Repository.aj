package com.lmd.ggzy.repository;
import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
privileged aspect GgzyDisciplinaryRecord_Roo_Jpa_Repository {
	declare parents: GgzyDisciplinaryRecordRepository extends JpaRepository<GgzyDisciplinaryRecord, String>;

	declare parents: GgzyDisciplinaryRecordRepository extends JpaSpecificationExecutor<GgzyDisciplinaryRecord>;

	declare @type: GgzyDisciplinaryRecordRepository: @Repository;
}
