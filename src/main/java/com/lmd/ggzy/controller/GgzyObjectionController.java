package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyObjection;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyobjections")
@Controller
@RooWebScaffold(path = "ggzyobjections", formBackingObject = GgzyObjection.class)
@RooWebJson(jsonObject = GgzyObjection.class)
public class GgzyObjectionController {
}
