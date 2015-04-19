package com.lmd.spring.event;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
/**
 * 系统初始化监听器
 * @author mh_cxp
 *
 */
@Component
public class SystemStartListener implements ApplicationListener<ContextRefreshedEvent>{

	private org.slf4j.Logger logger = LoggerFactory.getLogger(SystemStartListener.class);
			
	@Autowired
	private List<SystemStartEventHandler> eventHandlers;
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		// TODO Auto-generated method stub
		logger.info("SystemStartListener#ContextRefreshedEvent(event)");
		/**
		 * event.getApplicationContext().getParent() == null 判断保证只有在root context初始化时执行,如果没有这个判断初始化mvc context后也会执行
		 */
		if(eventHandlers != null && event.getApplicationContext().getParent() == null)
			for(SystemStartEventHandler handler : eventHandlers){
				handler.handle(event);
			}
	}
}
