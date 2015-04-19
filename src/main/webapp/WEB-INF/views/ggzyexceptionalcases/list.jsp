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
				<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_noticeTenders.notice.bidPro.basePro.proName"
					value="${param['search_LIKE_noticeTenders.notice.bidPro.basePro.proName'] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode" />：</label> <input type="text" name="search_LIKE_noticeTenders.notice.bidPro.proCode" value="${param['search_LIKE_noticeTenders.notice.bidPro.proCode'] }" /></li>
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
				rel="exception_show" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message
							code="ggzyexceptionalcase_showbtn" /> </span></a></li>
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="exception_deal" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message
							code="ggzyexceptionalcase_dealbtn" /> </span></a></li>
			<%-- <li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message
							code="ggzybasepro_addbtn" /> </span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span><spring:message
							code="ggzybasepro_updatebtn" /></span></a></li>
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzybasepro_deletebtn" /> </span></a></li> --%>
		</ul>
	</div>

	<table class="table" id="openning" layoutH="137" width="100%">
		<thead>
			<tr>
				<%@include file="/WEB-INF/views/ggzyevaluationreports/thead.jsp"%>
				<th width="100"><spring:message code="ggzyexceptionalcase_subtime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item_" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item_.id"/>">
					<c:set var="item" value="${item_.noticeTenders }"/>
					<%@include file="/WEB-INF/views/ggzyevaluationreports/tbody.jsp"%>
					<td><spring:eval expression="item_.subTime"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
