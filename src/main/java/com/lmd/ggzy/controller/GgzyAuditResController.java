package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyAuditRes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzyauditreses")
@Controller
@RooWebScaffold(path = "ggzyauditreses", formBackingObject = GgzyAuditRes.class)
public class GgzyAuditResController {
}
