package com.lmd.ggzy.controller;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyLiteracyQualification;

@RequestMapping("/business/ggzyliteracyqualifications")
@Controller
@RooWebJson(jsonObject=GgzyLiteracyQualification.class)
@RooWebScaffold(path="/ggzyliteracyqualifications",formBackingObject=GgzyLiteracyQualification.class)
public class GgzyLiteracyQualificationController {

}
