package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyAttachment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyattachments")
@Controller
@RooWebScaffold(path = "ggzyattachments", formBackingObject = GgzyAttachment.class)
@RooWebJson(jsonObject = GgzyAttachment.class)
public class GgzyAttachmentController {
}
