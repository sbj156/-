// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

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
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyExceptionalCase;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.service.GgzyExceptionalCaseService;
import com.lmd.ggzy.service.GgzyNoticeTendersService;
import com.lmd.ggzy.service.GgzyTendersService;

privileged aspect GgzyExceptionalCaseController_Roo_Controller {
     
    @Autowired
    GgzyExceptionalCaseService GgzyExceptionalCaseController.ggzyExceptionalCaseService;
    
    @Autowired
    GgzyTendersService GgzyExceptionalCaseController.ggzyTendersService;
    
    @Autowired
    GgzyNoticeTendersService GgzyExceptionalCaseController.noticeTendersService;
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyExceptionalCaseController.create(@Valid GgzyExceptionalCase ggzyExceptionalCase, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	System.out.println(ggzyExceptionalCase.getStep());
    	AjaxObject status;
        if (bindingResult.hasErrors()) {
            status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
        }else{
        	uiModel.asMap().clear();
        	ggzyExceptionalCaseService.saveGgzyExceptionalCase(ggzyExceptionalCase);
        	status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
        }
        uiModel.addAttribute(ControllerConst.STATUS, status);
        return ControllerConst.JSON_STATUS_VIEW;
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyExceptionalCaseController.createForm(Model uiModel, @RequestParam("tendersId") GgzyNoticeTendersPk tendersId) {
    	uiModel.addAttribute("noticeTenders", noticeTendersService.findGgzyNoticeTenders(tendersId));
        populateEditForm(uiModel, new GgzyExceptionalCase());
        return "ggzyexceptionalcases/create";
    }
    
    @RequestMapping(value = "/{exceptionalCaseId}", produces = "text/html")
    public String GgzyExceptionalCaseController.show(@PathVariable("exceptionalCaseId") GgzyNoticeTendersPk exceptionalCaseId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("exceptionalCase", ggzyExceptionalCaseService.findGgzyExceptionalCase(exceptionalCaseId));
        return "ggzyexceptionalcases/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyExceptionalCaseController.list(ServletRequest request, Page page, Model uiModel) {
        Specification<GgzyExceptionalCase> specification = DynamicSpecifications.bySearchFilter(request, GgzyExceptionalCase.class);
        List<GgzyExceptionalCase> list = ggzyExceptionalCaseService.findByExample(specification, page);
        uiModel.addAttribute("list", list);
        return "ggzyexceptionalcases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyExceptionalCaseController.update(@Valid GgzyExceptionalCase ggzyExceptionalCase, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	AjaxObject status;
        if (bindingResult.hasErrors()) {
            status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
        }else{
        	uiModel.asMap().clear();
        	ggzyExceptionalCaseService.updateGgzyExceptionalCase(ggzyExceptionalCase);
        	status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
        }
        uiModel.addAttribute(ControllerConst.STATUS, status);
        return ControllerConst.JSON_STATUS_VIEW;
    }
    
    @RequestMapping(value = "/{exceptionalCaseId}", params = "form", produces = "text/html")
    public String GgzyExceptionalCaseController.updateForm(@PathVariable("exceptionalCaseId") GgzyNoticeTendersPk exceptionalCaseId, Model uiModel) {
        populateEditForm(uiModel, ggzyExceptionalCaseService.findGgzyExceptionalCase(exceptionalCaseId));
        return "ggzyexceptionalcases/update";
    }
    
    @RequestMapping(value = "/{exceptionalCaseId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyExceptionalCaseController.delete(@PathVariable("exceptionalCaseId") GgzyNoticeTendersPk exceptionalCaseId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyExceptionalCase ggzyExceptionalCase = ggzyExceptionalCaseService.findGgzyExceptionalCase(exceptionalCaseId);
        ggzyExceptionalCaseService.deleteGgzyExceptionalCase(ggzyExceptionalCase);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzyexceptionalcases";
    }
    
    void GgzyExceptionalCaseController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ggzyExceptionalCase_subtime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void GgzyExceptionalCaseController.populateEditForm(Model uiModel, GgzyExceptionalCase ggzyExceptionalCase) {
        uiModel.addAttribute("exceptionalCase", ggzyExceptionalCase);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String GgzyExceptionalCaseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}