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
				rel="lookup2organization_add" mask="true" width="1000" height="400"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span>专家抽取</span></a></li>
			<!--<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message
							code="ggzybasepro_addbtn" /> </span></a></li>-->
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="1000" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span>专家记录</span></a></li>
			<!--<li><a iconClass="application_delete" target="selectedTodo"
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
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="50">交易编号</th>
				<th width="200">项目名称</th>
				<th width="75">交易时间</th>
				<th width="75">专家抽取状态</th>
			</tr>
		</thead>
		<tbody>
			<tr target="slt_uid" rel="1">
				<td align="center"><input name="ids" value="1" type="checkbox"></td>
				<td align="center">2014JSJL05Z0008</td>
				<td align="lift">济南市宝华街道路改造工程监理</td>
				<td align="center">2014-05-21</td>
				<td align="center">未抽取</td>
			</tr>
			<tr target="slt_uid" rel="1">
				<td align="center"><input name="ids" value="1" type="checkbox"></td>
				<td align="center">2014JSDT05Z0002</td>
				<td align="lift">山东煤矿安全监察局业务保障单位业务用房项目电梯采购及安装</td>
				<td align="center">2014-05-31</td>
				<td align="center">已抽取</td>
			</tr>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
