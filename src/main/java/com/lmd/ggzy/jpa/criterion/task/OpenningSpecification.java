package com.lmd.ggzy.jpa.criterion.task;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;

import com.lmd.ggzy.domain.GgzyBidSite;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.GgzyProQuaResult;
import com.lmd.ggzy.jpa.criterion.SpecificationFactory;

/**
 * 开标过滤条件
 * 1.trunc(开标时间)=trunc(sysdate,'dd') 
 * 
 * @author mh_cxp
 *
 */
public class OpenningSpecification extends NoticeTendersBusinessTypeSpecification {

	@SuppressWarnings("unchecked")
	@Override
	protected Predicate buildTaskPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		/**
		 * 到开标时间
		 */
		Specifications<GgzyNoticeTenders> spec = Specifications.where(getSpecification(SpecificationFactory.DUEOPENTIME));
		/**
		 * 非(资格预审,且未预审,未预约开标场所)
		 */
		
		Specifications<GgzyNoticeTenders> quaSpec = Specifications.where(getSpecification(SpecificationFactory.NOTICETENDERSQUA));
		/*quaSpec = quaSpec.and(new Specification<GgzyNoticeTenders>() {
			@SuppressWarnings("rawtypes")
			public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder cb) {
				
				Subquery<GgzyProQuaResult> noticeQuery = query.subquery(GgzyProQuaResult.class);
				Expression<GgzyProQuaResult> select = noticeQuery.from(GgzyProQuaResult.class).join("notice");
				noticeQuery.select(select);
				noticeQuery.where(cb.equal(select, root.get("notice")));
				
				return cb.not(cb.exists(noticeQuery));
			}
		});*/
		quaSpec = quaSpec.and(new Specification<GgzyNoticeTenders>(){
			@Override
			public Predicate toPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				Subquery<GgzyBidSite> subquery = query.subquery(GgzyBidSite.class);
				Root<GgzyBidSite> bidSiteRoot =  subquery.from(GgzyBidSite.class);
				Expression<GgzyBidSite> select = bidSiteRoot.get("id");
				subquery.select(select);
				
				return cb.not(cb.exists(subquery.where(cb.equal(bidSiteRoot.get("notice"), root.get("notice")),cb.equal(bidSiteRoot.get("qua"), 0) )));
			}
			
		});
		spec = spec.and(Specifications.not(quaSpec));
		
		return cb.and(spec.toPredicate(root, query, cb), cb.equal(root.get("notice").get("auditStatus"), "2"));
	}

}
