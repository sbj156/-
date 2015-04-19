<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzyliteracyperformances" page="${page }"
	onsubmit="return navTabSearch(this)">
		
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><spring:message code="ggzyliteracyperformance_currencycodeamount" />： <input type="text"
					name="search_LIKE_currencyCodeAmount" value="${param.search_LIKE_currencyCodeAmount }" />
					<input type="hidden" name="search_LIKE_ggzyLiteracy.literacyId"
						value="${param['search_LIKE_ggzyLiteracy.literacyId'] }" />
					
				</li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit"><spring:message code="searchbtn"/> </button>
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
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?ggzyLiteracy.literacyId=${param['search_LIKE_ggzyLiteracy.literacyId']}"><span><spring:message
							code="ggzyliteracyperformance_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form&ggzyLiteracy.literacyId=${param['search_LIKE_ggzyLiteracy.literacyId']}"><span><spring:message
							code="ggzyliteracyperformance_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form&ggzyLiteracy.literacyId=${param['search_LIKE_ggzyLiteracy.literacyId']}"><span><spring:message
							code="ggzyliteracyperformance_updatebtn" /></span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzyliteracyperformance_deletebtn" /> </span></a></li>
		
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_contractamount" /></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_settlementamount" /></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_currencycodeamount" /></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_monetaryunit" /></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_contractsigningtime" /></th>
				<th width="100"><spring:message code="ggzyliteracyperformance_contractcompletiontime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="items" items="${list}">
				<tr target="slt_uid" rel="${items.performanceId }">
					<td><input name="ids" value="${items.performanceId }" type="checkbox"></td>
					<td>${items.contractAmount }</td>
					<td>${items.settlementAmount }</td>
					<td>${items.currencyCodeAmount }</td>
					<td>${items.monetaryUnit }</td>
					<td><fmt:formatDate value="${items.contractSigningTime.time }"></fmt:formatDate></td>
					<td><fmt:formatDate value="${items.contractCompletionTime.time }"></fmt:formatDate></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
