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
				<li><label>项目名称：</label>
					<input type="text" name="search_LIKE_projectName"
					value="${param.search_LIKE_projectName }" /></li>
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
				rel="subject_view" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span>查看</span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="subject_add" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?form"><span>添加</span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="subject_edit" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span>修改</span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100">交易编号
				</th>
				<th width="100">项目名称</th>
				<th width="100">标段名称</th>
				<th width="100">原交易时间</th>
				<th width="100">最终交易时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
			<tr target="slt_uid" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.projectCode }</td>
				<td>${item.projectName}</td>
				<td>${item.tenderName}</td>
				<td>${item.oldBidTime}</td>
				<td>${item.bidTime}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
