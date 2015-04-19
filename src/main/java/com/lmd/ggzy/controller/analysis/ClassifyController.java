package com.lmd.ggzy.controller.analysis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lmd.ggzy.controller.BusinessReportService;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyMajorTypeService;

/**
 * 业务分类统计
 * @author mh_cxp
 *
 */
@Controller
@RequestMapping("/business/analysis/classify")
public class ClassifyController {

	private static final String BASE_URL = "analysis/classify/";
	
	@Autowired
	private GgzyBusinessTypeService businessTypeService;
	
	@Autowired
	private BusinessReportService reportService;
	
	@Autowired
	private GgzyMajorTypeService majorTypeService;
	/**
	 * 统计指定业务,各专业类型的数量,中标金额
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @param business_type_id
	 * @return
	 */
	@RequestMapping("/major")
	public String major(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisMajor(businessType, params));
		return BASE_URL + "major";
	}
	/**
	 * 统计指定业务,各区域的数量,中标金额
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @param business_type_id
	 * @return
	 */
	@RequestMapping("/area")
	public String area(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisArea(businessType, params));
		return BASE_URL + "area";
	}
	/**
	 * 统计指定业务,各专业类型的报名数量,投标数量
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @param business_type_id
	 * @return
	 */
	@RequestMapping("/majorapply")
	public String majorApply(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisMajorApply(businessType, params));
		return BASE_URL + "majorapply";
	}
	
	@RequestMapping("/majorbid")
	public String majorBid(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisMajorBid(businessType, params));
		return BASE_URL + "majorbid";
	}
	
	@RequestMapping("/majorbid20")
	public String majorBId20(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id, @RequestParam("major_type_id") String major_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		params.put("major_type_id", major_type_id);
		uiModel.addAttribute("majorType", majorTypeService.findGgzyMajorType(major_type_id));
		populateData(uiModel, businessType, reportService.analysisMajorBid20(businessType, params));
		return BASE_URL + "majorbid20";
	}
	
	@RequestMapping("/businessagency")
	public String businessAgency(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisBusinessAgency(params, 0));
		uiModel.addAttribute("dataPrice",reportService.analysisBusinessAgency(params, 1));
		return BASE_URL + "businessagency";
	}
	@RequestMapping("/businessexpert")
	public String businessExpert(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.analysisBusinessExpert(params));
		return BASE_URL + "businessexpert";
	}
	
	@RequestMapping("/majorprice")
	public String majorprice(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.anslysisBusinessMajorPrice(params));
		return BASE_URL + "majorprice";
	}
	@RequestMapping("/areaprice")
	public String areaprice(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(business_type_id);
		Map<String, Object> params = prepareParams(startTime, endTime, business_type_id);
		populateData(uiModel, businessType, reportService.anslysisBusinessAreaPrice(params));
		return BASE_URL + "areaprice";
	}
	private Map<String, Object> prepareParams(String startTime, String endTime, String business_type_id){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		params.put("business_type_id", business_type_id);
		return params;
	}
	
	private void populateData(Model uiModel, GgzyBusinessType businessType, List data){
		uiModel.addAttribute("businessType", businessType);
		uiModel.addAttribute("businessTypes", businessTypeService.findByExample(new GgzyBusinessType.VirtualSpecification(false)));
		uiModel.addAttribute("data", data);
	}
}
