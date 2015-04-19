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
import com.lmd.ggzy.domain.GgzyLiteracyPerformance;
import com.lmd.ggzy.service.GgzyLiteracyPerformanceService;
import com.lmd.ggzy.service.GgzyLiteracyService;

public  aspect GgzyLiteracyPerformanceController_Roo_Contorller {
	
	@Autowired
	GgzyLiteracyPerformanceService GgzyLiteracyPerformanceController.ggzyLiteracyPerformanceService;
	
	@Autowired
	GgzyLiteracyService GgzyLiteracyPerformanceController.ggzyLiteracyService; 

	@RequestMapping(method = RequestMethod.POST, produces = "text/html") 
	public @ResponseBody
	String GgzyLiteracyPerformanceController.create(
			@Valid GgzyLiteracyPerformance ggzyLiteracyPerformance,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {


		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracyPerformance);
			return "ggzyliteracyperformances/create";
		}
		

		ggzyLiteracyPerformanceService.saveGgzyLiteracyPerformance(ggzyLiteracyPerformance);
		return new AjaxObject("添加成功").toString();
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyLiteracyPerformanceController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyLiteracyPerformance());
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		
		return "ggzyliteracyperformances/create";
	}

	@RequestMapping(value = "/{performanceId}", produces = "text/html")
	public String GgzyLiteracyPerformanceController.show(
			@PathVariable("performanceId") String performanceId, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyliteracyperformance", ggzyLiteracyPerformanceService
				.findGgzyLiteracyPerformance(performanceId));
		uiModel.addAttribute("itemId", performanceId);
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		return "ggzyliteracyperformances/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyLiteracyPerformanceController.list(ServletRequest request,
			Model map, Page page) {
		addDateTimeFormatPatterns(map);
		Specification<GgzyLiteracyPerformance> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyLiteracyPerformance.class);
		map.addAttribute("page", page);
		List<GgzyLiteracyPerformance> list = ggzyLiteracyPerformanceService
				.findByExample(specification, page);

		map.addAttribute("list", list);
		return "ggzyliteracyperformances/list";
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyPerformanceController.update(
			@Valid GgzyLiteracyPerformance ggzyLiteracyPerformance,
			BindingResult bindingResult, Model uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyLiteracyPerformance);
			System.out.println("有问题");
			return "ggzyliteracyperformances/update";
		}
		System.out.println("ok");
		System.out.println(ggzyLiteracyPerformance.getGgzyLiteracy().getLiteracyId());
		uiModel.asMap().clear();
		ggzyLiteracyPerformanceService
				.updateGgzyLiteracyPerformance(ggzyLiteracyPerformance);
		return new AjaxObject().newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{performanceId}", params = "form", produces = "text/html")
	public String GgzyLiteracyPerformanceController.updateForm(
			@PathVariable("performanceId") String performanceId, Model uiModel) {
		populateEditForm(uiModel,
				ggzyLiteracyPerformanceService
						.findGgzyLiteracyPerformance(performanceId));
		List<GgzyLiteracy> list = ggzyLiteracyService.findAllGgzyLiteracies();
		uiModel.addAttribute("list", list);
		return "ggzyliteracyperformances/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyLiteracyPerformanceController.delete(
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size,
			@RequestParam("ids") String[] ids,Model uiModel) {
		for(String id:ids) {
			GgzyLiteracyPerformance ggzyLiteracyPerformance = ggzyLiteracyPerformanceService
					.findGgzyLiteracyPerformance(id);
			ggzyLiteracyPerformanceService
					.deleteGgzyLiteracyPerformance(ggzyLiteracyPerformance);
		}
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString();
	}

	void GgzyLiteracyPerformanceController.addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute(
				"ggzyLiteracys_birthday",
				DateTimeFormat.patternForStyle("MM",
						LocaleContextHolder.getLocale()));
	}

	void GgzyLiteracyPerformanceController.populateEditForm(Model uiModel,
			GgzyLiteracyPerformance ggzyLiteracyPerformance) {
		uiModel.addAttribute("ggzyliteracyperformance", ggzyLiteracyPerformance);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("ggzyliteracy", ggzyLiteracyService.findAllGgzyLiteracies()); 
	}

	String GgzyLiteracyPerformanceController.encodeUrlPathSegment(
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
