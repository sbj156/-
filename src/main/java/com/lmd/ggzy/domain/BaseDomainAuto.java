package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
@MappedSuperclass
public class BaseDomainAuto extends BaseDomain<Long>{

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	protected Long id;
	
	public Long getId() {
		return id;
	}

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;
	}
}
