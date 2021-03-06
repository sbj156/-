// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.service.UserService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.lmd.ggzy.controller.GgzyBiddingUserController;
import com.lmd.ggzy.domain.GgzyBiddingUser;
import com.lmd.ggzy.service.GgzyBiddingUserService;
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

privileged aspect GgzyBiddingUserController_Roo_Controller {
    
    @Autowired
    GgzyBiddingUserService GgzyBiddingUserController.ggzyBiddingUserService;
    
    @Autowired
    UserService GgzyBiddingUserController.userService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyBiddingUserController.create(@Valid GgzyBiddingUser ggzyBiddingUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	AjaxObject status = null;
        if (bindingResult.hasErrors()) {
            status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
        }else{
        	uiModel.asMap().clear();
        	ggzyBiddingUserService.saveGgzyBiddingUser(ggzyBiddingUser);
        	status = AjaxObject.newOk(ControllerConst.SAVE_SUCCESS, true);
        }
        uiModel.addAttribute(ControllerConst.STATUS, status);
        return ControllerConst.JSON_STATUS_VIEW;
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBiddingUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new GgzyBiddingUser());
        return "ggzybiddingusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String GgzyBiddingUserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("ggzybiddinguser", ggzyBiddingUserService.findGgzyBiddingUser(id));
        uiModel.addAttribute("itemId", id);
        return "ggzybiddingusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBiddingUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzybiddingusers", ggzyBiddingUserService.findGgzyBiddingUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyBiddingUserService.countAllGgzyBiddingUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzybiddingusers", ggzyBiddingUserService.findAllGgzyBiddingUsers());
        }
        return "ggzybiddingusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyBiddingUserController.update(@Valid GgzyBiddingUser ggzyBiddingUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBiddingUser);
            return "ggzybiddingusers/update";
        }
        uiModel.asMap().clear();
        ggzyBiddingUserService.updateGgzyBiddingUser(ggzyBiddingUser);
        return "redirect:/ggzybiddingusers/" + encodeUrlPathSegment(ggzyBiddingUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String GgzyBiddingUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ggzyBiddingUserService.findGgzyBiddingUser(id));
        uiModel.addAttribute("user", userService.get(id));
        return "ggzybiddingusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBiddingUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBiddingUser ggzyBiddingUser = ggzyBiddingUserService.findGgzyBiddingUser(id);
        ggzyBiddingUserService.deleteGgzyBiddingUser(ggzyBiddingUser);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybiddingusers";
    }
    
    void GgzyBiddingUserController.populateEditForm(Model uiModel, GgzyBiddingUser ggzyBiddingUser) {
        uiModel.addAttribute("ggzyBiddingUser", ggzyBiddingUser);
    }
    
    String GgzyBiddingUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
