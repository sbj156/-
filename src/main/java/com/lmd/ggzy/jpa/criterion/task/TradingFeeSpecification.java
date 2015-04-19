package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.lmd.ggzy.domain.GgzyBidPublicity;
/**
 * 交易服务费列表判断条件
 * 1.公示审核通过,且公示期已过
 * @author mh_cxp
 *
 */
public class TradingFeeSpecification extends AuditPublicitySpecification {

	public static final String SPECIFICATION = "tradingfee";
	
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyBidPublicity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		
//		return cb.and(cb.equal(root.get("auditStatus"), "2"), cb.lessThan(cb.function("trunc", String.class, root.get("publicityEndtime"), cb.literal("mi")), cb.function("trunc", String.class, cb.currentDate(), cb.literal("mi"))));
		return cb.and(cb.equal(root.get("auditStatus"), "2"));
	}
	

}
