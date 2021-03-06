// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBiddingSubjectController;
import com.lmd.ggzy.domain.GgzyBiddingSubject;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect GgzyBiddingSubjectController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{biddingSubjectId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBiddingSubjectController.showJson(@PathVariable("biddingSubjectId") String biddingSubjectId) {
        GgzyBiddingSubject ggzyBiddingSubject = ggzyBiddingSubjectService.findGgzyBiddingSubject(biddingSubjectId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBiddingSubject == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBiddingSubject.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBiddingSubjectController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyBiddingSubject> result = ggzyBiddingSubjectService.findAllGgzyBiddingSubjects();
        return new ResponseEntity<String>(GgzyBiddingSubject.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyBiddingSubjectController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBiddingSubject ggzyBiddingSubject = GgzyBiddingSubject.fromJsonToGgzyBiddingSubject(json);
        ggzyBiddingSubjectService.saveGgzyBiddingSubject(ggzyBiddingSubject);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyBiddingSubject.getBiddingSubjectId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBiddingSubjectController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBiddingSubject ggzyBiddingSubject: GgzyBiddingSubject.fromJsonArrayToGgzyBiddingSubjects(json)) {
            ggzyBiddingSubjectService.saveGgzyBiddingSubject(ggzyBiddingSubject);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{biddingSubjectId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBiddingSubjectController.updateFromJson(@RequestBody String json, @PathVariable("biddingSubjectId") String biddingSubjectId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBiddingSubject ggzyBiddingSubject = GgzyBiddingSubject.fromJsonToGgzyBiddingSubject(json);
        ggzyBiddingSubject.setBiddingSubjectId(biddingSubjectId);
        if (ggzyBiddingSubjectService.updateGgzyBiddingSubject(ggzyBiddingSubject) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{biddingSubjectId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBiddingSubjectController.deleteFromJson(@PathVariable("biddingSubjectId") String biddingSubjectId) {
        GgzyBiddingSubject ggzyBiddingSubject = ggzyBiddingSubjectService.findGgzyBiddingSubject(biddingSubjectId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBiddingSubject == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBiddingSubjectService.deleteGgzyBiddingSubject(ggzyBiddingSubject);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
