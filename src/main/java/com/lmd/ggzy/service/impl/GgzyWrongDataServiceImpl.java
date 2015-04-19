package com.lmd.ggzy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.lmd.ggzy.domain.GgzyWrongData;

@Service
public class GgzyWrongDataServiceImpl extends BaseServiceTemplateImpl<GgzyWrongData, Long> {

	public List<Object[]> agencyOrder(Map<String, Object> params){
		String sql = "select * from (select agency, count(1) total from ggzy_wrongdata w where w.agency like '%'||:agency||'%' and to_char(w.change_date,'yyyy-mm-dd') >= :startTime and to_char(w.change_date,'yyyy-mm-dd') <= :endTime and w.duty_party like '%'||:dutyParty||'%' group by agency) order by total desc";
		return this.nativeQueryList(sql, params);
	}

	
}
