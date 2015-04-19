package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;

public class AppointmentSpecification extends NoticeBusinessTypeSpecification {

	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.and(cb.equal(root.get("auditStatus"), "2"));
//		return cb.and(cb.equal(root.get("auditStatus"), "2"), cb.lessThanOrEqualTo(cb.function("trunc", String.class, root.get("tendererDocGainEndTime"), cb.literal("mi")), cb.function("trunc", String.class, cb.currentDate(), cb.literal("mi"))));
	}

}
