package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyProspectNotice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyprospectnotices")
@Controller
@RooWebScaffold(path = "ggzyprospectnotices", formBackingObject = GgzyProspectNotice.class)
@RooWebJson(jsonObject = GgzyProspectNotice.class)
public class GgzyProspectNoticeController {
}
