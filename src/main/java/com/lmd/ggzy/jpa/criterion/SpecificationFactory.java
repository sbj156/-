package com.lmd.ggzy.jpa.criterion;

import java.util.Arrays;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;

/**
 * Helper class to easily combine {@link Specification} instances.
 * 
 */
@SuppressWarnings("rawtypes")
public class SpecificationFactory implements InitializingBean, SpecificationFactoryBean{

	/**
	 * 开标
	 */
	public static final String OPENNING = "bidopening";
	/**
	 * 专家抽取
	 */
	public static final String EXPERT_APPLY = "expert_apply";
	/**
	 * 评标
	 */
	public static final String EVALUATION = "evaluation";
	
	/**
	 * 到开标时间
	 */
	public static final String DUEOPENTIME = "dueopentime";
	
	/**
	 * 资格预审公告
	 */
	public static final String NOTICEQUA = "proqua";
	
	/**
	 * 标段公告为资格预审
	 */
	public static final String NOTICETENDERSQUA = "noticetendersqua";
	
	public static final String QUA_TIME = "quatime";
	
	/**
	 * key : taskId
	 * 
	 * @return
	 */
	private Map<String, Specification> specifications;

	
	public Map<String, Specification> getSpecifications() {
		return specifications;
	}

	public void setSpecifications(Map<String, Specification> specifications) {
		this.specifications = specifications;
	}
	
	public Specification getSpecification(String name){
		return specifications.get(name);
	}
	
	@SuppressWarnings("unchecked")
	public Specification getSpecification(String[] names){
		if(ArrayUtils.isEmpty(names))
			return null;
		Specifications spec = Specifications.where(null);
		for(String name : names){
			spec = spec.and(specifications.get(name));
		}
		return spec;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}
}

	