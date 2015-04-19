package com.lmd.ggzy.repository;

import com.lmd.ggzy.domain.GgzyWebNotice;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by mh on 15-3-27.
 */
@Repository
public interface GgzyWebNoticeRepository extends JpaSpecificationExecutor<GgzyWebNotice>,
        CrudRepository<GgzyWebNotice, String>{
}
