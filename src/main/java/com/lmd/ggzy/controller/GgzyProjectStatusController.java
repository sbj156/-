package com.lmd.ggzy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lmd.ggzy.domain.GgzyProjectStatus;
import com.lmd.ggzy.service.impl.GgzyProjectStatusServiceImpl;

@Controller
@RequestMapping("/ggzyprojectstatus")
public class GgzyProjectStatusController extends ControllerTemplate<GgzyProjectStatus, String>{
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(String st) {
		System.out.println((GgzyProjectStatusServiceImpl)this.service);
        return "ok";
    }
	@Override
	protected String getViewBasePath() {
		// TODO Auto-generated method stub
		return "ggzyprojectstatus";
	}
	
}
