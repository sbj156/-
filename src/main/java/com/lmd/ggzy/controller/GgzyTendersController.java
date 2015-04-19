package com.lmd.ggzy.controller;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyExceptionalCase;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.GgzyTenders;

@RequestMapping("/business/ggzytenderses")
@Controller
@RooWebScaffold(path = "ggzytenderses", formBackingObject = GgzyTenders.class)
@RooWebJson(jsonObject = GgzyTenders.class)
public class GgzyTendersController {
	private class TendersSpec implements Specification<GgzyTenders> {
		@Override
		public Predicate toPredicate(Root<GgzyTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
			// TODO Auto-generated method stub
			Subquery<GgzyTenders> tendersQuery = query.subquery(GgzyTenders.class);
			Root<GgzyNoticeTenders> noticeTenders = tendersQuery.from(GgzyNoticeTenders.class);
			Join<GgzyNoticeTenders, GgzyTenders> join = noticeTenders.join("tenders");
			tendersQuery.select(join);
			
			Subquery<GgzyTenders> noticeTendersQuery = query.subquery(GgzyTenders.class);
			Root<GgzyExceptionalCase> exceptionalCase = noticeTendersQuery.from(GgzyExceptionalCase.class);
			Expression<GgzyTenders> join1 = exceptionalCase.join("noticeTenders").get("tenders");
			noticeTendersQuery.select(join1).alias("aa");
			noticeTendersQuery.where(cb.equal(exceptionalCase.get("dealWay").get("code"), "1"), cb.equal(exceptionalCase.get("noticeTenders"), noticeTenders));
			
			tendersQuery.where(cb.exists(noticeTendersQuery), cb.equal(noticeTenders.get("tenders"), root), cb.equal(root.get("status"), 0));
			return cb.exists(tendersQuery);
		}
	}
}
