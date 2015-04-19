package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyContract;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzycontracts")
@Controller
@RooWebScaffold(path = "ggzycontracts", formBackingObject = GgzyContract.class)
@RooWebJson(jsonObject = GgzyContract.class)
public class GgzyContractController {
}
