// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import java.util.List;

import javax.servlet.ServletRequest;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.GgzyBusinessTypeMajor;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeMajorPK;

privileged aspect GgzyBusinessTypeMajorController_Roo_Controller_Json {
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBusinessTypeMajorController.showJson(@PathVariable("id") GgzyBusinessTypeMajorPK id) {
        GgzyBusinessTypeMajor ggzyBusinessTypeMajor = ggzyBusinessTypeMajorService.findGgzyBusinessTypeMajor(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBusinessTypeMajor == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBusinessTypeMajor.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value="/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBusinessTypeMajorController.listJson(ServletRequest request, Page page) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        Specification<GgzyBusinessTypeMajor> specification = DynamicSpecifications.bySearchFilter(request, GgzyBusinessTypeMajor.class);
        List<GgzyBusinessTypeMajor> result = ggzyBusinessTypeMajorService.findByExample(specification, page);
        return new ResponseEntity<String>(GgzyBusinessTypeMajor.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value="/json")
    public ResponseEntity<String> GgzyBusinessTypeMajorController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBusinessTypeMajor ggzyBusinessTypeMajor = GgzyBusinessTypeMajor.fromJsonToGgzyBusinessTypeMajor(json);
        ggzyBusinessTypeMajorService.saveGgzyBusinessTypeMajor(ggzyBusinessTypeMajor);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyBusinessTypeMajor.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBusinessTypeMajorController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBusinessTypeMajor ggzyBusinessTypeMajor: GgzyBusinessTypeMajor.fromJsonArrayToGgzyBusinessTypeMajors(json)) {
            ggzyBusinessTypeMajorService.saveGgzyBusinessTypeMajor(ggzyBusinessTypeMajor);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBusinessTypeMajorController.updateFromJson(@RequestBody String json, @PathVariable("id") GgzyBusinessTypeMajorPK id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBusinessTypeMajor ggzyBusinessTypeMajor = GgzyBusinessTypeMajor.fromJsonToGgzyBusinessTypeMajor(json);
        ggzyBusinessTypeMajor.setId(id);
        if (ggzyBusinessTypeMajorService.updateGgzyBusinessTypeMajor(ggzyBusinessTypeMajor) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBusinessTypeMajorController.deleteFromJson(@PathVariable("id") GgzyBusinessTypeMajorPK id) {
        GgzyBusinessTypeMajor ggzyBusinessTypeMajor = ggzyBusinessTypeMajorService.findGgzyBusinessTypeMajor(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBusinessTypeMajor == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBusinessTypeMajorService.deleteGgzyBusinessTypeMajor(ggzyBusinessTypeMajor);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}