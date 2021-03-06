// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyAssessmentExpertController;
import com.lmd.ggzy.domain.GgzyAssessmentExpert;
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

privileged aspect GgzyAssessmentExpertController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyAssessmentExpertController.showJson(@PathVariable("id") String id) {
        GgzyAssessmentExpert ggzyAssessmentExpert = ggzyAssessmentExpertService.findGgzyAssessmentExpert(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyAssessmentExpert == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyAssessmentExpert.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyAssessmentExpertController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyAssessmentExpert> result = ggzyAssessmentExpertService.findAllGgzyAssessmentExperts();
        return new ResponseEntity<String>(GgzyAssessmentExpert.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyAssessmentExpertController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyAssessmentExpert ggzyAssessmentExpert = GgzyAssessmentExpert.fromJsonToGgzyAssessmentExpert(json);
        ggzyAssessmentExpertService.saveGgzyAssessmentExpert(ggzyAssessmentExpert);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
//        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyAssessmentExpert.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAssessmentExpertController.createFromJsonArray(@RequestBody String json) {
    	System.out.println(json);
        for (GgzyAssessmentExpert ggzyAssessmentExpert: GgzyAssessmentExpert.fromJsonArrayToGgzyAssessmentExperts(json)) {
            //ggzyAssessmentExpertService.saveGgzyAssessmentExpert(ggzyAssessmentExpert);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAssessmentExpertController.updateFromJson(@RequestBody String json, @PathVariable("id") String id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyAssessmentExpert ggzyAssessmentExpert = GgzyAssessmentExpert.fromJsonToGgzyAssessmentExpert(json);
        ggzyAssessmentExpert.setId(id);
        if (ggzyAssessmentExpertService.updateGgzyAssessmentExpert(ggzyAssessmentExpert) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyAssessmentExpertController.deleteFromJson(@PathVariable("id") String id) {
        GgzyAssessmentExpert ggzyAssessmentExpert = ggzyAssessmentExpertService.findGgzyAssessmentExpert(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyAssessmentExpert == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyAssessmentExpertService.deleteGgzyAssessmentExpert(ggzyAssessmentExpert);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
