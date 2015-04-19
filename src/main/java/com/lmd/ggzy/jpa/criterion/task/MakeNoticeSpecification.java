package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyBidPro;
/**
 * 制作公告列表判断条件,继承自@BidProSpecification,
 * 进场登记后即可制作公告,所以与登记列表判断条件相同
 * @author mh_cxp
 *
 */
public class MakeNoticeSpecification extends BidProSpecification {

	public static final String SPECIFICATION = "makenotice";
	
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyBidPro> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		return cb.conjunction();
	}

}
