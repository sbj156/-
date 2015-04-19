package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBusinessType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzybusinesstypes")
@Controller
@RooWebScaffold(path = "ggzybusinesstypes", formBackingObject = GgzyBusinessType.class)
public class GgzyBusinessTypeController {
}
