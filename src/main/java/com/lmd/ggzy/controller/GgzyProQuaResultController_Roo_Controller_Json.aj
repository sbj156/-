// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyProQuaResultController;
import com.lmd.ggzy.domain.GgzyProQuaResult;
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

privileged aspect GgzyProQuaResultController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{proQuaResultId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyProQuaResultController.showJson(@PathVariable("proQuaResultId") String proQuaResultId) {
        GgzyProQuaResult ggzyProQuaResult = ggzyProQuaResultService.findGgzyProQuaResult(proQuaResultId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyProQuaResult == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyProQuaResult.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyProQuaResultController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyProQuaResult> result = ggzyProQuaResultService.findAllGgzyProQuaResults();
        return new ResponseEntity<String>(GgzyProQuaResult.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyProQuaResultController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyProQuaResult ggzyProQuaResult = GgzyProQuaResult.fromJsonToGgzyProQuaResult(json);
        ggzyProQuaResultService.saveGgzyProQuaResult(ggzyProQuaResult);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyProQuaResult.getProQuaResultId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyProQuaResultController.createFromJsonArray(@RequestBody String json) {
        for (GgzyProQuaResult ggzyProQuaResult: GgzyProQuaResult.fromJsonArrayToGgzyProQuaResults(json)) {
            ggzyProQuaResultService.saveGgzyProQuaResult(ggzyProQuaResult);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{proQuaResultId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyProQuaResultController.updateFromJson(@RequestBody String json, @PathVariable("proQuaResultId") String proQuaResultId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyProQuaResult ggzyProQuaResult = GgzyProQuaResult.fromJsonToGgzyProQuaResult(json);
        ggzyProQuaResult.setProQuaResultId(proQuaResultId);
        if (ggzyProQuaResultService.updateGgzyProQuaResult(ggzyProQuaResult) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{proQuaResultId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyProQuaResultController.deleteFromJson(@PathVariable("proQuaResultId") String proQuaResultId) {
        GgzyProQuaResult ggzyProQuaResult = ggzyProQuaResultService.findGgzyProQuaResult(proQuaResultId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyProQuaResult == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyProQuaResultService.deleteGgzyProQuaResult(ggzyProQuaResult);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
