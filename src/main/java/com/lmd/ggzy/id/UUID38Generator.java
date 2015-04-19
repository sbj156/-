package com.lmd.ggzy.id;

import java.io.Serializable;
import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.GUIDGenerator;
import org.hibernate.id.IdentifierGenerator;

public class UUID38Generator implements IdentifierGenerator{

	@Override
	public Serializable generate(SessionImplementor session, Object object)
			throws HibernateException {
		// TODO Auto-generated method stub
		
		return null;
	}
	public static void main(String[] args) {
		System.out.println(UUID.randomUUID());
	}

}
