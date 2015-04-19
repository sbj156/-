package com.lmd.ggzy.controller;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyBusinessTypeMajor;

@RooWebJson(jsonObject = GgzyBusinessTypeMajor.class)
@Controller
@RequestMapping("/business/ggzybusinesstypemajors")
@RooWebScaffold(path = "ggzybusinesstypemajors", formBackingObject = GgzyBusinessTypeMajor.class)
public class GgzyBusinessTypeMajorController {
}
