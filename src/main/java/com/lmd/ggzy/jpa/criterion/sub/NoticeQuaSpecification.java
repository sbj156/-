package com.lmd.ggzy.jpa.criterion.sub;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.lmd.ggzy.domain.GgzyNotice;
/**
 * 公告类型为资格预审
 * @author mh_cxp
 *
 */
public class NoticeQuaSpecification implements Specification<GgzyNotice>{

	@Override
	public Predicate toPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("noticeType").get("code"), "2");
	}

}
