package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBidOpening;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybidopenings")
@Controller
@RooWebScaffold(path = "ggzybidopenings", formBackingObject = GgzyBidOpening.class)
@RooWebJson(jsonObject = GgzyBidOpening.class)
public class GgzyBidOpeningController {
}
