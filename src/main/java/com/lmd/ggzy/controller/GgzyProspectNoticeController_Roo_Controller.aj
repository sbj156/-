// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.controller.GgzyProspectNoticeController;
import com.lmd.ggzy.domain.GgzyObjection;
import com.lmd.ggzy.domain.GgzyProspectNotice;
import com.lmd.ggzy.service.GgzyProspectNoticeService;
import com.lmd.ggzy.service.GgzyTendersService;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GgzyProspectNoticeController_Roo_Controller {

	@Autowired
	GgzyProspectNoticeService GgzyProspectNoticeController.ggzyProspectNoticeService;

	@Autowired
	GgzyTendersService GgzyProspectNoticeController.ggzyTendersService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyProspectNoticeController.create(
			@Valid GgzyProspectNotice ggzyProspectNotice,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyProspectNotice);
			return "ggzyprospectnotices/create";
		}
		uiModel.asMap().clear();
		ggzyProspectNoticeService.saveGgzyProspectNotice(ggzyProspectNotice);
		return new AjaxObject("添加成功").toString();
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyProspectNoticeController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyProspectNotice());
		return "ggzyprospectnotices/create";
	}

	@RequestMapping(value = "/{prospectNoticeId}", produces = "text/html")
	public String GgzyProspectNoticeController.show(
			@PathVariable("prospectNoticeId") String prospectNoticeId,
			Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyprospectnotice", ggzyProspectNoticeService
				.findGgzyProspectNotice(prospectNoticeId));
		uiModel.addAttribute("itemId", prospectNoticeId);
		return "ggzyprospectnotices/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyProspectNoticeController.list(ServletRequest request,
			Model map, Page page) {
		
		addDateTimeFormatPatterns(map);
		Specification<GgzyProspectNotice> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyProspectNotice.class);
		map.addAttribute("page", page);
		List<GgzyProspectNotice> list = ggzyProspectNoticeService
				.findByExample(specification, page);
		map.addAttribute("list", list);
		return "ggzyprospectnotices/list";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody
	String GgzyProspectNoticeController.update(
			@Valid GgzyProspectNotice ggzyProspectNotice,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {

		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyProspectNotice);
			return "ggzyprospectnotices/update";
		}
		uiModel.asMap().clear();
		ggzyProspectNoticeService.updateGgzyProspectNotice(ggzyProspectNotice);
		return new AjaxObject().newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{prospectNoticeId}", params = "form", produces = "text/html")
	public String GgzyProspectNoticeController.updateForm(
			@PathVariable("prospectNoticeId") String prospectNoticeId,
			Model uiModel) {
		populateEditForm(uiModel,
				ggzyProspectNoticeService
						.findGgzyProspectNotice(prospectNoticeId));
		return "ggzyprospectnotices/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyProspectNoticeController.delete(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			Model uiModel, @RequestParam("ids") String[] ids) {

		for (String id : ids) {
			GgzyProspectNotice ggzyprospectnotices = ggzyProspectNoticeService
					.findGgzyProspectNotice(id); 
			ggzyProspectNoticeService.deleteGgzyProspectNotice(ggzyprospectnotices);
		}
		
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString(); 
	}

	void GgzyProspectNoticeController.addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute(
				"ggzyProspectNotice_publishtime_date_format",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
	}

	void GgzyProspectNoticeController.populateEditForm(Model uiModel,
			GgzyProspectNotice ggzyProspectNotice) {
		uiModel.addAttribute("ggzyProspectNotice", ggzyProspectNotice);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzytenderses",
				ggzyTendersService.findAllGgzyTenderses());
	}

	String GgzyProspectNoticeController.encodeUrlPathSegment(
			String pathSegment, HttpServletRequest httpServletRequest) {
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