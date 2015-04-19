package com.lmd.ggzy.hibernate.listener;

import org.hibernate.event.spi.PreInsertEvent;
import org.hibernate.event.spi.PreInsertEventListener;
import org.springframework.stereotype.Component;

import com.lmd.ggzy.domain.GgzyBasePro;
@Component
public class PreInsertListener implements PreInsertEventListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3456972593530063923L;

	@Override
	public boolean onPreInsert(PreInsertEvent event) {
		// TODO Auto-generated method stub
		Object entity =  event.getEntity();
		if(entity instanceof GgzyBasePro){
			GgzyBasePro basePro = (GgzyBasePro)entity;
			basePro.setProName("hibernate test");
		}
		return false;
	}

}
