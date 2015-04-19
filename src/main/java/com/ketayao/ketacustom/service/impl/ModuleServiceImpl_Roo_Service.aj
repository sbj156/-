package com.ketayao.ketacustom.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ketayao.ketacustom.entity.main.Module;

public privileged aspect ModuleServiceImpl_Roo_Service {

	public Module ModuleServiceImpl.getTree(int device) {
		List<Module> rootList = makeTree(getModules(device));

		return rootList.get(0);
	}
	
	private List<Module> ModuleServiceImpl.getModules(int device){
		List<Module> list = moduleDAO.findAllWithCache();
		List<Module> deviceModules = new ArrayList<Module>();
		for(Module m : list){
			//这里device只可能取值1,2
			if((m.getShowDevice()&device) == device){
				deviceModules.add(m);
			}
		}
		return deviceModules;
	}
}
