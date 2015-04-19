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
import org.springframework.util.StringUtils;
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
import com.lmd.ggzy.domain.GgzyBidPro;
import com.lmd.ggzy.service.GgzyApplyService;
import com.lmd.ggzy.service.GgzyBaseProService;
import com.lmd.ggzy.service.GgzyBidProService;
import com.lmd.ggzy.service.GgzyNoticeService;
import com.lmd.ggzy.service.GgzyTendersService;

privileged aspect GgzyBidProController_Roo_Controller {
    
    @Autowired
    GgzyBidProService GgzyBidProController.ggzyBidProService;
    
    @Autowired
    GgzyApplyService GgzyBidProController.ggzyApplyService;
    
    @Autowired
    GgzyBaseProService GgzyBidProController.ggzyBaseProService;
    
    @Autowired
    GgzyNoticeService GgzyBidProController.ggzyNoticeService;
    
    @Autowired
    GgzyTendersService GgzyBidProController.ggzyTendersService;
    
    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody String GgzyBidProController.create(@Valid GgzyBidPro ggzyBidPro, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBidPro);
            return "ggzybidproes/create";
        }
        uiModel.asMap().clear();
        ggzyBidProService.saveGgzyBidPro(ggzyBidPro);
        return AjaxObject.newOk("登记成功,项目编号为" + ggzyBidPro.getProCode()).toString();
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBidProController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBidPro());
        return "ggzybidproes/create";
    }
    
    @RequestMapping(value = "/{bidProId}", produces = "text/html")
    public String GgzyBidProController.show(@PathVariable("bidProId") String bidProId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzyBidPro", ggzyBidProService.findGgzyBidPro(bidProId));
        uiModel.addAttribute("itemId", bidProId);
        return "ggzybidproes/show";
    }
    
    @RequestMapping(produces = "text/html", method = RequestMethod.GET)
    public String GgzyBidProController.list(ServletRequest request, Page page, Model map) {
    	addDateTimeFormatPatterns(map);
    	Specification<GgzyBidPro> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyBidPro.class);
		map.addAttribute("page", page);
		List<GgzyBidPro> list = ggzyBidProService.findByExample(
				specification, page);
		map.addAttribute("list", list);
        return "ggzybidproes/list";
    }
    
    @RequestMapping(value="/update")
    public @ResponseBody String GgzyBidProController.update(@Valid GgzyBidPro ggzyBidPro, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBidPro);
            return "ggzybidproes/update";
        }
        uiModel.asMap().clear();
        ggzyBidProService.updateGgzyBidPro(ggzyBidPro);
        return AjaxObject.newOk("修改成功！").toString();
    }
    
    @RequestMapping(value = "/{bidProId}", params = "form", produces = "text/html")
    public String GgzyBidProController.updateForm(@PathVariable("bidProId") String bidProId, Model uiModel) {
        populateEditForm(uiModel, ggzyBidProService.findGgzyBidPro(bidProId));
        return "ggzybidproes/update";
    }
    
    @RequestMapping(value = "/{bidProId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBidProController.delete(@PathVariable("bidProId") String bidProId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBidPro ggzyBidPro = ggzyBidProService.findGgzyBidPro(bidProId);
        ggzyBidProService.deleteGgzyBidPro(ggzyBidPro);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybidproes";
    }
    
    void GgzyBidProController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ggzyBidPro_createtime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void GgzyBidProController.populateEditForm(Model uiModel, GgzyBidPro ggzyBidPro) {
        uiModel.addAttribute("ggzyBidPro", ggzyBidPro);
        addDateTimeFormatPatterns(uiModel);
       /* uiModel.addAttribute("ggzyapplys", ggzyApplyService.findAllGgzyApplys());
        uiModel.addAttribute("ggzybaseproes", ggzyBaseProService.findAllGgzyBaseProes());
        uiModel.addAttribute("ggzynotices", ggzyNoticeService.findAllGgzyNotices());
        uiModel.addAttribute("ggzytenderses", ggzyTendersService.findAllGgzyTenderses());*/
    }
    
    String GgzyBidProController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
    @RequestMapping(value = "/delete", method=RequestMethod.POST)
	public @ResponseBody String GgzyBidProController.deleteManey(@RequestParam("ids") String[] ids) {
    	for(String id : ids){
    		GgzyBidPro entity = ggzyBidProService.findGgzyBidPro(id);
    		ggzyBidProService.deleteGgzyBidPro(entity);
    	}
    	return AjaxObject.newOk("删除成功！").setCallbackType("").toString();
    }
    @RequestMapping(value = "/status", method=RequestMethod.POST)
	public @ResponseBody String GgzyBidProController.statusManey(@RequestParam("ids") String[] ids, @RequestParam("status") String status) {
    	for(String id : ids){
    		GgzyBidPro entity = ggzyBidProService.findGgzyBidPro(id);
    		entity.setStatus(status);
    		ggzyBidProService.saveGgzyBidPro(entity);
    	}
    	return AjaxObject.newOk("保存成功！").setCallbackType("").toString();
    }
    
}
