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
import com.lmd.ggzy.service.GgzyLiteracyService;
import com.lmd.ggzy.controller.GgzyLiteracyController;

public aspect GgzyLiteracyController_Roo_Controller {

	@Autowired
	GgzyLiteracyService GgzyLiteracyController.ggzyLiteracyService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyController.create(
			@Valid GgzyLiteracy ggzyLiteracy,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracy);
			return "ggzyliteracys/create";
		}
		uiModel.asMap().clear();
//		System.out.println(ggzyprofessionalsinformation.getLiteracyDuties());
		ggzyLiteracyService.saveGgzyLiteracy(ggzyLiteracy);
		return new AjaxObject("添加成功").toString();
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyLiteracyController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyLiteracy());
		return "ggzyliteracys/create";
	}

	@RequestMapping(value = "/{literacyId}", produces = "text/html")
	public String GgzyLiteracyController.show(
			@PathVariable("literacyId") String literacyId, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyliteracy", ggzyLiteracyService
				.findGgzyLiteracy(literacyId));
		uiModel.addAttribute("itemId", literacyId);
		return "ggzyliteracys/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyLiteracyController.list(ServletRequest request,
			Model map, Page page) {
		addDateTimeFormatPatterns(map);
		Specification<GgzyLiteracy> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyLiteracy.class);
		map.addAttribute("page", page);
		List<GgzyLiteracy> list = ggzyLiteracyService
				.findByExample(specification, page);

		map.addAttribute("list", list);
		return "ggzyliteracys/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyController.update(
			@Valid GgzyLiteracy ggzyLiteracy,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracy);
			return "ggzyliteracys/update";
		}
		uiModel.asMap().clear();
		ggzyLiteracyService
				.updateGgzyLiteracy(ggzyLiteracy);
		return new AjaxObject().newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{literacyId}", params = "form", produces = "text/html")
	public String GgzyLiteracyController.updateForm(
			@PathVariable("literacyId") String literacyId, Model uiModel) {
		populateEditForm(uiModel,
				ggzyLiteracyService
						.findGgzyLiteracy(literacyId));
		return "ggzyliteracys/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyController.delete(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			@RequestParam("ids") String[] ids,Model uiModel) {
		for(String id:ids) {
			GgzyLiteracy ggzyLiteracy = ggzyLiteracyService
					.findGgzyLiteracy(id);
			ggzyLiteracyService
					.deleteGgzyLiteracy(ggzyLiteracy);
		}
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString();
	}

	void GgzyLiteracyController.addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute(
				"ggzyLiteracys_birthday",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
	}

	void GgzyLiteracyController.populateEditForm(Model uiModel,
			GgzyLiteracy ggzyLiteracy) {
		uiModel.addAttribute("ggzyliteracy", ggzyLiteracy);
		addDateTimeFormatPatterns(uiModel);
		
	}

	String GgzyLiteracyController.encodeUrlPathSegment(
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
