package com.lmd.ggzy.controller;
import com.lmd.ggzy.domain.GgzyProspectRecord;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/business/ggzyprospectrecords")
@Controller
@RooWebScaffold(path = "ggzyprospectrecords", formBackingObject = GgzyProspectRecord.class)
@RooWebJson(jsonObject = GgzyProspectRecord.class)
public class GgzyProspectRecordController {
}
