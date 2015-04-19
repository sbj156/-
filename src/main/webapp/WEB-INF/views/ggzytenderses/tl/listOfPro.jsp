<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="notice:show">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="lookup2organization_add" minable='true' mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message code="ggzytenders_showbtn"/></span></a></li>
			</shiro:hasPermission>
			<c:if test="${mh:decode(param.eventSource) ne 'ggzynotice_showbtn'}">
				<shiro:hasPermission name="notice:save">
					<li><a iconClass="application_add" target="dialog"
						rel="lookup2organization_add" mask="true" width="1000" height="600"
						href="${contextPath }/${business_ctx}/${module_path}?form" data='{"bidPro.bidProId":"${param["search_EQ_bidPro.bidProId"]}"}' name="ggzytenders_listofpro_addbtn"><span><spring:message code="ggzytenders_addbtn"/></span></a></li>
					<li><a iconClass="application_edit" target="dialog"
						rel="lookup2organization_edit" mask="true" width="1000" height="600"
						href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form" name="ggzytenders_listofpro_updatebtn"><span><spring:message code="ggzytenders_updatebtn"/></span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="tender:delete">
					<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
						href="${contextPath }/${business_ctx}/${module_path}/delete"
						title="确认要删除?" callback="reloadTenderses"><span><spring:message code="ggzytenders_deletebtn"/> </span></a></li>
				</shiro:hasPermission>
			</c:if>
		</ul>
	</div>

	<table class="list" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><!-- <input type="checkbox" group="ids"
					class="checkboxCtrl"> --></th>
				<th width="100"><spring:message code="ggzytenders_tenderscode" /> </th>
				<th width="100"><spring:message code="ggzytenders_tendersname" /></th>
			</tr>
		</thead>
		<tbody>
			<spring:eval expression="new java.util.ArrayList(list)" var="list"/>
			<c:forEach var="item" items="${notice.noticeTenderses }">
				<tr target="slt_uid" rel="${item.tenders.tendersId}">
					<td><input title="至少选择一个标段" checked="checked" name="tendersId" value="${item.tenders.tendersId}" class="validate[minCheckbox[1]] checkbox" type="checkbox">
					</td>
					<td>${item.tenders.tendersCode}</td>
					<td>${item.tenders.tendersName}</td>
				</tr>
				<spring:eval expression="list.remove(item.tenders)" var="_"/>
			</c:forEach>
		
			<c:forEach var="item" items="${list}" varStatus="curry">
				<tr target="slt_uid" rel="${item.tendersId}">
					<td><input title="至少选择一个标段" name="tendersId" value="${item.tendersId}" class="validate[minCheckbox[1]] checkbox" type="checkbox">
						<%-- <input type="hidden" name="tenderss[${curry.index }].tendersId" value="${item.tendersId }"/> --%>
					</td>
					<td>${item.tendersCode}</td>
					<td>${item.tendersName}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
