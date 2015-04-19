package com.lmd.ggzy.jpa.criterion.sub;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.lmd.ggzy.domain.GgzyNoticeTenders;
/**
 * 资格预审noticeTenders
 * @author mh_cxp
 *
 */
public class NoticeTendersQuaSpecification implements Specification<GgzyNoticeTenders> {

	@Override
	public Predicate toPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("notice").get("noticeType").get("code"), "2");
	}

}
