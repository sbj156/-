<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set var="listUrl_"
	value="${contextPath }/${business_ctx}/${module_path}" />
<dwz:paginationForm action="${listUrl_}" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzyapply_biddingsubject" />：</label>
					<input type="text" name="search_LIKE_biddingSubject.subjectName"
					value="${param['search_LIKE_biddingSubject.subjectName'] }" /></li>
				<input type="hidden" name="nv_" value="${param['nv_'] }" />
				<input type="hidden" name="search_EQ_notice.noticeId" value="${param['search_EQ_notice.noticeId'] }" />
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
			<shiro:hasPermission name="apply:show">
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="apply_show" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message
							code="ggzyapply_showbtn" /></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="apply:delete">
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzyapply_deletebtn" /> </span></a></li>
			</shiro:hasPermission>
			<li><a class="icon"
				href="${contextPath }/${business_ctx}/${module_path}/exportExcel/${param['search_EQ_notice.noticeId'] }"
				target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"> <span>导出EXCEL</span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /></th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100">意向受让方</th>
				<th width="100"><spring:message code="ggzyapply_contact" /></th>
				<th width="100"><spring:message code="ggzyapply_tel" /></th>
				<th width="100"><spring:message code="ggzyapply_operator" /></th>
				<th width="100"><spring:message code="ggzyapply_applytime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr target="slt_uid" rel="${item.applyId }">
					<td><input name="ids" value="${item.applyId}" type="checkbox"></td>
					<td>${item.notice.bidPro.proCode }</td>
					<td>${item.notice.bidPro.bidProName}</td>
					<td>${item.biddingSubject.subjectName}</td>
					<td>${item.contact}</td>
					<td>${item.tel}</td>
					<td>${item.operator}</td>
					<td><spring:eval expression="item?.applyTime" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<dwz:pagination page="${page }" />
</div>
