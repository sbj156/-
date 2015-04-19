// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.lmd.ggzy.controller.GgzyAttachmentController;
import com.lmd.ggzy.domain.GgzyAttachment;
import java.util.List;

import javax.validation.Valid;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect GgzyAttachmentController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{attachmentId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyAttachmentController.showJson(@PathVariable("attachmentId") String attachmentId) {
        GgzyAttachment ggzyAttachment = ggzyAttachmentService.findGgzyAttachment(attachmentId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyAttachment == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyAttachment.toJson(), headers, HttpStatus.OK);
    }
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyAttachmentController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyAttachment> result = ggzyAttachmentService.findAllGgzyAttachments();
        return new ResponseEntity<String>(GgzyAttachment.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    
    @RequestMapping(method = RequestMethod.POST,value="/create",headers = "Accept=application/json")
    public @ResponseBody String GgzyAttachmentController.createFromJson(@Valid GgzyAttachment ggzyAttachment, UriComponentsBuilder uriBuilder) {
        ggzyAttachmentService.saveGgzyAttachment(ggzyAttachment);
//        HttpHeaders headers = new HttpHeaders();
//        headers.add("Content-Type", "application/json");
//        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
//        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyAttachment.getAttachmentId().toString()).build().toUriString());
//        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
        return AjaxObject.newOk("success").toString();
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAttachmentController.createFromJsonArray(@RequestBody String json) {
        for (GgzyAttachment ggzyAttachment: GgzyAttachment.fromJsonArrayToGgzyAttachments(json)) {
            ggzyAttachmentService.saveGgzyAttachment(ggzyAttachment);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{attachmentId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAttachmentController.updateFromJson(@RequestBody String json, @PathVariable("attachmentId") String attachmentId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyAttachment ggzyAttachment = GgzyAttachment.fromJsonToGgzyAttachment(json);
        ggzyAttachment.setAttachmentId(attachmentId);
        if (ggzyAttachmentService.updateGgzyAttachment(ggzyAttachment) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/delete/{attachmentId}", headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAttachmentController.deleteFromJson(@PathVariable("attachmentId") String attachmentId) {
        GgzyAttachment ggzyAttachment = ggzyAttachmentService.findGgzyAttachment(attachmentId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyAttachment == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyAttachmentService.deleteGgzyAttachment(ggzyAttachment);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}