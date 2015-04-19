// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBusinessTypeOpenningTypeController;
import com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType;
import com.lmd.ggzy.domain.pk.GgzyBusinessOpenTypePk;
import com.lmd.ggzy.service.BidOpenningTypeService;
import com.lmd.ggzy.service.GgzyBusinessTypeOpenningTypeService;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GgzyBusinessTypeOpenningTypeController_Roo_Controller {
    
    private ConversionService GgzyBusinessTypeOpenningTypeController.conversionService;
    
    @Autowired
    GgzyBusinessTypeOpenningTypeService GgzyBusinessTypeOpenningTypeController.ggzyBusinessTypeOpenningTypeService;
    
    @Autowired
    BidOpenningTypeService GgzyBusinessTypeOpenningTypeController.bidOpenningTypeService;
    
    @Autowired
    GgzyBusinessTypeService GgzyBusinessTypeOpenningTypeController.ggzyBusinessTypeService;
    
    @Autowired
    public GgzyBusinessTypeOpenningTypeController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.create(@Valid GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBusinessTypeOpenningType);
            return "ggzybusinesstypeopenningtypes/create";
        }
        uiModel.asMap().clear();
        ggzyBusinessTypeOpenningTypeService.saveGgzyBusinessTypeOpenningType(ggzyBusinessTypeOpenningType);
        return "redirect:/ggzybusinesstypeopenningtypes/" + encodeUrlPathSegment(conversionService.convert(ggzyBusinessTypeOpenningType.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBusinessTypeOpenningType());
        return "ggzybusinesstypeopenningtypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.show(@PathVariable("id") GgzyBusinessOpenTypePk id, Model uiModel) {
        uiModel.addAttribute("ggzybusinesstypeopenningtype", ggzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningType(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "ggzybusinesstypeopenningtypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzybusinesstypeopenningtypes", ggzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyBusinessTypeOpenningTypeService.countAllGgzyBusinessTypeOpenningTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzybusinesstypeopenningtypes", ggzyBusinessTypeOpenningTypeService.findAllGgzyBusinessTypeOpenningTypes());
        }
        return "ggzybusinesstypeopenningtypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.update(@Valid GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBusinessTypeOpenningType);
            return "ggzybusinesstypeopenningtypes/update";
        }
        uiModel.asMap().clear();
        ggzyBusinessTypeOpenningTypeService.updateGgzyBusinessTypeOpenningType(ggzyBusinessTypeOpenningType);
        return "redirect:/ggzybusinesstypeopenningtypes/" + encodeUrlPathSegment(conversionService.convert(ggzyBusinessTypeOpenningType.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.updateForm(@PathVariable("id") GgzyBusinessOpenTypePk id, Model uiModel) {
        populateEditForm(uiModel, ggzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningType(id));
        return "ggzybusinesstypeopenningtypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBusinessTypeOpenningTypeController.delete(@PathVariable("id") GgzyBusinessOpenTypePk id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType = ggzyBusinessTypeOpenningTypeService.findGgzyBusinessTypeOpenningType(id);
        ggzyBusinessTypeOpenningTypeService.deleteGgzyBusinessTypeOpenningType(ggzyBusinessTypeOpenningType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybusinesstypeopenningtypes";
    }
    
    void GgzyBusinessTypeOpenningTypeController.populateEditForm(Model uiModel, GgzyBusinessTypeOpenningType ggzyBusinessTypeOpenningType) {
        uiModel.addAttribute("ggzyBusinessTypeOpenningType", ggzyBusinessTypeOpenningType);
        uiModel.addAttribute("bidopenningtypes", bidOpenningTypeService.findAllBidOpenningTypes());
        uiModel.addAttribute("ggzybusinesstypes", ggzyBusinessTypeService.findAllGgzyBusinessTypes());
    }
    
    String GgzyBusinessTypeOpenningTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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