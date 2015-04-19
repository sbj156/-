package com.lmd.ggzy.jpa.criterion.task;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.utils.SecurityUtils;
import com.lmd.ggzy.domain.GgzyBidPro;
import com.lmd.ggzy.domain.GgzyBiddingUser;
import com.lmd.ggzy.jpa.criterion.AbstractSpecification;
import com.lmd.ggzy.service.GgzyBiddingUserService;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.util.ShiroUtils;

public abstract class BusinessTaskSpecification<T> extends AbstractSpecification<T> {

	@Autowired
	private GgzyBiddingUserService biddingUserService;
	
	@Autowired
	protected GgzyBusinessTypeService businessTypeService;
	
	@Override
	protected Predicate buildPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		// TODO Auto-generated method stub
		List<Predicate> predicates = new ArrayList<Predicate>(1);
		predicates.add(buildTaskPredicate(root, query, cb));
		String businessTypeId = getBusinessTypeId();
		if(!StringUtils.isEmpty(businessTypeId)){
			predicates.add(buildBusinessTypePredicate(root, query, cb));
		}
		predicates.add(buildUserPredicate(root, query, cb));
		predicates.add(cb.equal(statusExperssion(root), GgzyBidPro.RUNNING_STATUS));
		return cb.and(predicates.toArray(new Predicate[predicates.size()]));
	}
	
	/**
	 * 流程步骤判断条件
	 * @param root
	 * @param query
	 * @param cb
	 * @return
	 */
	protected abstract Predicate buildTaskPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) ;
	
	/**
	 * 业务类型判断条件
	 * @param root
	 * @param query
	 * @param cb
	 * @return
	 */
	protected abstract Predicate buildBusinessTypePredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb);
	
	protected Predicate buildUserPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
		/**
		 * 代理机构可操作项目,
		 * 1.判断是否是代理机构用户
		 * 2.如果是只显示代理机构可操作项目
		 */
		if(ShiroUtils.hasRole("代理机构") && !ShiroUtils.hasRole("管理员")){
			GgzyBiddingUser biddingUser = (GgzyBiddingUser)biddingUserService.callRepositoryMethod("findByUserId", SecurityUtils.getShiroUser().getId());
			if(biddingUser == null){
				return cb.disjunction();
			}else{
				return cb.equal(getUserExperssion(root), biddingUser.getBiddingSubject().getBiddingSubjectId());
			}
		}
		return cb.conjunction();
	}
	
	protected abstract Expression<?> getUserExperssion(Root<T> root);
	/**
	 * 获取当前线程request中的businessTypeId
	 * @return
	 */
	protected String getBusinessTypeId() {
		return DynamicSpecifications.getRequest().getParameter("businessTypeId");
	}
	
	protected abstract Expression<?> statusExperssion(Root<T> root);
}
