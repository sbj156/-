package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybusinesstypeopenningtypes")
@Controller
@RooWebScaffold(path = "ggzybusinesstypeopenningtypes", formBackingObject = GgzyBusinessTypeOpenningType.class)
@RooWebJson(jsonObject = GgzyBusinessTypeOpenningType.class)
public class GgzyBusinessTypeOpenningTypeController {
}
