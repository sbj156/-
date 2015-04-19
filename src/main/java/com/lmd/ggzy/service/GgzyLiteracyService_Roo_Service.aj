package com.lmd.ggzy.service;

import java.util.List;


import com.lmd.ggzy.domain.GgzyLiteracy;
import com.lmd.ggzy.service.GgzyLiteracyService;
import java.util.List;

privileged aspect GgzyLiteracyMessageService_Roo_Service {
	 	
		public abstract long GgzyLiteracyService.countAllGgzyLiteracies();    
	    public abstract void GgzyLiteracyService.deleteGgzyLiteracy(GgzyLiteracy ggzyLiteracy);    
	    public abstract GgzyLiteracy GgzyLiteracyService.findGgzyLiteracy(String id);    
	    public abstract List<GgzyLiteracy> GgzyLiteracyService.findAllGgzyLiteracies();    
	    public abstract List<GgzyLiteracy> GgzyLiteracyService.findGgzyLiteracyEntries(int firstResult, int maxResults);    
	    public abstract void GgzyLiteracyService.saveGgzyLiteracy(GgzyLiteracy ggzyLiteracy);    
	    public abstract GgzyLiteracy GgzyLiteracyService.updateGgzyLiteracy(GgzyLiteracy ggzyLiteracy);    

}
