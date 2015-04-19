<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm action="${contextPath }/${business_ctx}/${module_path}/lookUpList" page="${page }" onsubmit="return dwzSearch(this);">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>
						<%-- <spring:message
							code="ggzybiddingsubject_subjectname" /> --%>名称：
				</label> <input type="text" name="search_LIKE_subjectName" value="${param.search_LIKE_subjectName}" /></li>
				<input type="hidden" name="search_LIKE_subjectType.code" value="${param['search_LIKE_subjectType.code']}" />
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
			<li><a iconClass="application_form_magnify" target="dialog" rel="biddingsubject_show" max="true" mask="true" width="800" height="330" href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}" date='{"code":"${param['search_LIKE_subjectType.code']}"}'><span><spring:message code="ggzybiddingsubject_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog" rel="lookup2organization_add" max="true" mask="true" width="800" height="330" href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message code="ggzybiddingsubject_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog" rel="qua_list" mask="true" width="800" height="600" href="${contextPath }/${business_ctx}/ggzyqualifications?search_EQ_biddingSubject.biddingSubjectId={slt_uid}"><span>资质信息</span></a></li>
		</ul>
	</div>
	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="100"><spring:message code="ggzybiddingsubject_organizationcode" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjectname" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjecttype" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_subjectcharge" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_country" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_unitcharacter" /></th>
				<th width="100"><spring:message code="ggzybiddingsubject_adminareacode" /></th>
				<th width="100">选择</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr target="slt_uid" rel="${item.biddingSubjectId }">
					<td>${item.organizationCode }</td>
					<td>${item.subjectName}</td>
					<td>${item.subjectType.name}</td>
					<td>${item.subjectCharge}</td>
					<td>${item.country.name}</td>
					<td>${item.unitCharacter.name}</td>
					<td>${item.adminAreaCode.name}</td>
					<td><a class="btnSelect" href="javascript:$.bringBack({biddingSubjectId:'${item.biddingSubjectId}', subjectName:'${item.subjectName}'},'biddingSubject')" title="查找带回">选择</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" targetType="dialog"/>
</div>
