package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.SubjectPerformance;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/subjectperformances")
@Controller
@RooWebScaffold(path = "subjectperformances", formBackingObject = SubjectPerformance.class)
@RooWebJson(jsonObject = SubjectPerformance.class)
public class SubjectPerformanceController {
}
