package com.lmd.ggzy.hibernate.listener;


import javax.annotation.PostConstruct;

import org.hibernate.SessionFactory;
import org.hibernate.event.service.spi.EventListenerRegistry;
import org.hibernate.event.spi.EventType;
import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.beans.factory.annotation.Autowired;

public class HibernateEventWiring {
	/**
	 */
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 */
	@Autowired
	private PreInsertListener preInsertListener;

	@PostConstruct
	public void registerListeners() {
		EventListenerRegistry registry = ((SessionFactoryImpl) sessionFactory)
				.getServiceRegistry().getService(EventListenerRegistry.class);
		registry.getEventListenerGroup(EventType.PRE_INSERT).appendListener(
				preInsertListener);
	}

}
