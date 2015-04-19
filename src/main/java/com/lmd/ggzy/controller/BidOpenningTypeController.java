package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.BidOpenningType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/bidopenningtypes")
@Controller
@RooWebScaffold(path = "bidopenningtypes", formBackingObject = BidOpenningType.class)
public class BidOpenningTypeController {
}
