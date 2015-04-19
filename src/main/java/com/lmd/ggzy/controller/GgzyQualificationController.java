package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyQualification;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyqualifications")
@Controller
@RooWebScaffold(path = "ggzyqualifications", formBackingObject = GgzyQualification.class)
@RooWebJson(jsonObject = GgzyQualification.class)
public class GgzyQualificationController {
}
