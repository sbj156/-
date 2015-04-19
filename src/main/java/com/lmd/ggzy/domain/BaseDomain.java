package com.lmd.ggzy.domain;

import java.io.Serializable;

import javax.persistence.Id;

public abstract class BaseDomain<K extends Serializable> {

	public abstract K getId();

	public abstract void setId(K id);
}
