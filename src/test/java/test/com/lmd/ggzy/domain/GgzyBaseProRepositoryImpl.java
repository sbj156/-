package test.com.lmd.ggzy.domain;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaMetamodelEntityInformation;
import org.springframework.data.jpa.repository.support.QueryDslJpaRepository;
import org.springframework.stereotype.Repository;


/**
 * @author Petri Kainulainen
 */
@Repository("aa")
public class GgzyBaseProRepositoryImpl implements GgzyBaseProRepositoryCustom {

    private static final Logger LOGGER = LoggerFactory.getLogger(GgzyBaseProRepositoryImpl.class);

    protected static final int NUMBER_OF_PERSONS_PER_PAGE = 5;

    /**
	 * @uml.property  name="entityManager"
	 * @uml.associationEnd  readOnly="true"
	 */
    @PersistenceContext
    private EntityManager entityManager;


    public GgzyBaseProRepositoryImpl() {

    }


    @Override
    public long findPersonCount() {
        LOGGER.debug("Finding person count with search term: " );

        //Passes the predicate to the repository
        return 1l;
    }


    /**
     * Returns a new object which specifies the the wanted result page.
     * @param pageIndex The index of the wanted result page
     * @return
     */
    private Pageable constructPageSpecification(int pageIndex) {
        Pageable pageSpecification = new PageRequest(pageIndex, NUMBER_OF_PERSONS_PER_PAGE, sortByLastNameAsc());
        return pageSpecification;
    }

    /**
     * Returns a Sort object which sorts persons in ascending order by using the last name.
     * @return
     */
    private Sort sortByLastNameAsc() {
        return new Sort(Sort.Direction.ASC, "lastName");
    }


}
