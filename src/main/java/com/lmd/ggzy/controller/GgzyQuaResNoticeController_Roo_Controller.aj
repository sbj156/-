// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyQuaResNoticeController;
import com.lmd.ggzy.domain.GgzyQuaResNotice;
import com.lmd.ggzy.service.GgzyProQuaApplyDocService;
import com.lmd.ggzy.service.GgzyQuaResNoticeService;
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

privileged aspect GgzyQuaResNoticeController_Roo_Controller {
    
    @Autowired
    GgzyQuaResNoticeService GgzyQuaResNoticeController.ggzyQuaResNoticeService;
    
    @Autowired
    GgzyProQuaApplyDocService GgzyQuaResNoticeController.ggzyProQuaApplyDocService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyQuaResNoticeController.create(@Valid GgzyQuaResNotice ggzyQuaResNotice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyQuaResNotice);
            return "ggzyquaresnotices/create";
        }
        uiModel.asMap().clear();
        ggzyQuaResNoticeService.saveGgzyQuaResNotice(ggzyQuaResNotice);
        return "redirect:/ggzyquaresnotices/" + encodeUrlPathSegment(ggzyQuaResNotice.getQuaResNoticeId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyQuaResNoticeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyQuaResNotice());
        return "ggzyquaresnotices/create";
    }
    
    @RequestMapping(value = "/{quaResNoticeId}", produces = "text/html")
    public String GgzyQuaResNoticeController.show(@PathVariable("quaResNoticeId") String quaResNoticeId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzyquaresnotice", ggzyQuaResNoticeService.findGgzyQuaResNotice(quaResNoticeId));
        uiModel.addAttribute("itemId", quaResNoticeId);
        return "ggzyquaresnotices/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyQuaResNoticeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzyquaresnotices", ggzyQuaResNoticeService.findGgzyQuaResNoticeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyQuaResNoticeService.countAllGgzyQuaResNotices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzyquaresnotices", ggzyQuaResNoticeService.findAllGgzyQuaResNotices());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ggzyquaresnotices/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyQuaResNoticeController.update(@Valid GgzyQuaResNotice ggzyQuaResNotice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyQuaResNotice);
            return "ggzyquaresnotices/update";
        }
        uiModel.asMap().clear();
        ggzyQuaResNoticeService.updateGgzyQuaResNotice(ggzyQuaResNotice);
        return "redirect:/ggzyquaresnotices/" + encodeUrlPathSegment(ggzyQuaResNotice.getQuaResNoticeId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{quaResNoticeId}", params = "form", produces = "text/html")
    public String GgzyQuaResNoticeController.updateForm(@PathVariable("quaResNoticeId") String quaResNoticeId, Model uiModel) {
        populateEditForm(uiModel, ggzyQuaResNoticeService.findGgzyQuaResNotice(quaResNoticeId));
        return "ggzyquaresnotices/update";
    }
    
    @RequestMapping(value = "/{quaResNoticeId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyQuaResNoticeController.delete(@PathVariable("quaResNoticeId") String quaResNoticeId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyQuaResNotice ggzyQuaResNotice = ggzyQuaResNoticeService.findGgzyQuaResNotice(quaResNoticeId);
        ggzyQuaResNoticeService.deleteGgzyQuaResNotice(ggzyQuaResNotice);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzyquaresnotices";
    }
    
    void GgzyQuaResNoticeController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ggzyQuaResNotice_invitetime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void GgzyQuaResNoticeController.populateEditForm(Model uiModel, GgzyQuaResNotice ggzyQuaResNotice) {
        uiModel.addAttribute("ggzyQuaResNotice", ggzyQuaResNotice);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzyproquaapplydocs", ggzyProQuaApplyDocService.findAllGgzyProQuaApplyDocs());
    }
    
    String GgzyQuaResNoticeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
