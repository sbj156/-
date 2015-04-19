package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyMajorType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzymajortypes")
@Controller
@RooWebScaffold(path = "ggzymajortypes", formBackingObject = GgzyMajorType.class)
public class GgzyMajorTypeController {
}
