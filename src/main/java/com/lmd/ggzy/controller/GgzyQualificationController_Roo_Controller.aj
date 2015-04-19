// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.controller.GgzyQualificationController;
import com.lmd.ggzy.domain.GgzyQualification;
import com.lmd.ggzy.service.GgzyBiddingSubjectService;
import com.lmd.ggzy.service.GgzyQualificationService;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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

privileged aspect GgzyQualificationController_Roo_Controller {

	@Autowired
	GgzyQualificationService GgzyQualificationController.ggzyQualificationService;

	@Autowired
	GgzyBiddingSubjectService GgzyQualificationController.ggzyBiddingSubjectService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String GgzyQualificationController.create(@Valid GgzyQualification ggzyQualification, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		AjaxObject status;
		if (bindingResult.hasErrors()) {
			status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
		} else {
			uiModel.asMap().clear();
			ggzyQualificationService.saveGgzyQualification(ggzyQualification);
			status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
		}
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String GgzyQualificationController.createForm(Model uiModel) {
		populateEditForm(uiModel, new GgzyQualification());
		return "ggzyqualifications/create";
	}

	@RequestMapping(value = "/{qualificationId}", produces = "text/html")
	public String GgzyQualificationController.show(@PathVariable("qualificationId") String qualificationId, Model uiModel) {
		uiModel.addAttribute("ggzyqualification", ggzyQualificationService.findGgzyQualification(qualificationId));
		uiModel.addAttribute("itemId", qualificationId);
		return "ggzyqualifications/show";
	}

	@RequestMapping(produces = "text/html")
	public String GgzyQualificationController.list(ServletRequest request, Page page, Model map) {
		Specification<GgzyQualification> specification = DynamicSpecifications.bySearchFilter(request, GgzyQualification.class);
		map.addAttribute("page", page);
		List<GgzyQualification> list = ggzyQualificationService.findByExample(specification, page);
		map.addAttribute("list", list);

		return "ggzyqualifications/list";
	}

	@RequestMapping(method = RequestMethod.PUT)
	public @ResponseBody
	String GgzyQualificationController.update(@Valid GgzyQualification ggzyQualification, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, ggzyQualification);
			return "ggzyqualifications/update";
		}
		uiModel.asMap().clear();
		ggzyQualificationService.updateGgzyQualification(ggzyQualification);
		return new AjaxObject().newOk("修改成功").toString();
	}

	@RequestMapping(value = "/{qualificationId}", params = "form", produces = "text/html")
	public String GgzyQualificationController.updateForm(@PathVariable("qualificationId") String qualificationId, Model uiModel) {
		populateEditForm(uiModel, ggzyQualificationService.findGgzyQualification(qualificationId));
		return "ggzyqualifications/update";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html")
	public @ResponseBody
	String GgzyQualificationController.delete(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel, @RequestParam("ids") String[] ids) {
		for (String id : ids) {
			GgzyQualification ggzyQualification = ggzyQualificationService.findGgzyQualification(id);
			ggzyQualificationService.deleteGgzyQualification(ggzyQualification);

		}
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return new AjaxObject("删除成功").setCallbackType("").toString();
	}

	void GgzyQualificationController.populateEditForm(Model uiModel, GgzyQualification ggzyQualification) {
		uiModel.addAttribute("ggzyqualification", ggzyQualification);
		uiModel.addAttribute("ggzybiddingsubjects", ggzyBiddingSubjectService.findAllGgzyBiddingSubjects());
	}

	String GgzyQualificationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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