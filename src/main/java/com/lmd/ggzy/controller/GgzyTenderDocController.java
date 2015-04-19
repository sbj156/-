package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyTenderDoc;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzytenderdocs")
@Controller
@RooWebScaffold(path = "ggzytenderdocs", formBackingObject = GgzyTenderDoc.class)
@RooWebJson(jsonObject = GgzyTenderDoc.class)
public class GgzyTenderDocController {
}
