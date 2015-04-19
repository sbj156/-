package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBiddingResNotice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybiddingresnotices")
@Controller
@RooWebScaffold(path = "ggzybiddingresnotices", formBackingObject = GgzyBiddingResNotice.class)
@RooWebJson(jsonObject = GgzyBiddingResNotice.class)
public class GgzyBiddingResNoticeController {
}
