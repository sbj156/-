<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>交易编号：</label>
					<input type="text" name="search_LIKE_proName"
					value="${param.search_LIKE_proName }" /></li>
					<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_proName"
					value="${param.search_LIKE_proName }" /></li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">
									<spring:message code="searchbtn" />
								</button>
							</div>
					</div></li>
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>

<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="lookup2organization_add" mask="true" width="900" height="500"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span>项目报名</span></a></li>
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="lookup2organization_edit" mask="true" width="900" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span>
				报名详细</span></a></li>
			<!--
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzybasepro_deletebtn" /> </span></a></li>
		    -->
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"	class="checkboxCtrl"></th>
				<th width="40">交易编号：</th>
				<th width="300"><spring:message code="ggzybasepro_proname" /></th>
				<th width="75">报名开始时间</th>
				<th width="75">报名结束时间</th>
				<th width="75">开标时间</th>
				<th width="35">报名家数</th>
			</tr>
		</thead>
		<tbody>
			<tr target="slt_uid" rel="1">
				<td align="center"><input name="ids" value="1" type="checkbox"></td>
				<td align="center">2014JSSZ04Z0005</td>
				<td >济南热电有限公司纬十二路、阳光南路南延供热管网安装工程</td>
                <td align="center">2014-05-14 09:56</td>
				<td align="center">2014-05-19 16:30</td>
				<td align="center">暂未预约</td>
				<td align="center">3</td>
			</tr>
		</tbody>
	</table>
	<dwz:pagination page="${page }" />
</div>
