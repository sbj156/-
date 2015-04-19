<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzyobjection_search" />：</label>
					<input type="text" name="search_LIKE_represtative"
					value="${param.search_LIKE_represtative }" /></li>
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
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message
							code="ggzyobjection_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message
							code="ggzyobjection_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message
							code="ggzyobjection_updatebtn" /></span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzyobjection_deletebtn" /> </span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzyobjection_objectionreason" /></th>
				<th width="100"><spring:message code="ggzyobjection_subtime" /></th>
				<th width="100"><spring:message code="ggzyobjection_represtative" /></th>
				<th width="100"><spring:message code="ggzyobjection_processingtime" /></th>
				<th width="100"><spring:message code="ggzyobjection_processiongresult" /></th>
				<th width="100"><spring:message code="ggzyobjection_feedbacktime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="items">
				<tr target="slt_uid" rel="${items.objectionId }">
				<td><input name="ids" value="${items.objectionId }" type="checkbox"></td>
				<td>${mh:clob2String(items.objectionReason)}</td>
				<td><fmt:formatDate value="${items.subTime.time }" pattern="yyyy-MM-dd"/> </td>
				<td>${items.represtative }</td>
				<td><fmt:formatDate value="${items.processingTime.time }" pattern="yyyy-MM-dd"/></td>
				<td>${mh:clob2String(items.processiongResult)}</td>
				<td><fmt:formatDate value="${items.feedbackTime.time }" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
