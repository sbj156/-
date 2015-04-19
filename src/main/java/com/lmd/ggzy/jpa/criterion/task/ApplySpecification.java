package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyNotice;
/**
 * 接受报名列表判断条件
 * 1.审核通过(这里不对报名时间段进行判断,只要是审核通过的公告都会出现在报名列表中)
 * @author mh_cxp
 *
 */
public class ApplySpecification extends NoticeBusinessTypeSpecification {

	public static final String SPECIFICATION = "apply";
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		return cb.equal(root.get("auditStatus"), "2");
	}
}
