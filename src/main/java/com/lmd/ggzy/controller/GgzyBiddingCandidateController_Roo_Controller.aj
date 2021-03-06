// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

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
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyBiddingCandidate;
import com.lmd.ggzy.domain.GgzyEvaluationReport;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.domain.pk.GgzyRefTenderApplyPk;
import com.lmd.ggzy.service.GgzyApplyTenderService;
import com.lmd.ggzy.service.GgzyBidPublicityService;
import com.lmd.ggzy.service.GgzyBiddingCandidateService;
import com.lmd.ggzy.service.GgzyEvaluationReportService;

privileged aspect GgzyBiddingCandidateController_Roo_Controller {
    
    @Autowired
    GgzyBiddingCandidateService GgzyBiddingCandidateController.ggzyBiddingCandidateService;
    
    @Autowired
    GgzyApplyTenderService GgzyBiddingCandidateController.ggzyApplyTenderService;
    
    @Autowired
    GgzyBidPublicityService GgzyBiddingCandidateController.ggzyBidPublicityService;
    
    @Autowired
    GgzyEvaluationReportService GgzyBiddingCandidateController.ggzyEvaluationReportService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyBiddingCandidateController.create(@Valid GgzyBiddingCandidate ggzyBiddingCandidate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBiddingCandidate);
            return "ggzybiddingcandidates/create";
        }
        uiModel.asMap().clear();
        ggzyBiddingCandidateService.saveGgzyBiddingCandidate(ggzyBiddingCandidate);
        return "redirect:/ggzybiddingcandidates/" + encodeUrlPathSegment(ggzyBiddingCandidate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBiddingCandidateController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBiddingCandidate());
        return "ggzybiddingcandidates/create";
    }
    
    @RequestMapping(value = "/{biddingCandidateId}", produces = "text/html")
    public String GgzyBiddingCandidateController.show(@PathVariable("biddingCandidateId") GgzyRefTenderApplyPk biddingCandidateId, Model uiModel) {
        uiModel.addAttribute("ggzybiddingcandidate", ggzyBiddingCandidateService.findGgzyBiddingCandidate(biddingCandidateId));
        uiModel.addAttribute("itemId", biddingCandidateId);
        return "ggzybiddingcandidates/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBiddingCandidateController.list(ServletRequest request, Page page, Model uiModel) {
    	Specification<GgzyBiddingCandidate> specifition = DynamicSpecifications.bySearchFilter(request, GgzyBiddingCandidate.class);
    	List<GgzyBiddingCandidate> list = ggzyBiddingCandidateService.findByExample(specifition, page); 
        uiModel.addAttribute("list", list);
        uiModel.addAttribute("page", page);
        return "ggzybiddingcandidates/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyBiddingCandidateController.update(@Valid GgzyBiddingCandidate ggzyBiddingCandidate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBiddingCandidate);
            return "ggzybiddingcandidates/update";
        }
        uiModel.asMap().clear();
        ggzyBiddingCandidateService.updateGgzyBiddingCandidate(ggzyBiddingCandidate);
        return "redirect:/ggzybiddingcandidates/" + encodeUrlPathSegment(ggzyBiddingCandidate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{biddingCandidateId}", params = "form", produces = "text/html")
    public String GgzyBiddingCandidateController.updateForm(@PathVariable("biddingCandidateId") GgzyRefTenderApplyPk biddingCandidateId, Model uiModel) {
        populateEditForm(uiModel, ggzyBiddingCandidateService.findGgzyBiddingCandidate(biddingCandidateId));
        return "ggzybiddingcandidates/update";
    }
    
    @RequestMapping(value = "/{biddingCandidateId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBiddingCandidateController.delete(@PathVariable("biddingCandidateId") GgzyRefTenderApplyPk biddingCandidateId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBiddingCandidate ggzyBiddingCandidate = ggzyBiddingCandidateService.findGgzyBiddingCandidate(biddingCandidateId);
        ggzyBiddingCandidateService.deleteGgzyBiddingCandidate(ggzyBiddingCandidate);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybiddingcandidates";
    }
    
    @RequestMapping(value = "/confirm")
    public String GgzyBiddingCandidateController.confirmCadidate(@RequestParam("ids") String[] ids,GgzyEvaluationReport eval,  @RequestParam("noticeTendersId") GgzyNoticeTendersPk noticeTendersId, Model uiModel){
    	if(null!=eval && null != eval.getId() ){
    		ggzyEvaluationReportService.saveGgzyEvaluationReport(eval);
		}
    	
    	for(String id : ids){
    		GgzyBiddingCandidate cadidate = new GgzyBiddingCandidate();
    		cadidate.setId(new GgzyRefTenderApplyPk(noticeTendersId.getTendersId(), id, noticeTendersId.getNoticeId()));
    		ggzyBiddingCandidateService.saveGgzyBiddingCandidate(cadidate);
    	}
    	AjaxObject status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
    	uiModel.addAttribute(ControllerConst.STATUS, status);
    	return ControllerConst.JSON_STATUS_VIEW;
    }
    
    void GgzyBiddingCandidateController.populateEditForm(Model uiModel, GgzyBiddingCandidate ggzyBiddingCandidate) {
        uiModel.addAttribute("ggzyBiddingCandidate", ggzyBiddingCandidate);
        uiModel.addAttribute("ggzyapplytenders", ggzyApplyTenderService.findAllGgzyApplyTenders());
        uiModel.addAttribute("ggzybidpublicitys", ggzyBidPublicityService.findAllGgzyBidPublicitys());
    }
    
    String GgzyBiddingCandidateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
