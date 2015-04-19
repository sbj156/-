package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBusinessWay;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/business/ggzybusinessways")
@Controller
@RooWebScaffold(path = "ggzybusinessways", formBackingObject = GgzyBusinessWay.class)
public class GgzyBusinessWayController {
}
