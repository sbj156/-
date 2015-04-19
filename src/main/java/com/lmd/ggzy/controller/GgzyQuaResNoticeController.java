package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyQuaResNotice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyquaresnotices")
@Controller
@RooWebScaffold(path = "ggzyquaresnotices", formBackingObject = GgzyQuaResNotice.class)
@RooWebJson(jsonObject = GgzyQuaResNotice.class)
public class GgzyQuaResNoticeController {
}
