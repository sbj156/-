package com.lmd.ggzy.controller;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyApply;

@RequestMapping("/business/ggzyapplys")
@Controller
@RooWebScaffold(path = "ggzyapplys", formBackingObject = GgzyApply.class)
@RooWebJson(jsonObject = GgzyApply.class)
public class GgzyApplyController {
}
