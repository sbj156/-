package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

@MappedSuperclass
public class BaseDomainUUID extends BaseDomain<String>{

	@Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "ID", length = 32)
	protected String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
