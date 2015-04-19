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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyBusinessWay;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyBusinessWayService;

privileged aspect GgzyBusinessWayController_Roo_Controller {
    
    @Autowired
    GgzyBusinessWayService GgzyBusinessWayController.ggzyBusinessWayService;
    
    @Autowired
    GgzyBusinessTypeService GgzyBusinessWayController.ggzyBusinessTypeService;
    
    @RequestMapping(method = RequestMethod.POST,value="/create")
    @ResponseBody
    public String GgzyBusinessWayController.create(@Valid GgzyBusinessWay ggzyBusinessWay, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBusinessWay);
            return "ggzybusinessways/create";
        }
        uiModel.asMap().clear();
        ggzyBusinessWayService.saveGgzyBusinessWay(ggzyBusinessWay);
        return AjaxObject.newOk("添加成功").toString();
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBusinessWayController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBusinessWay());
        return "ggzybusinessways/create";
    }
    
    @RequestMapping(value = "/{businessWayId}", produces = "text/html")
    public String GgzyBusinessWayController.show(@PathVariable("businessWayId") String businessWayId, Model uiModel) {
        uiModel.addAttribute("ggzybusinessway", ggzyBusinessWayService.findGgzyBusinessWay(businessWayId));
        uiModel.addAttribute("itemId", businessWayId);
        return "ggzybusinessways/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBusinessWayController.list(ServletRequest request, Page page, Model map) {
    	Specification<GgzyBusinessWay> specification = DynamicSpecifications
				.bySearchFilter(request, GgzyBusinessWay.class);
		map.addAttribute("page", page);
		List<GgzyBusinessWay> list = ggzyBusinessWayService.findByExample(
				specification, page);
		map.addAttribute("list", list);
        return "ggzybusinessways/list";
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/update")
    public @ResponseBody String GgzyBusinessWayController.update(@Valid GgzyBusinessWay ggzyBusinessWay, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBusinessWay);
            return "ggzybusinessways/update";
        }
        uiModel.asMap().clear();
        ggzyBusinessWayService.updateGgzyBusinessWay(ggzyBusinessWay);
        return AjaxObject.newOk("修改成功").toString();
    }
    
    @RequestMapping(value = "/{businessWayId}", params = "form", produces = "text/html")
    public String GgzyBusinessWayController.updateForm(@PathVariable("businessWayId") String businessWayId, Model uiModel) {
        populateEditForm(uiModel, ggzyBusinessWayService.findGgzyBusinessWay(businessWayId));
        return "ggzybusinessways/update";
    }
    
    @RequestMapping(value = "/{businessWayId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBusinessWayController.delete(@PathVariable("businessWayId") String businessWayId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBusinessWay ggzyBusinessWay = ggzyBusinessWayService.findGgzyBusinessWay(businessWayId);
        ggzyBusinessWayService.deleteGgzyBusinessWay(ggzyBusinessWay);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybusinessways";
    }
    
    void GgzyBusinessWayController.populateEditForm(Model uiModel, GgzyBusinessWay ggzyBusinessWay) {
        uiModel.addAttribute("ggzyBusinessWay", ggzyBusinessWay);
        uiModel.addAttribute("ggzybusinesstypes", ggzyBusinessTypeService.findAllGgzyBusinessTypes());
    }
    
    String GgzyBusinessWayController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
	public @ResponseBody String GgzyBusinessWayController.deleteManey(@RequestParam("ids") String[] ids) {
    	for(String id : ids){
    		GgzyBusinessWay ggzyBusinessWay = ggzyBusinessWayService.findGgzyBusinessWay(id);
    		ggzyBusinessWayService.deleteGgzyBusinessWay(ggzyBusinessWay);
    	}
    	return AjaxObject.newOk("删除成功！").setCallbackType("").toString();
    }
    
}
