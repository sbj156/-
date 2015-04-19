package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBidSite;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybidsites")
@Controller
@RooWebScaffold(path = "ggzybidsites", formBackingObject = GgzyBidSite.class)
@RooWebJson(jsonObject = GgzyBidSite.class)
public class GgzyBidSiteController {
}
