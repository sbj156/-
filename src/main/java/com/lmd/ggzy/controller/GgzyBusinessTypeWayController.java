package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBusinessTypeWay;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = GgzyBusinessTypeWay.class)
@Controller
@RequestMapping("/business/ggzybusinesstypeways")
@RooWebScaffold(path = "ggzybusinesstypeways", formBackingObject = GgzyBusinessTypeWay.class)
public class GgzyBusinessTypeWayController {
}
