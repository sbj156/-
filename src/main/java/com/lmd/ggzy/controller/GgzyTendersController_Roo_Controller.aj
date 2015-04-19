// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.util.persistence.SearchFilter;
import com.lmd.ggzy.domain.GgzyTenders;
import com.lmd.ggzy.service.GgzyApplyTenderService;
import com.lmd.ggzy.service.GgzyBidInvitationService;
import com.lmd.ggzy.service.GgzyBidOpeningService;
import com.lmd.ggzy.service.GgzyBidProService;
import com.lmd.ggzy.service.GgzyEvaluationReportService;
import com.lmd.ggzy.service.GgzyExceptionalCaseService;
import com.lmd.ggzy.service.GgzyNoticeService;
import com.lmd.ggzy.service.GgzyObjectionService;
import com.lmd.ggzy.service.GgzyProQuaApplyDocService;
import com.lmd.ggzy.service.GgzyProQuaDocService;
import com.lmd.ggzy.service.GgzyProQuaResultService;
import com.lmd.ggzy.service.GgzyProspectNoticeService;
import com.lmd.ggzy.service.GgzyTenderDocService;
import com.lmd.ggzy.service.GgzyTendersService;
import com.lmd.ggzy.service.GgzyTreeLibService;

privileged aspect GgzyTendersController_Roo_Controller {

	@Autowired
	GgzyTendersService GgzyTendersController.ggzyTendersService;

	@Autowired
	GgzyApplyTenderService GgzyTendersController.ggzyApplyTenderService;

	@Autowired
	GgzyBidInvitationService GgzyTendersController.ggzyBidInvitationService;

	@Autowired
	GgzyBidOpeningService GgzyTendersController.ggzyBidOpeningService;

	@Autowired
	GgzyBidProService GgzyTendersController.ggzyBidProService;

	@Autowired
	GgzyEvaluationReportService GgzyTendersController.ggzyEvaluationReportService;

	@Autowired
	GgzyExceptionalCaseService GgzyTendersController.ggzyExceptionalCaseService;

	@Autowired
	GgzyObjectionService GgzyTendersController.ggzyObjectionService;

	@Autowired
	GgzyProQuaApplyDocService GgzyTendersController.ggzyProQuaApplyDocService;

	@Autowired
	GgzyProQuaDocService GgzyTendersController.ggzyProQuaDocService;

	@Autowired
	GgzyProQuaResultService GgzyTendersController.ggzyProQuaResultService;

	@Autowired
	GgzyProspectNoticeService GgzyTendersController.ggzyProspectNoticeService;

	@Autowired
	GgzyTenderDocService GgzyTendersController.ggzyTenderDocService;

	@Autowired
	GgzyTreeLibService GgzyTendersController.ggzyTreeLibService;

	@Autowired
	GgzyNoticeService GgzyTendersController.noticeService;
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String GgzyTendersController.create(@Valid GgzyTenders ggzyTenders, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		AjaxObject status;
		if (bindingResult.hasErrors()) {
			status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
		}else{
			uiModel.asMap().clear();
			ggzyTendersService.saveGgzyTenders(ggzyTenders);
			status = AjaxObject.newOk(ControllerConst.ADD_SUCCESS, true);
		}
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyTendersController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyTenders());
		return "ggzytenderses/create";
	}

	@RequestMapping(value = "/{tendersId}", produces = "text/html")
	public String GgzyTendersController.show(@PathVariable("tendersId") String tendersId, Model uiModel) {
		uiModel.addAttribute("ggzyTenders", ggzyTendersService.findGgzyTenders(tendersId));
		uiModel.addAttribute("itemId", tendersId);
		return "ggzytenderses/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyTendersController.list(ServletRequest request, Page page, Model map, @RequestParam(required = false, value = "noticeId") String noticeId) {
		Specification<GgzyTenders> specification = DynamicSpecifications.bySearchFilter(request, GgzyTenders.class);
		
		map.addAttribute("page", page);
		Specifications<GgzyTenders> subSpec = Specifications.where(DynamicSpecifications.buildspecification(GgzyTenders.class, new String[]{"noticeTenderses"},new  SearchFilter.Operator[]{SearchFilter.Operator.EMPTY}, new String[]{"1"}));
		subSpec = subSpec.or(new TendersSpec());
		
		Specifications<GgzyTenders> spec = Specifications.where(subSpec);
		spec = spec.and(specification);
		
		List<GgzyTenders> list = ggzyTendersService.findByExample(spec, page);
		map.addAttribute("list", list);
		if (!StringUtils.isEmpty(noticeId))
			map.addAttribute("notice", noticeService.findGgzyNotice(noticeId));
		return "ggzytenderses/list";
	}
	@RequestMapping(value = "/list", produces = "text/html")
	public String GgzyTendersController.listAll(ServletRequest request, Page page, Model map, @RequestParam(required = false, value = "noticeId") String noticeId) {
		Specification<GgzyTenders> specification = DynamicSpecifications.bySearchFilter(request, GgzyTenders.class);
		
		map.addAttribute("page", page);
		
		List<GgzyTenders> list = ggzyTendersService.findByExample(specification, page);
		map.addAttribute("list", list);
		if (!StringUtils.isEmpty(noticeId))
			map.addAttribute("notice", noticeService.findGgzyNotice(noticeId));
		return "ggzytenderses/list";
	}

	@RequestMapping(produces = "text/html", value = "/openlist")
	public String GgzyTendersController.openlist(ServletRequest request, Page page, Model map) {
		Map<String, Object> params = new HashMap<String, Object>(request.getParameterMap());
		Specification<GgzyTenders> specification = DynamicSpecifications.buildspecification(GgzyTenders.class, new String[]{"noticeTenderses", "noticeTenderses.bidTime"}, new  SearchFilter.Operator[]{SearchFilter.Operator.EMPTY, SearchFilter.Operator.GTE}, new String[]{"0", "2014-5-1"});
				//DynamicSpecifications.bySearchFilter(params, GgzyTenders.class);
		map.addAttribute("page", page);
		List<GgzyTenders> list = ggzyTendersService.findByExample(specification, page);
		map.addAttribute("list", list);
		return "ggzytenderses/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public String GgzyTendersController.update(@Valid GgzyTenders ggzyTenders, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		AjaxObject status;
		if (bindingResult.hasErrors()) {
			status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
		}else{
			uiModel.asMap().clear();
			ggzyTendersService.updateGgzyTenders(ggzyTenders);
			status = AjaxObject.newOk(ControllerConst.UPDATE_SUCCESS, true);
		}
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	@RequestMapping(value = "/{tendersId}", params = "form", produces = "text/html")
	public String GgzyTendersController.updateForm(@PathVariable("tendersId") String tendersId, Model uiModel, @RequestParam(value = "scoreTypeParentId", required = false) Long scoreTypeParentId) {
		populateEditForm(uiModel, ggzyTendersService.findGgzyTenders(tendersId));
		if (scoreTypeParentId != null) {
			uiModel.addAttribute("scoreTypes", ggzyTreeLibService.get(scoreTypeParentId).getChildren());
		}
		return "ggzytenderses/update";
	}

	@RequestMapping(value = "/{tendersId}", method = RequestMethod.DELETE, produces = "text/html")
	public String GgzyTendersController.delete(@PathVariable("tendersId") String tendersId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		GgzyTenders ggzyTenders = ggzyTendersService.findGgzyTenders(tendersId);
		ggzyTendersService.deleteGgzyTenders(ggzyTenders);
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return "redirect:/ggzytenderses";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	String GgzyTendersController.deleteManey(@RequestParam("ids") String[] ids) {
		for (String id : ids) {
			GgzyTenders ggzyTenders = ggzyTendersService.findGgzyTenders(id);
			ggzyTendersService.deleteGgzyTenders(ggzyTenders);
		}
		return AjaxObject.newOk("删除成功！").setCallbackType("").toString();
	}

	void GgzyTendersController.populateEditForm(Model uiModel, GgzyTenders ggzyTenders) {
		uiModel.addAttribute("ggzyTenders", ggzyTenders);
		/*
		 * uiModel.addAttribute("ggzyapplytenders",
		 * ggzyApplyTenderService.findAllGgzyApplyTenders());
		 * uiModel.addAttribute("ggzybidinvitations",
		 * ggzyBidInvitationService.findAllGgzyBidInvitations());
		 * uiModel.addAttribute("ggzybidopenings",
		 * ggzyBidOpeningService.findAllGgzyBidOpenings());
		 * uiModel.addAttribute("ggzybidproes",
		 * ggzyBidProService.findAllGgzyBidProes());
		 * uiModel.addAttribute("ggzyevaluationreports",
		 * ggzyEvaluationReportService.findAllGgzyEvaluationReports());
		 * uiModel.addAttribute("ggzyexceptionalcases",
		 * ggzyExceptionalCaseService.findAllGgzyExceptionalCases());
		 * uiModel.addAttribute("ggzyobjections",
		 * ggzyObjectionService.findAllGgzyObjections());
		 * uiModel.addAttribute("ggzyproquaapplydocs",
		 * ggzyProQuaApplyDocService.findAllGgzyProQuaApplyDocs());
		 * uiModel.addAttribute("ggzyproquadocs",
		 * ggzyProQuaDocService.findAllGgzyProQuaDocs());
		 * uiModel.addAttribute("ggzyproquaresults",
		 * ggzyProQuaResultService.findAllGgzyProQuaResults());
		 * uiModel.addAttribute("ggzyprospectnotices",
		 * ggzyProspectNoticeService.findAllGgzyProspectNotices());
		 * uiModel.addAttribute("ggzytenderdocs",
		 * ggzyTenderDocService.findAllGgzyTenderDocs());
		 */
	}

	String GgzyTendersController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
		String enc = httpServletRequest.getCharacterEncoding();
		if (enc == null) {
			enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
		}
		try {
			pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
		} catch (UnsupportedEncodingException uee) {
		}
		return pathSegment;
	}

	
}
