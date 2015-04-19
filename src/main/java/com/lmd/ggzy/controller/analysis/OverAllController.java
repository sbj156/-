/**
 * 
 */
package com.lmd.ggzy.controller.analysis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.controller.BusinessReportService;
import com.lmd.ggzy.domain.GgzyBidPro;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyNoticeTendersService;

/**业务总体统计controller
 * @author mh_cxp
 *
 */
@Controller
@RequestMapping("/business/analysis/overall")
public class OverAllController {
	
	@Autowired
	private GgzyBusinessTypeService businessTypeService;
	
	@Autowired
	private BusinessReportService reportService;
	
	@Autowired
	private GgzyNoticeTendersService noticeTendersService;
	
	private static final String BASE_URL = "analysis/overall/";
	
	/**
	 * 项目总体情况统计
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/general")
	public String general(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params =prepareParams(startTime, endTime);
		
		uiModel.addAttribute("register", reportService.analysisRegister(new Specification<GgzyBidPro>() {
			@Override
			public Predicate toPredicate(Root<GgzyBidPro> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Expression createTime = cb.function("to_char", String.class, root.get("createTime"), cb.literal("yyyy-mm-dd"));
				return cb.and(cb.greaterThanOrEqualTo(createTime, startTime), cb.lessThanOrEqualTo(createTime, endTime));
			}
		}));
		uiModel.addAttribute("notice", reportService.analysisNotice(new Specification<GgzyNotice>() {

			@Override
			public Predicate toPredicate(Root<GgzyNotice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Expression createTime = cb.function("to_char", String.class, root.get("auditTime"), cb.literal("yyyy-mm-dd"));
				return cb.and(cb.greaterThanOrEqualTo(createTime, startTime), cb.lessThanOrEqualTo(createTime, endTime));
			}
		}));
		uiModel.addAttribute("openning", reportService.analysisOpenning(params));
		uiModel.addAttribute("openningException", reportService.analysisException(params, "openning"));
		uiModel.addAttribute("eval", reportService.analysisEval(params));
		uiModel.addAttribute("evalException", reportService.analysisException(params, "eval"));
		uiModel.addAttribute("publicity", reportService.analysisPulicity(params));
		uiModel.addAttribute("resNotice", reportService.analysisResNotice(params));
		populateData(uiModel);
		return BASE_URL + "general";
	}

	/**
	 * 项目废标情况
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/annull")
	public String annull(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params = prepareParams(startTime, endTime);
		
		uiModel.addAttribute("openning", reportService.analysisOpenning(params));
		uiModel.addAttribute("openningException", reportService.analysisException(params, "openning"));
		uiModel.addAttribute("eval", reportService.analysisEval(params));
		uiModel.addAttribute("evalException", reportService.analysisException(params, "eval"));
		populateData(uiModel);
		return BASE_URL + "annull";
	}
	/**
	 * 统计各类业务中标次数排名第一的企业
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/businessfirst")
	public String businessFirst(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params = prepareParams(startTime, endTime);
		uiModel.addAttribute("first", reportService.analysisBusinessFirst(params));
		return BASE_URL + "businessfirst";
	}
	
	/**
	 * 专家参与情况
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/expertcase")
	public String expertCase(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params = prepareParams(startTime, endTime);
		uiModel.addAttribute("expert",reportService.analysisExpert(params));
		return BASE_URL + "expertcase";
	}
	
	/**
	 * 代理机构参与情况
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/agencycase")
	public String agencyCase(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params = prepareParams(startTime, endTime);
		uiModel.addAttribute("agency",reportService.analysisAgency(params, 0));
		uiModel.addAttribute("agencyPrice",reportService.analysisAgency(params, 1));
		return BASE_URL + "agencycase";
	}
	
	/**
	 * 专家参与次数统计,取每类业务专家参与次数前三名
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/expertamount")
	public String expertAmount(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime ){
		Map<String, Object> params = prepareParams(startTime, endTime);
		uiModel.addAttribute("expert",reportService.analysisExpertAmount(params, 0));
		return BASE_URL + "expertamount";
	}
	/**
	 * 统计指定业务类型专家参与次数前20名
	 * @param uiModel
	 * @param startTime
	 * @param endTime
	 * @param business_type_id
	 * @return
	 */
	@RequestMapping("/businessexpert")
	public String businessExpert(Model uiModel, @RequestParam(value = "startTime", required = false, defaultValue = "2010-01-01") final String startTime, @RequestParam(value = "endTime", required = false, defaultValue = "2050-01-01") final String endTime , @RequestParam(value = "business_type_id", required = false, defaultValue = "F785D42A3F81B399E040007F0100159F") final String business_type_id){
		Map<String, Object> params = prepareParams(startTime, endTime);
		params.put("business_type_id", business_type_id);
		uiModel.addAttribute("expert",reportService.analysisBusinessExpert(params, 0));
		return BASE_URL + "businessexpert";
	}
	
	/**
	 * 综合查询
	 * @return
	 */
	@RequestMapping("comprehensivequery")
	public String comprehensiveQuery(HttpServletRequest request, Model uiModel, Page page){
		Specification<GgzyNoticeTenders> specification = DynamicSpecifications.bySearchFilter(request, GgzyNoticeTenders.class);
		List<GgzyNoticeTenders> list = noticeTendersService.findByExample(specification, page);
		uiModel.addAttribute("list", list);
		uiModel.addAttribute("page", page);
		populateData(uiModel);
		return BASE_URL + "comprehensivequery";
	}
	private Map<String, Object> prepareParams(String startTime, String endTime){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startTime", startTime);
		params.put("endTime", endTime);
		return params;
	}
	void populateData(Model uiModel) {
        uiModel.addAttribute("businessTypes", businessTypeService.findByExample(new GgzyBusinessType.VirtualSpecification(false)));
	}
}
