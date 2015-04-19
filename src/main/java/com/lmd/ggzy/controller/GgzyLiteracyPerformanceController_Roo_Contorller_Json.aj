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

import com.lmd.ggzy.domain.GgzyLiteracyPerformance;

public aspect GgzyLiteracyPerformanceController_Roo_Contorller_Json {

	@RequestMapping(value = "/json/{performanceIdId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyPerformanceController.showJson(@PathVariable("performanceIdId") String performanceIdId) {
		GgzyLiteracyPerformance ggzyLiteracyPerformance = ggzyLiteracyPerformanceService.findGgzyLiteracyPerformance(performanceIdId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyLiteracyPerformance == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyLiteracyPerformance.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyLiteracyPerformanceController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyLiteracyPerformance> result = ggzyLiteracyPerformanceService.findAllGgzyLiteracyPerformances();
        return new ResponseEntity<String>(GgzyLiteracyPerformance.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyLiteracyPerformanceController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
    	GgzyLiteracyPerformance ggzyLiteracyPerformance = GgzyLiteracyPerformance.fromJsonToGgzyLiteracyPerformance(json);
    	ggzyLiteracyPerformanceService.saveGgzyLiteracyPerformance(ggzyLiteracyPerformance);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyLiteracyPerformance.getPerformanceId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyPerformanceController.createFromJsonArray(@RequestBody String json) {
        for (GgzyLiteracyPerformance ggzyLiteracyPerformance: GgzyLiteracyPerformance.fromJsonArrayToGgzyLiteracyPerformance(json)) {
        	ggzyLiteracyPerformanceService.saveGgzyLiteracyPerformance(ggzyLiteracyPerformance);
        } 
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{performanceIdId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyPerformanceController.updateFromJson(@RequestBody String json, @PathVariable("performanceIdId") String performanceIdId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyLiteracyPerformance ggzyLiteracyPerformance = GgzyLiteracyPerformance.fromJsonToGgzyLiteracyPerformance(json);
        ggzyLiteracyPerformance.setPerformanceId(performanceIdId);
        if (ggzyLiteracyPerformanceService.updateGgzyLiteracyPerformance(ggzyLiteracyPerformance) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{performanceIdId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyLiteracyPerformanceController.deleteFromJson(@PathVariable("performanceIdId") String performanceIdId) {
    	GgzyLiteracyPerformance ggzyLiteracyPerformance = ggzyLiteracyPerformanceService.findGgzyLiteracyPerformance(performanceIdId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyLiteracyPerformance == null) { 
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyLiteracyPerformanceService.deleteGgzyLiteracyPerformance(ggzyLiteracyPerformance);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
}
