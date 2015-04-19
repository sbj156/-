package com.lmd.ggzy.service.impl;

import com.lmd.ggzy.domain.GgzyBusinessTypeMajor;
import com.lmd.ggzy.domain.pk.GgzyBusinessTypeMajorPK;
import com.lmd.ggzy.service.GgzyBusinessTypeMajorService;

public class GgzyBusinessTypeMajorServiceImpl extends BaseServiceImpl<GgzyBusinessTypeMajor> implements GgzyBusinessTypeMajorService {


	@Override
	public void deleteByPk(GgzyBusinessTypeMajorPK pk) {
		// TODO Auto-generated method stub
		ggzyBusinessTypeMajorRepository.deleteByPk(pk);
		
	}

}
