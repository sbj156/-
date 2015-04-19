package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyEvaluationReport;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyevaluationreports")
@Controller
@RooWebScaffold(path = "ggzyevaluationreports", formBackingObject = GgzyEvaluationReport.class)
@RooWebJson(jsonObject = GgzyEvaluationReport.class)
public class GgzyEvaluationReportController {
}
