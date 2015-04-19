package com.lmd.ggzy.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lmd.ggzy.domain.GgzyTendersScoreType;
import com.lmd.ggzy.domain.pk.GgzyTendersScoreTypePk;
@Repository
public interface GgzyTendersScoreTypeRepository extends JpaRepository<GgzyTendersScoreType, GgzyTendersScoreTypePk> {
}
