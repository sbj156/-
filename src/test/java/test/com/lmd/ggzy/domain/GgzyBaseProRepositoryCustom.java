package test.com.lmd.ggzy.domain;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import java.io.Serializable;
import java.util.List;

/**
 * Declares the custom methods added to the person repository.
 * @author Petri Kainulainen
 */
public interface GgzyBaseProRepositoryCustom {

//	@Query("select count(*) from GgzyBasePro")
    public long findPersonCount();
}
