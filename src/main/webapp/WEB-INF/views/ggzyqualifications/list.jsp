<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }"
	onsubmit="return dwzSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
			<input type="hidden" name="search_EQ_biddingSubject.biddingSubjectId" value="${param['search_EQ_biddingSubject.biddingSubjectId'] }"/>
				<li><label><spring:message code="ggzyqualification_certificatenumber" />：</label>
					<input type="text" name="search_LIKE_certificateNumber"
					value="${param.search_LIKE_certificateNumber }" /></li>
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
							code="ggzyqualification_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?form&biddingSubjectId=${param['search_EQ_biddingSubject.biddingSubjectId'] }"><span><spring:message
							code="ggzyqualification_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message
							code="ggzyqualification_updatebtn" /></span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzyqualification_deletebtn" /> </span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100">招投标主体</th>
				<th width="100"><spring:message code="ggzyqualification_certificatenumber" /></th>
				<th width="100">资质序列</th>
				<th width="100">资质行业</th>
				<th width="100">资质专业</th>
				<th width="100"><spring:message code="ggzyqualification_qualificationgrade" /></th>
				<th width="100"><spring:message code="ggzyqualification_declareresponsible" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="items">
				<tr target="slt_uid" rel="${items.qualificationId }">
				<td><input name="ids" value="${items.qualificationId }" type="checkbox"></td>
				<td>${items.biddingSubject.subjectName}</td>
				<td>${items.certificateNumber}</td>
				<td>${items.quaSeq.name}</td>
				<td>${items.industry.name}</td>
				<td>${items.major.name}</td>
				<td>${items.grade.name}</td>
				<td>${items.declareResponsible}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
