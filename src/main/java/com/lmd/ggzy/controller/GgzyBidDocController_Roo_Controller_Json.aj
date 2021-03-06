// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBidDocController;
import com.lmd.ggzy.domain.GgzyBidDoc;
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

privileged aspect GgzyBidDocController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{bidDocId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidDocController.showJson(@PathVariable("bidDocId") String bidDocId) {
        GgzyBidDoc ggzyBidDoc = ggzyBidDocService.findGgzyBidDoc(bidDocId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBidDoc == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBidDoc.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidDocController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyBidDoc> result = ggzyBidDocService.findAllGgzyBidDocs();
        return new ResponseEntity<String>(GgzyBidDoc.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyBidDocController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBidDoc ggzyBidDoc = GgzyBidDoc.fromJsonToGgzyBidDoc(json);
        ggzyBidDocService.saveGgzyBidDoc(ggzyBidDoc);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidDocController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBidDoc ggzyBidDoc: GgzyBidDoc.fromJsonArrayToGgzyBidDocs(json)) {
            ggzyBidDocService.saveGgzyBidDoc(ggzyBidDoc);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{bidDocId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidDocController.updateFromJson(@RequestBody String json, @PathVariable("bidDocId") String bidDocId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBidDoc ggzyBidDoc = GgzyBidDoc.fromJsonToGgzyBidDoc(json);
        ggzyBidDoc.setBidDocId(bidDocId);
        if (ggzyBidDocService.updateGgzyBidDoc(ggzyBidDoc) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{bidDocId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidDocController.deleteFromJson(@PathVariable("bidDocId") String bidDocId) {
        GgzyBidDoc ggzyBidDoc = ggzyBidDocService.findGgzyBidDoc(bidDocId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBidDoc == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBidDocService.deleteGgzyBidDoc(ggzyBidDoc);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
