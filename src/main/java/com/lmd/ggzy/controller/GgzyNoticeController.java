package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyNotice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzynotices")
@Controller
@RooWebScaffold(path = "ggzynotices", formBackingObject = GgzyNotice.class)
@RooWebJson(jsonObject = GgzyNotice.class)
public class GgzyNoticeController {
}
