package com.lmd.ggzy.controller.analysis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.controller.BusinessReportService;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.assist.BusinessTypeReport;
import com.lmd.ggzy.jdbc.template.ReportDao;
import com.lmd.ggzy.service.BaseService.RepoMethod;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyNoticeTendersService;
/**
 * 交易报表,周报,月报,季报,年报
 * @author mh_cxp
 *
 */
@Controller
@RequestMapping("/business/analysis/report")
public class ReportController {

	@Autowired
	private ReportDao reportDao;
	
	@Autowired
	private GgzyBusinessTypeService businessTypeService;
	
	@Autowired
	private GgzyNoticeTendersService noticeTendersService;
	
	/**
	 * 业务类型统计
	 */
	@Autowired
	private BusinessReportService businessReportService;
	/**
	 * 交易周报
	 * @param request
	 * @param uiModel
	 * @param date
	 * @return
	 */
	@RequestMapping("/weeklyreport")
	public String weeklyReport(HttpServletRequest request, Model uiModel, @RequestParam(required = false, value = "bidTime")@DateTimeFormat(pattern = "yyyy-MM-dd") Calendar date){
		if(date == null)
			date = Calendar.getInstance();
		date.setFirstDayOfWeek(Calendar.MONDAY);
		
		String week = date.get(Calendar.YEAR) + "" + date.get(Calendar.WEEK_OF_YEAR);
		uiModel.addAttribute("dateStr", date.get(Calendar.YEAR) + "年第" + date.get(Calendar.WEEK_OF_YEAR) + "周");
		populateQueryForm(uiModel, bidReport(request, uiModel, week, "yyyyiw"));
		
		return "analysis/report/weekly_report";
	}
	/**
	 * 交易月报
	 * @param request
	 * @param uiModel
	 * @param date
	 * @return
	 */
	@RequestMapping("/monthreport")
	public String monthReport(HttpServletRequest request, Model uiModel, @RequestParam(required = false, value = "bidTime")@DateTimeFormat(pattern = "yyyy-MM-dd") Calendar date){
		if(date == null)
			date = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		String month = format.format(date.getTime());
		populateQueryForm(uiModel, bidReport(request, uiModel, month, "yyyymm"));
		uiModel.addAttribute("dateStr", date.get(Calendar.YEAR) + "年" + (date.get(Calendar.MONTH) + 1) + "月份");
		return "analysis/report/month_report";
	}
	/**
	 * 交易季报
	 * @param request
	 * @param uiModel
	 * @param date
	 * @return
	 */
	@RequestMapping("/quarterreport")
	public String quarterReport(HttpServletRequest request, Model uiModel, @RequestParam(required = false, value = "bidTime")@DateTimeFormat(pattern = "yyyy-MM-dd") Calendar date){
		if(date == null)
			date = Calendar.getInstance();
		String quarterReport = date.get(Calendar.YEAR) + "" + (date.get(Calendar.MONTH)/3 + 1);
		populateQueryForm(uiModel, bidReport(request, uiModel, quarterReport, "yyyyq"));
		uiModel.addAttribute("dateStr", date.get(Calendar.YEAR) + "年第" + (date.get(Calendar.MONTH)/3 + 1) + "季度");
		return "analysis/report/quarter_report";
	}
	/**
	 * 交易年报
	 * @param request
	 * @param uiModel
	 * @param date
	 * @return
	 */
	@RequestMapping("/yearreport")
	public String yearReport(HttpServletRequest request, Model uiModel, @RequestParam(required = false, value = "bidTime")@DateTimeFormat(pattern = "yyyy-MM-dd") Calendar date){
		if(date == null)
			date = Calendar.getInstance();
		String year = date.get(Calendar.YEAR) + "";
		populateQueryForm(uiModel, bidReport(request, uiModel, year, "yyyy"));
		uiModel.addAttribute("dateStr", year + "年");
		return "analysis/report/year_report";
	}
	

	/**
	 * 按照指定的日期格式查询开标标段
	 * @param request
	 * @param uiModel
	 * @param dateStr
	 * @param dateStyle oracle日期格式
	 * @return
	 */
	public List<GgzyNoticeTenders> bidReport(HttpServletRequest request, Model uiModel,final String dateStr,final String dateStyle){
		Specification<GgzyNoticeTenders> specification = DynamicSpecifications.bySearchFilter(request, GgzyNoticeTenders.class, new Specification<GgzyNoticeTenders>() {
			@Override
			public Predicate toPredicate(Root<GgzyNoticeTenders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				query.orderBy(cb.asc(root.get("notice").get("bidDocSubEndtime")));
				return cb.equal(cb.function("to_char", String.class, root.get("notice").get("bidDocSubEndtime"), cb.literal(dateStyle)), cb.literal(dateStr));
			}
		});
		List<GgzyNoticeTenders> list = (List<GgzyNoticeTenders>)noticeTendersService.callRepositoryMethod(RepoMethod.findAll, specification);
		return list;
	}
	
	void populateQueryForm(Model uiModel, List<GgzyNoticeTenders> list) {
		List<GgzyBusinessType> businessTypes = businessTypeService.findAllGgzyBusinessTypes();
        uiModel.addAttribute("businessTypes", businessTypes);
        uiModel.addAttribute("list", list);
        BigDecimal total = BigDecimal.ZERO;
        total.setScale(2);
        List<BusinessTypeReport> businessTypeReports = new ArrayList<BusinessTypeReport>();
        for(GgzyNoticeTenders noticeTenders: list){
        	if(noticeTenders.getBiddingCandidate().getApplyTender().getGgzyBidDocs().getPrice() != null){
	        	total = total.add(noticeTenders.getBiddingCandidate().getApplyTender().getGgzyBidDocs().getPrice());
	        	businessReportService.calBusinessTypeReport(businessTypeReports, noticeTenders);
        	}
        }
        uiModel.addAttribute("total", total);
        Collections.sort(businessTypeReports);
        uiModel.addAttribute("businessTypeReports", businessTypeReports);
    }
}
