package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyExpertApply;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzyexpertapplys")
@Controller
@RooWebScaffold(path = "ggzyexpertapplys", formBackingObject = GgzyExpertApply.class)
public class GgzyExpertApplyController {
}
