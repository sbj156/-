package com.lmd.spring.event;

import org.springframework.context.event.ContextRefreshedEvent;

/**
 * 系统启动事件处理接口
 * @author mh_cxp
 *
 */
public interface SystemStartEventHandler extends EventHandler<ContextRefreshedEvent> {

}
