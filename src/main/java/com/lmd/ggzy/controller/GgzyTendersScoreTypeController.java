package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyTendersScoreType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzytendersscoretypes")
@Controller
@RooWebScaffold(path = "GgzyTendersScoreTypes", formBackingObject = GgzyTendersScoreType.class)
@RooWebJson(jsonObject = GgzyTendersScoreType.class)
public class GgzyTendersScoreTypeController {
}
