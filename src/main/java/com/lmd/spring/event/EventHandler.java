package com.lmd.spring.event;

import org.springframework.context.ApplicationEvent;

/**
 * 事件处理接口
 * @author mh_cxp
 *
 */
public interface EventHandler<T extends ApplicationEvent> {

	public void handle(T event);
}
