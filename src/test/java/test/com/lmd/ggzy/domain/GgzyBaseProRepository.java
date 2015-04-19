package test.com.lmd.ggzy.domain;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;



/**
 * @author  mh_cxp
 */
public interface GgzyBaseProRepository extends JpaRepository<GgzyBasePro, String>,JpaSpecificationExecutor<GgzyBasePro>{
	
	/**
	 * @uml.property  name="nextCode"
	 */
	@Query("select max(substring(p.proCode,12)) from GgzyBasePro p")
	public Integer getNextCode();
}
