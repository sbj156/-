package com.lmd.ggzy.controller;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;

@RequestMapping("/business/ggzydisciplinaryrecords")
@Controller
@RooWebScaffold(path = "GgzyDisciplinaryRecords", formBackingObject = GgzyDisciplinaryRecord.class)
@RooWebJson(jsonObject = GgzyDisciplinaryRecord.class)
public class GgzyDisciplinaryRecordController {

}
