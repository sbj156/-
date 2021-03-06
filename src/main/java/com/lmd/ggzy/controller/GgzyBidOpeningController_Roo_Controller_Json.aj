// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBidOpeningController;
import com.lmd.ggzy.domain.GgzyBidOpening;
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

privileged aspect GgzyBidOpeningController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{bidOpeningId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidOpeningController.showJson(@PathVariable("bidOpeningId") String bidOpeningId) {
        GgzyBidOpening ggzyBidOpening = ggzyBidOpeningService.findGgzyBidOpening(bidOpeningId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBidOpening == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBidOpening.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidOpeningController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyBidOpening> result = ggzyBidOpeningService.findAllGgzyBidOpenings();
        return new ResponseEntity<String>(GgzyBidOpening.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyBidOpeningController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBidOpening ggzyBidOpening = GgzyBidOpening.fromJsonToGgzyBidOpening(json);
        ggzyBidOpeningService.saveGgzyBidOpening(ggzyBidOpening);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyBidOpening.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidOpeningController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBidOpening ggzyBidOpening: GgzyBidOpening.fromJsonArrayToGgzyBidOpenings(json)) {
            ggzyBidOpeningService.saveGgzyBidOpening(ggzyBidOpening);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
 /*   
    @RequestMapping(value = "/json/{bidOpeningId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidOpeningController.updateFromJson(@RequestBody String json, @PathVariable("bidOpeningId") String bidOpeningId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBidOpening ggzyBidOpening = GgzyBidOpening.fromJsonToGgzyBidOpening(json);
        ggzyBidOpening.setId(bidOpeningId);
        if (ggzyBidOpeningService.updateGgzyBidOpening(ggzyBidOpening) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }*/
    
    @RequestMapping(value = "/json/{bidOpeningId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidOpeningController.deleteFromJson(@PathVariable("bidOpeningId") String bidOpeningId) {
        GgzyBidOpening ggzyBidOpening = ggzyBidOpeningService.findGgzyBidOpening(bidOpeningId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBidOpening == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBidOpeningService.deleteGgzyBidOpening(ggzyBidOpening);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
