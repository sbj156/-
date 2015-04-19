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

import com.lmd.ggzy.domain.GgzyLiteracy;

privileged aspect GgzyLiteracyController_Roo_Controller_Json {
	@RequestMapping(value = "/json/{literacyId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyController.showJson(@PathVariable("literacyId") String literacyId) {
		GgzyLiteracy ggzyLiteracy = ggzyLiteracyService.findGgzyLiteracy(literacyId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyLiteracy == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyLiteracy.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyLiteracy> result = ggzyLiteracyService.findAllGgzyLiteracies();
        return new ResponseEntity<String>(GgzyLiteracy.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyLiteracyController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
    	GgzyLiteracy ggzyLiteracy = GgzyLiteracy.fromJsonToGgzyLiteracy(json);
    	ggzyLiteracyService.saveGgzyLiteracy(ggzyLiteracy);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyLiteracy.getLiteracyId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyController.createFromJsonArray(@RequestBody String json) {
        for (GgzyLiteracy ggzyLiteracy: GgzyLiteracy.fromJsonArrayToGgzyLiteracy(json)) {
        	ggzyLiteracyService.saveGgzyLiteracy(ggzyLiteracy);
        } 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{literacyId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyController.updateFromJson(@RequestBody String json, @PathVariable("literacyId") String literacyId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyLiteracy ggzyLiteracy = GgzyLiteracy.fromJsonToGgzyLiteracy(json);
        ggzyLiteracy.setLiteracyId(literacyId);
        if (ggzyLiteracyService.updateGgzyLiteracy(ggzyLiteracy) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{literacyId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyController.deleteFromJson(@PathVariable("literacyId") String literacyId) {
    	GgzyLiteracy ggzyLiteracy = ggzyLiteracyService.findGgzyLiteracy(literacyId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyLiteracy == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyLiteracyService.deleteGgzyLiteracy(ggzyLiteracy);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
}
