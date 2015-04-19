package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyExceptionalCase;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyexceptionalcases")
@Controller
@RooWebScaffold(path = "ggzyexceptionalcases", formBackingObject = GgzyExceptionalCase.class)
@RooWebJson(jsonObject = GgzyExceptionalCase.class)
public class GgzyExceptionalCaseController {
}
