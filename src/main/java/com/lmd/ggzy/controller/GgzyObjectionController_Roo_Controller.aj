// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyObjection;
import com.lmd.ggzy.service.GgzyBaseProService;
import com.lmd.ggzy.service.GgzyObjectionService;
import com.lmd.ggzy.service.GgzyTendersService;

privileged aspect GgzyObjectionController_Roo_Controller {

	@Autowired
	GgzyObjectionService GgzyObjectionController.ggzyObjectionService;

	@Autowired
	GgzyTendersService GgzyObjectionController.ggzyTendersService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody 
	String GgzyObjectionController.create(
			@Valid GgzyObjection ggzyObjection, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest) {
		System.out.println(ggzyObjectionService.findAllGgzyObjections());
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyObjection);
			return "ggzyobjections/create";
		}
		uiModel.asMap().clear();
		ggzyObjectionService.saveGgzyObjection(ggzyObjection);
		return new AjaxObject("添加成功").toString();
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyObjectionController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyObjection());
		return "ggzyobjections/create";
	}

	@RequestMapping(value = "/{objectionId}", produces = "text/html")
	public String GgzyObjectionController.show(
			@PathVariable("objectionId") String objectionId, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		System.out.println(objectionId);
		uiModel.addAttribute("ggzyobjection",
				ggzyObjectionService.findGgzyObjection(objectionId));
		uiModel.addAttribute("itemId", objectionId);
		return "ggzyobjections/show";
	}
 
	@RequestMapping(produces = "text/html")
	public String GgzyObjectionController.list(ServletRequest request,Model map,Page page) {
		addDateTimeFormatPatterns(map);
		Specification<GgzyObjection> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyObjection.class);
		map.addAttribute("page", page);
		List<GgzyObjection> list = ggzyObjectionService.findByExample(
				specification, page);
		map.addAttribute("list", list);
		return "ggzyobjections/list";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody
	String GgzyObjectionController.update(
			@Valid GgzyObjection ggzyObjection, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyObjection);
			return "ggzyobjections/update";
		}
		uiModel.asMap().clear();
		ggzyObjectionService.updateGgzyObjection(ggzyObjection);
		return AjaxObject.newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{objectionId}", params = "form", produces = "text/html")
	public String GgzyObjectionController.updateForm(
			@PathVariable("objectionId") String objectionId, Model uiModel) {
		populateEditForm(uiModel,
				ggzyObjectionService.findGgzyObjection(objectionId));
		return "ggzyobjections/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyObjectionController.delete(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			Model uiModel, @RequestParam("ids") String[] ids) {

		for (String id : ids) {
			GgzyObjection ggzyObjection = ggzyObjectionService
					.findGgzyObjection(id);
			ggzyObjectionService.deleteGgzyObjection(ggzyObjection);
		}
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString();
	}

	void GgzyObjectionController.addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute(
				"ggzyObjection_subtime_date_format",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
		uiModel.addAttribute(
				"ggzyObjection_processingtime_date_format",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
		uiModel.addAttribute(
				"ggzyObjection_feedbacktime_date_format",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
	}

	void GgzyObjectionController.populateEditForm(Model uiModel,
			GgzyObjection ggzyObjection) {
		uiModel.addAttribute("ggzyObjection", ggzyObjection);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzytenderses",
				ggzyTendersService.findAllGgzyTenderses());
	}

	String GgzyObjectionController.encodeUrlPathSegment(String pathSegment,
			HttpServletRequest httpServletRequest) {
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