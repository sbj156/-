// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.lmd.ggzy.domain.GgzyTenders;
import com.lmd.ggzy.repository.GgzyTendersRepository;

privileged aspect GgzyTendersServiceImpl_Roo_Service {

	declare @type: GgzyTendersServiceImpl: @Service;

	declare @type: GgzyTendersServiceImpl: @Transactional;

	@Autowired
	GgzyTendersRepository GgzyTendersServiceImpl.ggzyTendersRepository;

	public long GgzyTendersServiceImpl.countAllGgzyTenderses() {
		return ggzyTendersRepository.count();
	}

	public void GgzyTendersServiceImpl.deleteGgzyTenders(GgzyTenders ggzyTenders) {
		ggzyTendersRepository.delete(ggzyTenders);
	}

	public GgzyTenders GgzyTendersServiceImpl.findGgzyTenders(String id) {
		return ggzyTendersRepository.findOne(id);
	}

	public List<GgzyTenders> GgzyTendersServiceImpl.findAllGgzyTenderses() {
		return ggzyTendersRepository.findAll();
	}

	public List<GgzyTenders> GgzyTendersServiceImpl.findGgzyTendersEntries(
			int firstResult, int maxResults) {
		return ggzyTendersRepository.findAll(
				new org.springframework.data.domain.PageRequest(firstResult
						/ maxResults, maxResults)).getContent();
	}

	public void GgzyTendersServiceImpl.saveGgzyTenders(GgzyTenders ggzyTenders) {
		/**
		 * 生成标段编号 招标项目编号+3位顺序号
		 */
		if (ggzyTenders.getBidPro() != null
				&& ggzyTenders.getBidPro().getBidProId() != null) {
			Object[] res = (Object[]) ggzyTendersRepository
					.getNextTendersCode(ggzyTenders.getBidPro().getBidProId());
			if (res != null)
				ggzyTenders.setTendersCode(String.format("%s%03d", res[0],
						Integer.parseInt(res[1].toString())+ 1));
		}
		ggzyTendersRepository.save(ggzyTenders);
	}

	public GgzyTenders GgzyTendersServiceImpl.updateGgzyTenders(
			GgzyTenders ggzyTenders) {
		return ggzyTendersRepository.save(ggzyTenders);
	}

}
