package com.lmd.ggzy.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.lmd.ggzy.domain.GgzyBiddingUser;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybiddingusers")
@Controller
@RooWebScaffold(path = "ggzybiddingusers", formBackingObject = GgzyBiddingUser.class)
@RooWebJson(jsonObject = GgzyBiddingUser.class)
public class GgzyBiddingUserController {
}
