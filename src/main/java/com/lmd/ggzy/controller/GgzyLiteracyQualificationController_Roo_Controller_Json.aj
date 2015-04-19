package com.lmd.ggzy.controller;

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

import com.lmd.ggzy.domain.GgzyLiteracyQualification;;

public aspect GgzyLiteracyQualificationController_Roo_Controller_Json { 
	@RequestMapping(value = "/json/{qualificationId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyQualificationController.showJson(@PathVariable("qualificationId") String qualificationId) {
		GgzyLiteracyQualification ggzyLiteracyQualification = ggzyLiteracyQualificationService.findGgzyLiteracyQualification(qualificationId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyLiteracyQualification == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyLiteracyQualification.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyQualificationController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyLiteracyQualification> result = ggzyLiteracyQualificationService.findAllGgzyLiteracyQualifications();
        return new ResponseEntity<String>(GgzyLiteracyQualification.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyLiteracyQualificationController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
    	GgzyLiteracyQualification ggzyLiteracyQualification = GgzyLiteracyQualification.fromJsonToGgzyLiteracyQualification(json);
    	ggzyLiteracyQualificationService.saveGgzyLiteracyQualification(ggzyLiteracyQualification);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyLiteracyQualification.getQualificationId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyQualificationController.createFromJsonArray(@RequestBody String json) {
        for (GgzyLiteracyQualification ggzyLiteracyQualification: GgzyLiteracyQualification.fromJsonArrayToGgzyLiteracyQualification(json)) {
        	ggzyLiteracyQualificationService.saveGgzyLiteracyQualification(ggzyLiteracyQualification);
        } 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{qualificationId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyQualificationController.updateFromJson(@RequestBody String json, @PathVariable("qualificationId") String qualificationId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyLiteracyQualification ggzyLiteracyQualification = GgzyLiteracyQualification.fromJsonToGgzyLiteracyQualification(json);
        ggzyLiteracyQualification.setQualificationId(qualificationId);
        if (ggzyLiteracyQualificationService.updateGgzyLiteracyQualification(ggzyLiteracyQualification) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{qualificationId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyQualificationController.deleteFromJson(@PathVariable("qualificationId") String qualificationId) {
    	GgzyLiteracyQualification ggzyLiteracyQualification = ggzyLiteracyQualificationService.findGgzyLiteracyQualification(qualificationId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyLiteracyQualification == null) { 
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyLiteracyQualificationService.deleteGgzyLiteracyQualification(ggzyLiteracyQualification);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
}
