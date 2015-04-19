package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyBondRecord;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzybondrecords")
@Controller
@RooWebScaffold(path = "ggzybondrecords", formBackingObject = GgzyBondRecord.class)
@RooWebJson(jsonObject = GgzyBondRecord.class)
public class GgzyBondRecordController {
}
