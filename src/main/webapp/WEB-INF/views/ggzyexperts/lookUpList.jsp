<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}"
	page="${page }" onsubmit="return dwzSearch(this, 'dialog');">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><%-- <spring:message
							code="ggzybiddingsubject_subjectname" /> --%>姓名：</label> <input type="text"
					name="search_LIKE_name" value="${param.search_LIKE_name}" /></li>
			</ul>
			<input type="hidden" name="nv_" value="${param.nv_ }"/>
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
				rel="biddingsubject_show" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}" date='{"code":"${param['search_LIKE_subjectType.code']}"}'><span><spring:message
							code="ggzybiddingsubject_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" max="true" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message
							code="ggzybiddingsubject_addbtn" /> </span></a></li>
		</ul>
	</div>
	<table class="table" layoutH="137" width="100%">
		<thead>
			<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzyexpert_name" />
				</th>
				<th width="100"><spring:message code="ggzyexpert_sex" /></th>
				<th width="100"><spring:message code="ggzyexpert_birthday" /></th>
				<th width="100"><spring:message code="ggzyexpert_adminarea" /></th>
				<th width="100"><spring:message code="ggzyexpert_idtype" /></th>
				<th width="100"><spring:message
						code="ggzyexpert_idcode" /></th>
				<th width="100">选择</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr target="slt_uid" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.name }</td>
				<td>${item.sex.name}</td>
				<td><spring:eval expression="item.birthday"/></td>
				<td>${item.adminArea.name}</td>
				<td>${item.idType.name}</td>
				<td>${item.idCode}</td>
					<td><a class="btnSelect"
						href="javascript:$.bringBack({id:'${item.id}', name:'${item.name}'})"
						title="查找带回">选择</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
