<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_procode" />：</label> <input type="text"
					name="search_LIKE_proCode" value="${param.search_LIKE_proCode }" />
				</li>
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
			<shiro:hasPermission name="tender:save">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="tenders_show" minable='true' mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message code="ggzytenders_showbtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="tender:save">
				<li><a iconClass="application_add" target="dialog"
					rel="tenders_add" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message code="ggzytenders_addbtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="tender:edit:User拥有的资源">
				<li><a iconClass="application_edit" target="dialog"
					rel="tenders_update" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message code="ggzytenders_updatebtn"/></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="tender:delete:User拥有的资源">
				<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/${module_path}/delete"
					title="确认要删除?"><span><spring:message code="ggzytenders_deletebtn"/> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybasepro_procode" /> </th>
				<th width="100"><spring:message code="ggzytenders_tenderscode" /> </th>
				<th width="100"><spring:message code="ggzytenders_tendersname" /> </th>
				<th width="100"><spring:message code="ggzybidpublicity_biddingcandidate"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>${item.tenders.bidPro.bidProName}</td>
					<td>${item.tenders.bidPro.proCode}</td>
					<td>${item.tenders.tendersName}</td>
					<td>${item.tenders.tendersCode}</td>
					<td>${item.applyTender.apply.biddingSubject.subjectName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
