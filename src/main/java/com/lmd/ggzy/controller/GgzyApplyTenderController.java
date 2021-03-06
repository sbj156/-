package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyApplyTender;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyapplytenders")
@Controller
@RooWebScaffold(path = "ggzyapplytenders", formBackingObject = GgzyApplyTender.class)
@RooWebJson(jsonObject = GgzyApplyTender.class)
public class GgzyApplyTenderController {
}
