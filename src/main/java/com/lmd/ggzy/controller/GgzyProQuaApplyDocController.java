package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyProQuaApplyDoc;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyproquaapplydocs")
@Controller
@RooWebScaffold(path = "ggzyproquaapplydocs", formBackingObject = GgzyProQuaApplyDoc.class)
@RooWebJson(jsonObject = GgzyProQuaApplyDoc.class)
public class GgzyProQuaApplyDocController {
}
