<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzyliteracyqualifications" page="${page }"
	onsubmit="return navTabSearch(this)">
		
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><spring:message code="ggzyliteracyqualification_literacygrade" />： <input type="text"
					name="search_LIKE_literacyGrade" value="${param.search_LIKE_literacyGrade }" />
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
							code="ggzyliteracyqualification_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form&ggzyLiteracy.literacyId=${param['search_LIKE_ggzyLiteracy.literacyId']}"><span><spring:message
							code="ggzyliteracyqualification_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message
							code="ggzyliteracyqualification_updatebtn" /></span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzyliteracyqualification_deletebtn" /> </span></a></li>
		
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzyliteracyqualification_literacyquasequence" /></th>
				<th width="100"><spring:message code="ggzyliteracyqualification_literacygrade" /></th>
				<th width="100"><spring:message code="ggzyliteracyqualification_quacertificatenumber" /></th>
				<th width="100"><spring:message code="ggzyliteracyqualification_recertificatenumber" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="items" items="${list}">
				<tr target="slt_uid" rel="${items.qualificationId }">
					<td><input name="ids" value="${items.qualificationId }" type="checkbox"></td>
					<td>${items.literacyQuaSequence }</td>
					<td>${items.literacyGrade }</td>
					<td>${items.quaCertificateNumber }</td>
					<td>${items.reCertificateNumber }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
