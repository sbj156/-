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

import com.lmd.ggzy.domain.GgzyExpertScore;
import com.lmd.ggzy.domain.pk.GgzyExpertScorePk;

privileged aspect GgzyExpertScoreController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyExpertScoreController.showJson(@PathVariable("id") GgzyExpertScorePk id) {
        GgzyExpertScore ggzyExpertScore = ggzyExpertScoreService.findGgzyExpertScore(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyExpertScore == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyExpertScore.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyExpertScoreController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyExpertScore> result = ggzyExpertScoreService.findAllGgzyExpertScores();
        return new ResponseEntity<String>(GgzyExpertScore.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyExpertScoreController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
    	System.out.println(json);
        GgzyExpertScore ggzyExpertScore = GgzyExpertScore.fromJsonToGgzyExpertScore(json);
        ggzyExpertScoreService.saveGgzyExpertScore(ggzyExpertScore);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
//        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyExpertScore.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyExpertScoreController.createFromJsonArray(@RequestBody String json) {
        for (GgzyExpertScore ggzyExpertScore: GgzyExpertScore.fromJsonArrayToGgzyExpertScores(json)) {
            ggzyExpertScoreService.saveGgzyExpertScore(ggzyExpertScore);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyExpertScoreController.updateFromJson(@RequestBody String json, @PathVariable("id") GgzyExpertScorePk id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyExpertScore ggzyExpertScore = GgzyExpertScore.fromJsonToGgzyExpertScore(json);
        ggzyExpertScore.setId(id);
        
        if (ggzyExpertScoreService.updateGgzyExpertScore(ggzyExpertScore) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyExpertScoreController.deleteFromJson(@PathVariable("id") GgzyExpertScorePk id) {
        GgzyExpertScore ggzyExpertScore = ggzyExpertScoreService.findGgzyExpertScore(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyExpertScore == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyExpertScoreService.deleteGgzyExpertScore(ggzyExpertScore);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}