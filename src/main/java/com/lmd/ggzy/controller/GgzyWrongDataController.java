package com.lmd.ggzy.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lmd.ggzy.domain.GgzyWrongData;
import com.lmd.ggzy.service.impl.GgzyWrongDataServiceImpl;

@Controller
@RequestMapping("ggzywrongdatas")
public class GgzyWrongDataController extends ControllerTemplate<GgzyWrongData, Long>{

	private GgzyWrongDataServiceImpl getServiceImpl(){
		return (GgzyWrongDataServiceImpl)this.service;
	}
	
	@Override
	protected String getViewBasePath() {
		// TODO Auto-generated method stub
		return "ggzywrongdatas";
	}

	@Override
	void populateEditForm(Model uiModel, GgzyWrongData entity) {
		// TODO Auto-generated method stub
		super.populateEditForm(uiModel, entity);
		
		Map<String, String> duties = new HashMap<String, String>();
		duties.put("1", "代理机构");
		duties.put("2", "主管部门");
		duties.put("3", "公岗人员");
		duties.put("4", "项目实际情况");
		uiModel.addAttribute("duties", duties);
	}

	@RequestMapping("/agencyorder")
	public String agencyOrder(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ,String agencyName,@ModelAttribute("wrongData") GgzyWrongData entity){
		uiModel.addAttribute("data", getServiceImpl().agencyOrder(prepareParams(agencyName, startTime, endTime, entity.getDutyParty())));
		this.populateEditForm(uiModel, new GgzyWrongData());
		return viewName("agencyorder");
	}
	
	
	private Map<String, Object> prepareParams(String agencyName, String startTime, String endTime, int dutyParty){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		params.put("agency", StringUtils.defaultString(agencyName));
		params.put("dutyParty", dutyParty == 0 ? "":(dutyParty + ""));
		return params;
	}
}
