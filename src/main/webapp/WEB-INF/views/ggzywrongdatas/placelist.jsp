<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${module_path}" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_procode" />：</label> <input type="text"
					name="search_LIKE_projectCode" value="${param['search_LIKE_projectCode'] }" />
				</li>
				<input type="hidden" name="search_ISNULL_oldBidTime" value="0"/>
				<input type="hidden" name="nv_" value="${param['nv_'] }"/>
				
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit"><spring:message code="searchbtn"/></button>
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
					rel="tenders_show" minable='true' mask="true" width="1000" height="600"
					href="${contextPath }/${module_path}/{slt_uid}"><span>查看 </span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybasepro_procode" /> </th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100">代理机构</th>
				<th width="100">修改后开标时间</th>
				<th width="100">原开标时间</th>
				<th width="100">修改时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>${item.projectCode}</td>
					<td>${item.projectName}</td>
					<td>${item.agency}</td>
					<td><fmt:formatDate value="${item.bidTime}" pattern="yyyy-MM-dd HH:mm"/> </td>
					<td><fmt:formatDate value="${item.oldBidTime}" pattern="yyyy-MM-dd HH:mm"/> </td>
					<td><fmt:formatDate value="${item.changeDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
