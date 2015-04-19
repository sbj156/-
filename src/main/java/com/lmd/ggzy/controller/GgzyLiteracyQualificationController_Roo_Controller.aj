package com.lmd.ggzy.controller;

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

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyLiteracy;
import com.lmd.ggzy.domain.GgzyLiteracyQualification;
import com.lmd.ggzy.service.GgzyLiteracyQualificationService;
import com.lmd.ggzy.service.GgzyLiteracyService;

public aspect GgzyLiteracyQualificationController_Roo_Controller {

	@Autowired
	GgzyLiteracyQualificationService GgzyLiteracyQualificationController.ggzyLiteracyQualificationService;
	
	@Autowired
	GgzyLiteracyService GgzyLiteracyQualificationController.ggzyLiteracyService; 

	@RequestMapping(method = RequestMethod.POST, produces = "text/html") 
	public @ResponseBody
	String GgzyLiteracyQualificationController.create(
			@Valid GgzyLiteracyQualification ggzyLiteracyQualification,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracyQualification);
			return "ggzyliteracyqualifications/create";
		}
		ggzyLiteracyQualificationService.saveGgzyLiteracyQualification(ggzyLiteracyQualification);
		return new AjaxObject("添加成功").toString();
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyLiteracyQualificationController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyLiteracyQualification());
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		
		return "ggzyliteracyqualifications/create";
	}

	@RequestMapping(value = "/{qualificationId}", produces = "text/html")
	public String GgzyLiteracyQualificationController.show(
			@PathVariable("qualificationId") String qualificationId, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyliteracyqualification", ggzyLiteracyQualificationService
				.findGgzyLiteracyQualification(qualificationId));
		uiModel.addAttribute("itemId", qualificationId);
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		return "ggzyliteracyqualifications/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyLiteracyQualificationController.list(ServletRequest request,
			Model map, Page page) {
		addDateTimeFormatPatterns(map);
		Specification<GgzyLiteracyQualification> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyLiteracyQualification.class);
		map.addAttribute("page", page);
		List<GgzyLiteracyQualification> list = ggzyLiteracyQualificationService
				.findByExample(specification, page);

		map.addAttribute("list", list);
		return "ggzyliteracyqualifications/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyQualificationController.update(
			@Valid GgzyLiteracyQualification ggzyLiteracyQualification,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracyQualification);
			return "ggzyliteracyqualifications/update";
		}
		uiModel.asMap().clear();
		ggzyLiteracyQualificationService
				.updateGgzyLiteracyQualification(ggzyLiteracyQualification);
		return new AjaxObject().newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{qualificationId}", params = "form", produces = "text/html")
	public String GgzyLiteracyQualificationController.updateForm(
			@PathVariable("qualificationId") String qualificationId, Model uiModel) {
		populateEditForm(uiModel,
				ggzyLiteracyQualificationService
						.findGgzyLiteracyQualification(qualificationId));
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		return "ggzyliteracyqualifications/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyQualificationController.delete(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			@RequestParam("ids") String[] ids,Model uiModel) {
		for(String id:ids) {
			GgzyLiteracyQualification ggzyLiteracyQualification = ggzyLiteracyQualificationService
					.findGgzyLiteracyQualification(id);
			ggzyLiteracyQualificationService
					.deleteGgzyLiteracyQualification(ggzyLiteracyQualification);
		}
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString();
	}

	void GgzyLiteracyQualificationController.addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute(
				"ggzyLiteracys_birthday",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
	}

	void GgzyLiteracyQualificationController.populateEditForm(Model uiModel,
			GgzyLiteracyQualification ggzyLiteracyQualification) {
		uiModel.addAttribute("ggzyliteracyqualification", ggzyLiteracyQualification);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyliteracy", ggzyLiteracyService.findAllGgzyLiteracies()); 
	}

	String GgzyLiteracyQualificationController.encodeUrlPathSegment(
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
