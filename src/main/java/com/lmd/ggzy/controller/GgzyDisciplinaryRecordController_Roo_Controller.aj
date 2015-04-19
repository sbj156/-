package com.lmd.ggzy.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.lmd.ggzy.domain.GgzyApply;
import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;
import com.lmd.ggzy.service.GgzyDisciplinaryRecordService;
import com.lmd.ggzy.service.GgzyBidProService;
import com.lmd.ggzy.service.GgzyBiddingSubjectService;

privileged aspect GgzyDisciplinaryRecordController_Roo_Controller {
	@Autowired
    GgzyDisciplinaryRecordService GgzyDisciplinaryRecordController.ggzyDisciplinaryRecordService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public @ResponseBody String GgzyDisciplinaryRecordController.create(@Valid GgzyDisciplinaryRecord ggzyDisciplinaryRecord, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyDisciplinaryRecord);
            return "GgzyDisciplinaryRecords/create";
        }
        
        uiModel.asMap().clear();
        ggzyDisciplinaryRecordService.saveGgzyDisciplinaryRecord(ggzyDisciplinaryRecord);
//        return "redirect:/GgzyDisciplinaryRecords/" + encodeUrlPathSegment(GgzyDisciplinaryRecord.getApplyId().toString(), httpServletRequest);
        return AjaxObject.newOk("success").toString();
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyDisciplinaryRecordController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyDisciplinaryRecord());
        return "GgzyDisciplinaryRecords/create";
    }
    
    @RequestMapping(value = "/{applyId}", produces = "text/html")
    public String GgzyDisciplinaryRecordController.show(@PathVariable("applyId") String applyId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("GgzyDisciplinaryRecord", ggzyDisciplinaryRecordService.findGgzyDisciplinaryRecord(applyId));
        uiModel.addAttribute("itemId", applyId);
        return "GgzyDisciplinaryRecords/show";
    }
    
    @RequestMapping()
    public String GgzyDisciplinaryRecordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("GgzyDisciplinaryRecords", ggzyDisciplinaryRecordService.findGgzyDisciplinaryRecordEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyDisciplinaryRecordService.countAllGgzyDisciplinaryRecords() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("GgzyDisciplinaryRecords", ggzyDisciplinaryRecordService.findAllGgzyDisciplinaryRecords());
        }
        addDateTimeFormatPatterns(uiModel);
        return "GgzyDisciplinaryRecords/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyDisciplinaryRecordController.update(@Valid GgzyDisciplinaryRecord ggzyDisciplinaryRecord, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyDisciplinaryRecord);
            return "GgzyDisciplinaryRecords/update";
        }
        uiModel.asMap().clear();
        ggzyDisciplinaryRecordService.updateGgzyDisciplinaryRecord(ggzyDisciplinaryRecord);
        return "redirect:/GgzyDisciplinaryRecords/" + encodeUrlPathSegment(ggzyDisciplinaryRecord.getdisciplinaryId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{applyId}", params = "form", produces = "text/html")
    public String GgzyDisciplinaryRecordController.updateForm(@PathVariable("applyId") String applyId, Model uiModel) {
        populateEditForm(uiModel, ggzyDisciplinaryRecordService.findGgzyDisciplinaryRecord(applyId));
        return "GgzyDisciplinaryRecords/update";
    }
    

	@RequestMapping(value = "/{applyId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyDisciplinaryRecordController.delete(@PathVariable("applyId") String applyId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyDisciplinaryRecord GgzyDisciplinaryRecord = ggzyDisciplinaryRecordService.findGgzyDisciplinaryRecord(applyId);
        ggzyDisciplinaryRecordService.deleteGgzyDisciplinaryRecord(GgzyDisciplinaryRecord);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/GgzyDisciplinaryRecords";
    }
    
    void GgzyDisciplinaryRecordController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("GgzyDisciplinaryRecord_applytime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("GgzyDisciplinaryRecord_signtime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    void GgzyDisciplinaryRecordController.populateEditForm(Model uiModel, GgzyDisciplinaryRecord ggzyDisciplinaryRecord) {
        uiModel.addAttribute("ggzyDisciplinaryRecord", ggzyDisciplinaryRecord);
        addDateTimeFormatPatterns(uiModel);
//        uiModel.addAttribute("ggzyapplytenders", ggzyApplyTenderService.findAllGgzyApplyTenders());
//        uiModel.addAttribute("ggzybidproes", ggzyBidProService.findAllGgzyBidProes());
//        uiModel.addAttribute("ggzybiddingsubjects", ggzyBiddingSubjectService.findAllGgzyBiddingSubjects());
    }
   
    
    String GgzyDisciplinaryRecordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
