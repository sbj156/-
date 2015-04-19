package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyTradingServicesFees;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzytradingservicesfeeses")
@Controller
@RooWebScaffold(path = "ggzytradingservicesfeeses", formBackingObject = GgzyTradingServicesFees.class)
@RooWebJson(jsonObject = GgzyTradingServicesFees.class)
public class GgzyTradingServicesFeesController {
}
