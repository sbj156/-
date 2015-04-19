package com.lmd.ggzy.controller;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.lmd.ggzy.domain.GgzyLiteracy;

@RequestMapping("/business/ggzyliteracys")
@Controller
@RooWebScaffold(path = "ggzyliteracys", formBackingObject = GgzyLiteracy.class)
@RooWebJson(jsonObject = GgzyLiteracy.class)
public class GgzyLiteracyController {

}
