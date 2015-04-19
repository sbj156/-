package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBidInvitation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybidinvitations")
@Controller
@RooWebScaffold(path = "ggzybidinvitations", formBackingObject = GgzyBidInvitation.class)
@RooWebJson(jsonObject = GgzyBidInvitation.class)
public class GgzyBidInvitationController {
}
