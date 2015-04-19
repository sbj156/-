package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzynoticetenderses")
@Controller
@RooWebScaffold(path = "ggzynoticetenderses", formBackingObject = GgzyNoticeTenders.class)
@RooWebJson(jsonObject = GgzyNoticeTenders.class)
public class GgzyNoticeTendersController {
}
