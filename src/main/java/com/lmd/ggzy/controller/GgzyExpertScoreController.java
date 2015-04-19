package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyExpertScore;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyexpertscores")
@Controller
@RooWebScaffold(path = "ggzyexpertscores", formBackingObject = GgzyExpertScore.class)
@RooWebJson(jsonObject = GgzyExpertScore.class)
public class GgzyExpertScoreController {
}
