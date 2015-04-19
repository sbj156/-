// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import com.lmd.ggzy.controller.GgzyBidSiteController;
import com.lmd.ggzy.domain.GgzyBidSite;

import java.util.Calendar;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.NumberUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect GgzyBidSiteController_Roo_Controller_Json {
    
	/**
	 * 验证预约时间
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/json/valid", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
	public ResponseEntity<String> GgzyBidSiteController.validBidSite(@RequestParam("fieldValue") Calendar time, @RequestParam("fieldId") String fieldId){
		Object o = ggzyBidSiteService.callRepositoryMethod("bidAmount", time);
		int bidAmount = org.apache.commons.lang3.math.NumberUtils.toInt(o + "", 0);
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
		return new ResponseEntity<String>("[\""+ fieldId +"\", "+ (bidAmount < 7) +"]", HttpStatus.OK);
	}
	
	
    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidSiteController.showJson(@PathVariable("id") Long id) {
        GgzyBidSite ggzyBidSite = ggzyBidSiteService.findGgzyBidSite(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (ggzyBidSite == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(ggzyBidSite.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value = "/json")
    @ResponseBody
    public ResponseEntity<String> GgzyBidSiteController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<GgzyBidSite> result = ggzyBidSiteService.findAllGgzyBidSites();
        return new ResponseEntity<String>(GgzyBidSite.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json", value = "/json")
    public ResponseEntity<String> GgzyBidSiteController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        GgzyBidSite ggzyBidSite = GgzyBidSite.fromJsonToGgzyBidSite(json);
        ggzyBidSiteService.saveGgzyBidSite(ggzyBidSite);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+ggzyBidSite.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidSiteController.createFromJsonArray(@RequestBody String json) {
        for (GgzyBidSite ggzyBidSite: GgzyBidSite.fromJsonArrayToGgzyBidSites(json)) {
            ggzyBidSiteService.saveGgzyBidSite(ggzyBidSite);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidSiteController.updateFromJson(@RequestBody String json, @PathVariable("id") Long id) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        GgzyBidSite ggzyBidSite = GgzyBidSite.fromJsonToGgzyBidSite(json);
        ggzyBidSite.setId(id);
        if (ggzyBidSiteService.updateGgzyBidSite(ggzyBidSite) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> GgzyBidSiteController.deleteFromJson(@PathVariable("id") Long id) {
        GgzyBidSite ggzyBidSite = ggzyBidSiteService.findGgzyBidSite(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (ggzyBidSite == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        ggzyBidSiteService.deleteGgzyBidSite(ggzyBidSite);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}