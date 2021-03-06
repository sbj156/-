// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBidDocController;
import com.lmd.ggzy.domain.GgzyBidDoc;
import com.lmd.ggzy.service.GgzyApplyTenderService;
import com.lmd.ggzy.service.GgzyBidDocService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GgzyBidDocController_Roo_Controller {
    
    @Autowired
    GgzyBidDocService GgzyBidDocController.ggzyBidDocService;
    
    @Autowired
    GgzyApplyTenderService GgzyBidDocController.ggzyApplyTenderService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyBidDocController.create(@Valid GgzyBidDoc ggzyBidDoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBidDoc);
            return "ggzybiddocs/create";
        }
        uiModel.asMap().clear();
        ggzyBidDocService.saveGgzyBidDoc(ggzyBidDoc);
        return "redirect:/ggzybiddocs/" + encodeUrlPathSegment(ggzyBidDoc.getBidDocId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBidDocController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBidDoc());
        return "ggzybiddocs/create";
    }
    
    @RequestMapping(value = "/{bidDocId}", produces = "text/html")
    public String GgzyBidDocController.show(@PathVariable("bidDocId") String bidDocId, Model uiModel) {
        uiModel.addAttribute("ggzybiddoc", ggzyBidDocService.findGgzyBidDoc(bidDocId));
        uiModel.addAttribute("itemId", bidDocId);
        return "ggzybiddocs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBidDocController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzybiddocs", ggzyBidDocService.findGgzyBidDocEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyBidDocService.countAllGgzyBidDocs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzybiddocs", ggzyBidDocService.findAllGgzyBidDocs());
        }
        return "ggzybiddocs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyBidDocController.update(@Valid GgzyBidDoc ggzyBidDoc, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBidDoc);
            return "ggzybiddocs/update";
        }
        uiModel.asMap().clear();
        ggzyBidDocService.updateGgzyBidDoc(ggzyBidDoc);
        return "redirect:/ggzybiddocs/" + encodeUrlPathSegment(ggzyBidDoc.getBidDocId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{bidDocId}", params = "form", produces = "text/html")
    public String GgzyBidDocController.updateForm(@PathVariable("bidDocId") String bidDocId, Model uiModel) {
        populateEditForm(uiModel, ggzyBidDocService.findGgzyBidDoc(bidDocId));
        return "ggzybiddocs/update";
    }
    
    @RequestMapping(value = "/{bidDocId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBidDocController.delete(@PathVariable("bidDocId") String bidDocId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBidDoc ggzyBidDoc = ggzyBidDocService.findGgzyBidDoc(bidDocId);
        ggzyBidDocService.deleteGgzyBidDoc(ggzyBidDoc);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybiddocs";
    }
    
    void GgzyBidDocController.populateEditForm(Model uiModel, GgzyBidDoc ggzyBidDoc) {
        uiModel.addAttribute("ggzyBidDoc", ggzyBidDoc);
        uiModel.addAttribute("ggzyapplytenders", ggzyApplyTenderService.findAllGgzyApplyTenders());
    }
    
    String GgzyBidDocController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
