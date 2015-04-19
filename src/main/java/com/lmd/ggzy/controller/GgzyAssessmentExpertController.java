package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyAssessmentExpert;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzyassessmentexperts")
@Controller
@RooWebScaffold(path = "ggzyassessmentexperts", formBackingObject = GgzyAssessmentExpert.class)
public class GgzyAssessmentExpertController {
}
