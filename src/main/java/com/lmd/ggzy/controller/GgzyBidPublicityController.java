package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBidPublicity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybidpublicitys")
@Controller
@RooWebScaffold(path = "ggzybidpublicitys", formBackingObject = GgzyBidPublicity.class)
@RooWebJson(jsonObject = GgzyBidPublicity.class)
public class GgzyBidPublicityController {
}
