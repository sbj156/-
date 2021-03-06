// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyNoticeTendersController;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
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

privileged aspect GgzyNoticeTendersController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyNoticeTendersController.showJson(@PathVariable("id") GgzyNoticeTendersPk id) {
        GgzyNoticeTenders ggzyNoticeTenders = ggzyNoticeTendersService.findGgzyNoticeTenders(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyNoticeTenders == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyNoticeTenders.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value = "/json")
    @ResponseBody
    public ResponseEntity<String> GgzyNoticeTendersController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyNoticeTenders> result = ggzyNoticeTendersService.findAllGgzyNoticeTenderses();
        return new ResponseEntity<String>(GgzyNoticeTenders.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value = "/json")
    public ResponseEntity<String> GgzyNoticeTendersController.createFromJson(@RequestBody GgzyNoticeTenders ggzyNoticeTenders, UriComponentsBuilder uriBuilder) {
//        GgzyNoticeTenders ggzyNoticeTenders = GgzyNoticeTenders.fromJsonToGgzyNoticeTenders(json);
        ggzyNoticeTendersService.saveGgzyNoticeTenders(ggzyNoticeTenders);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyNoticeTenders.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyNoticeTendersController.createFromJsonArray(@RequestBody String json) {
        for (GgzyNoticeTenders ggzyNoticeTenders: GgzyNoticeTenders.fromJsonArrayToGgzyNoticeTenderses(json)) {
            ggzyNoticeTendersService.saveGgzyNoticeTenders(ggzyNoticeTenders);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyNoticeTendersController.updateFromJson(@RequestBody String json, @PathVariable("id") GgzyNoticeTendersPk id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyNoticeTenders ggzyNoticeTenders = GgzyNoticeTenders.fromJsonToGgzyNoticeTenders(json);
        ggzyNoticeTenders.setId(id);
        if (ggzyNoticeTendersService.updateGgzyNoticeTenders(ggzyNoticeTenders) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyNoticeTendersController.deleteFromJson(@PathVariable("id") GgzyNoticeTendersPk id) {
        GgzyNoticeTenders ggzyNoticeTenders = ggzyNoticeTendersService.findGgzyNoticeTenders(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyNoticeTenders == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyNoticeTendersService.deleteGgzyNoticeTenders(ggzyNoticeTenders);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
