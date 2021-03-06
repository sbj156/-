// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

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

import com.lmd.ggzy.domain.GgzyEvaluationReport;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;

privileged aspect GgzyEvaluationReportController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyEvaluationReportController.showJson(@PathVariable("id") GgzyNoticeTendersPk id) {
        GgzyEvaluationReport ggzyEvaluationReport = ggzyEvaluationReportService.findGgzyEvaluationReport(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyEvaluationReport == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyEvaluationReport.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyEvaluationReportController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyEvaluationReport> result = ggzyEvaluationReportService.findAllGgzyEvaluationReports();
        return new ResponseEntity<String>(GgzyEvaluationReport.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyEvaluationReportController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyEvaluationReport ggzyEvaluationReport = GgzyEvaluationReport.fromJsonToGgzyEvaluationReport(json);
        ggzyEvaluationReportService.saveGgzyEvaluationReport(ggzyEvaluationReport);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyEvaluationReport.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyEvaluationReportController.createFromJsonArray(@RequestBody String json) {
        for (GgzyEvaluationReport ggzyEvaluationReport: GgzyEvaluationReport.fromJsonArrayToGgzyEvaluationReports(json)) {
            ggzyEvaluationReportService.saveGgzyEvaluationReport(ggzyEvaluationReport);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyEvaluationReportController.updateFromJson(@RequestBody String json, @PathVariable("id") GgzyNoticeTendersPk id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyEvaluationReport ggzyEvaluationReport = GgzyEvaluationReport.fromJsonToGgzyEvaluationReport(json);
        ggzyEvaluationReport.setId(id);
        if (ggzyEvaluationReportService.updateGgzyEvaluationReport(ggzyEvaluationReport) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyEvaluationReportController.deleteFromJson(@PathVariable("id") GgzyNoticeTendersPk id) {
        GgzyEvaluationReport ggzyEvaluationReport = ggzyEvaluationReportService.findGgzyEvaluationReport(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyEvaluationReport == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyEvaluationReportService.deleteGgzyEvaluationReport(ggzyEvaluationReport);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
