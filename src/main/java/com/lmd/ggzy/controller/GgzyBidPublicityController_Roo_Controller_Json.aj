// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBidPublicityController;
import com.lmd.ggzy.domain.GgzyBidPublicity;
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

privileged aspect GgzyBidPublicityController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{bidPublicityId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidPublicityController.showJson(@PathVariable("bidPublicityId") String bidPublicityId) {
        GgzyBidPublicity ggzyBidPublicity = ggzyBidPublicityService.findGgzyBidPublicity(bidPublicityId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBidPublicity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBidPublicity.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidPublicityController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyBidPublicity> result = ggzyBidPublicityService.findAllGgzyBidPublicitys();
        return new ResponseEntity<String>(GgzyBidPublicity.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyBidPublicityController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBidPublicity ggzyBidPublicity = GgzyBidPublicity.fromJsonToGgzyBidPublicity(json);
        ggzyBidPublicityService.saveGgzyBidPublicity(ggzyBidPublicity);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyBidPublicity.getBidPublicityId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidPublicityController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBidPublicity ggzyBidPublicity: GgzyBidPublicity.fromJsonArrayToGgzyBidPublicitys(json)) {
            ggzyBidPublicityService.saveGgzyBidPublicity(ggzyBidPublicity);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{bidPublicityId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidPublicityController.updateFromJson(@RequestBody String json, @PathVariable("bidPublicityId") String bidPublicityId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBidPublicity ggzyBidPublicity = GgzyBidPublicity.fromJsonToGgzyBidPublicity(json);
        ggzyBidPublicity.setBidPublicityId(bidPublicityId);
        if (ggzyBidPublicityService.updateGgzyBidPublicity(ggzyBidPublicity) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{bidPublicityId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidPublicityController.deleteFromJson(@PathVariable("bidPublicityId") String bidPublicityId) {
        GgzyBidPublicity ggzyBidPublicity = ggzyBidPublicityService.findGgzyBidPublicity(bidPublicityId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBidPublicity == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBidPublicityService.deleteGgzyBidPublicity(ggzyBidPublicity);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
