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
				<li><label><spring:message code="ggzybiddingsubject_subjectname" />：</label>
					<input type="text" name="search_LIKE_subjectName"
					value="${param.search_LIKE_subjectName }" /></li>
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
			<li><a iconClass="application_edit" target="navTab"
				rel="qua_list" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/ggzyqualifications?search_EQ_biddingSubject.biddingSubjectId={slt_uid}"><span>资质信息</span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span>删除</span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybiddingsubject_organizationcode" />
				</th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjectname" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjecttype" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjectcharge" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_country" /></th>
				<th width="100"><spring:message
						code="ggzybiddingsubject_unitcharacter" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_adminareacode" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
			<tr target="slt_uid" rel="${item.biddingSubjectId }">
				<td><input name="ids" value="${item.biddingSubjectId }" type="checkbox"></td>
				<td>${item.organizationCode }</td>
				<td>${item.subjectName}</td>
				<td>${item.subjectType.name}</td>
				<td>${item.subjectCharge}</td>
				<td>${item.country.name}</td>
				<td>${item.unitCharacter.name}</td>
				<td>${item.adminAreaCode.name}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
