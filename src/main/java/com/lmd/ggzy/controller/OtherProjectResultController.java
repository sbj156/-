package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.OtherProjectResult;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/otherprojectresults")
@Controller
@RooWebScaffold(path = "otherprojectresults", formBackingObject = OtherProjectResult.class)
public class OtherProjectResultController {
}
