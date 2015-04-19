package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyOtherScore;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyotherscores")
@Controller
@RooWebScaffold(path = "ggzyotherscores", formBackingObject = GgzyOtherScore.class)
@RooWebJson(jsonObject = GgzyOtherScore.class)
public class GgzyOtherScoreController {
}
