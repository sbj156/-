package com.lmd.ggzy.jdbc.template;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.ketacustom.util.persistence.SearchFilter;

public class ReportDao extends NamedParameterJdbcDaoSupport {
	
	
	public List<Map<String, Object>> queryForMap(String sql, Map<String, ?> params){
		return this.getNamedParameterJdbcTemplate().queryForList(sql, new MapSqlParameterSource(params));
	}
	
	
	public void queryForMap(HttpServletRequest request){
		Collection<SearchFilter> filters = DynamicSpecifications.genSearchFilter(request, "query");
		String sql = "";
//		for(SearchFilter filters )
	}
	
	
}
