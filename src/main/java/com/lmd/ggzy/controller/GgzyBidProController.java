package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBidPro;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybidproes")
@Controller
@RooWebScaffold(path = "ggzybidproes", formBackingObject = GgzyBidPro.class)
@RooWebJson(jsonObject = GgzyBidPro.class)
public class GgzyBidProController {
}
