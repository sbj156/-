// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.lmd.ggzy.controller.GgzyEvaluationReportController;
import com.lmd.ggzy.domain.GgzyEvaluationReport;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.service.GgzyEvaluationReportService;
import com.lmd.ggzy.service.GgzyTendersService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GgzyEvaluationReportController_Roo_Controller {
    
    @Autowired
    GgzyEvaluationReportService GgzyEvaluationReportController.ggzyEvaluationReportService;
    
    @Autowired
    GgzyTendersService GgzyEvaluationReportController.ggzyTendersService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyEvaluationReportController.create(@Valid GgzyEvaluationReport ggzyEvaluationReport, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	AjaxObject status = null;
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyEvaluationReport);
            status = AjaxObject.newForbidden(bindingResult.getFieldError().getDefaultMessage());
        }else{
        	uiModel.asMap().clear();
        	ggzyEvaluationReportService.saveGgzyEvaluationReport(ggzyEvaluationReport);
        	status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
        }
        uiModel.addAttribute(ControllerConst.STATUS, status);
        return ControllerConst.JSON_STATUS_VIEW;
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyEvaluationReportController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyEvaluationReport());
        return "ggzyevaluationreports/create";
    }
    
    @RequestMapping(value = "/{evaluationReportId}", produces = "text/html")
    public String GgzyEvaluationReportController.show(@PathVariable("evaluationReportId") GgzyNoticeTendersPk evaluationReportId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzyevaluationreport", ggzyEvaluationReportService.findGgzyEvaluationReport(evaluationReportId));
        uiModel.addAttribute("itemId", evaluationReportId);
        return "ggzyevaluationreports/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyEvaluationReportController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzyevaluationreports", ggzyEvaluationReportService.findGgzyEvaluationReportEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyEvaluationReportService.countAllGgzyEvaluationReports() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzyevaluationreports", ggzyEvaluationReportService.findAllGgzyEvaluationReports());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ggzyevaluationreports/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyEvaluationReportController.update(@Valid GgzyEvaluationReport ggzyEvaluationReport, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyEvaluationReport);
            return "ggzyevaluationreports/update";
        }
        uiModel.asMap().clear();
        ggzyEvaluationReportService.updateGgzyEvaluationReport(ggzyEvaluationReport);
        return "redirect:/ggzyevaluationreports/" + encodeUrlPathSegment(ggzyEvaluationReport.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{evaluationReportId}", params = "form", produces = "text/html")
    public String GgzyEvaluationReportController.updateForm(@PathVariable("evaluationReportId") GgzyNoticeTendersPk evaluationReportId, Model uiModel) {
        populateEditForm(uiModel, ggzyEvaluationReportService.findGgzyEvaluationReport(evaluationReportId));
        return "ggzyevaluationreports/update";
    }
    
    @RequestMapping(value = "/{evaluationReportId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyEvaluationReportController.delete(@PathVariable("evaluationReportId") GgzyNoticeTendersPk evaluationReportId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyEvaluationReport ggzyEvaluationReport = ggzyEvaluationReportService.findGgzyEvaluationReport(evaluationReportId);
        ggzyEvaluationReportService.deleteGgzyEvaluationReport(ggzyEvaluationReport);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzyevaluationreports";
    }
    
    void GgzyEvaluationReportController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ggzyEvaluationReport_subtime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void GgzyEvaluationReportController.populateEditForm(Model uiModel, GgzyEvaluationReport ggzyEvaluationReport) {
        uiModel.addAttribute("ggzyEvaluationReport", ggzyEvaluationReport);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzytenderses", ggzyTendersService.findAllGgzyTenderses());
    }
    
    String GgzyEvaluationReportController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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