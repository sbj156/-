package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBiddingCandidate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybiddingcandidates")
@Controller
@RooWebScaffold(path = "ggzybiddingcandidates", formBackingObject = GgzyBiddingCandidate.class)
@RooWebJson(jsonObject = GgzyBiddingCandidate.class)
public class GgzyBiddingCandidateController {
}
