package com.lmd.ggzy.jpa.criterion.task;

import com.lmd.ggzy.domain.GgzyExceptionalCase;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * Created by mh_cxp on 2014/11/11.
 */
public class ReRunSpecification extends ExceptionCaseSpecification {
    @Override
    protected Predicate buildTaskPredicate(Root<GgzyExceptionalCase> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
        return cb.and(super.buildTaskPredicate(root, query, cb), cb.equal(root.get("dealWay").get("code"), "3"));
    }
}
