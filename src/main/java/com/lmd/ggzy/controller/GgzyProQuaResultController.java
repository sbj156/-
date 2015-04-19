package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyProQuaResult;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyproquaresults")
@Controller
@RooWebScaffold(path = "ggzyproquaresults", formBackingObject = GgzyProQuaResult.class)
@RooWebJson(jsonObject = GgzyProQuaResult.class)
public class GgzyProQuaResultController {
}
