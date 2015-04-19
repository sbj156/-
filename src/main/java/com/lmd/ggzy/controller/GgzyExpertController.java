package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyExpert;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzyexperts")
@Controller
@RooWebScaffold(path = "ggzyexperts", formBackingObject = GgzyExpert.class)
public class GgzyExpertController {
}
