package com.lmd.ggzy.service;

import java.util.List;


import com.lmd.ggzy.domain.GgzyLiteracyQualification;
import com.lmd.ggzy.service.GgzyLiteracyQualificationService;
import java.util.List;

public aspect GgzyLiteracyQualificationService_Roo_Service {
	
	public abstract long GgzyLiteracyQualificationService.countAllGgzyLiteracyQualifications();    
    public abstract void GgzyLiteracyQualificationService.deleteGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification);    
    public abstract GgzyLiteracyQualification GgzyLiteracyQualificationService.findGgzyLiteracyQualification(String id);    
    public abstract List<GgzyLiteracyQualification> GgzyLiteracyQualificationService.findAllGgzyLiteracyQualifications();    
    public abstract List<GgzyLiteracyQualification> GgzyLiteracyQualificationService.findGgzyLiteracyQualificationEntries(int firstResult, int maxResults);    
    public abstract void GgzyLiteracyQualificationService.saveGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification);    
    public abstract GgzyLiteracyQualification GgzyLiteracyQualificationService.updateGgzyLiteracyQualification(GgzyLiteracyQualification ggzyLiteracyQualification);    

}
