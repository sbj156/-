package com.lmd.ggzy.controller;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyLiteracyPerformance;

@RequestMapping("/business/ggzyliteracyperformances")
@Controller
@RooWebJson(jsonObject=GgzyLiteracyPerformance.class)
@RooWebScaffold(path="/ggzyliteracyperformances",formBackingObject=GgzyLiteracyPerformance.class)

public class GgzyLiteracyPerformanceController {

}
