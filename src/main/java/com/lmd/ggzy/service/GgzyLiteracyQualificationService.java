package com.lmd.ggzy.service;

import org.springframework.roo.addon.layers.service.RooService;

import com.lmd.ggzy.domain.GgzyLiteracy;
import com.lmd.ggzy.domain.GgzyLiteracyQualification;

@RooService(domainTypes = { com.lmd.ggzy.domain.GgzyLiteracyQualification.class })
public interface GgzyLiteracyQualificationService extends
		BaseService<GgzyLiteracyQualification> {

}
