package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBasePro;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybaseproes")
@Controller
@RooWebScaffold(path = "ggzybaseproes", formBackingObject = GgzyBasePro.class)
@RooWebJson(jsonObject = GgzyBasePro.class)
public class GgzyBaseProController {
}
