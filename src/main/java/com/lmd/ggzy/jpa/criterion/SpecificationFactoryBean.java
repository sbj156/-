package com.lmd.ggzy.jpa.criterion;

import org.springframework.data.jpa.domain.Specification;
@SuppressWarnings("rawtypes")
public interface SpecificationFactoryBean {
	
	public Specification getSpecification(String name);
	public Specification getSpecification(String[] names);
}
