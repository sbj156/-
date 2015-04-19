<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybusinessways" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text"
					name="search_LIKE_proName" value="${param.search_LIKE_proName }" />
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
			<shiro:hasPermission name="User:save">
				<li><a iconClass="application_add" target="dialog"
					rel="lookup2organization_add" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinessways?form"><span><spring:message code="ggzybusinessway_addbtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="application_edit" target="dialog"
					rel="lookup2organization_edit" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinessways/{slt_uid}?form"><span><spring:message code="ggzybusinessway_updatebtn"/></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:delete:User拥有的资源">
				<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzybusinessways/delete"
					title="确认要删除?"><span><spring:message code="ggzybusinessway_deletebtn"/> </span></a></li>
			</shiro:hasPermission>
			<%-- <shiro:hasPermission name="User:reset:User拥有的资源">
				<li class="line">line</li>
				<li><a iconClass="arrow_refresh" target="ajaxTodo"
					href="${contextPath }/management/security/user/reset/password/{slt_uid}"
					title="确认重置密码为123456?"><span>重置密码</span></a></li>
				<li><a iconClass="user_go" target="ajaxTodo"
					href="${contextPath }/management/security/user/reset/status/{slt_uid}"
					title="确认更新状态?"><span>更新状态</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:assign">
				<li class="line">line</li>
				<li><a iconClass="shield_add" target="dialog" mask="true"
					width="400" height="500"
					href="${contextPath }/management/security/user/lookup2create/userRole/{slt_uid}"><span>分配角色</span></a></li>
				<li><a iconClass="shield_delete" target="dialog" mask="true"
					width="400" height="500"
					href="${contextPath }/management/security/user/lookup2delete/userRole/{slt_uid}"><span>撤销角色</span></a></li>
			</shiro:hasPermission> --%>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybusinesstype_name" /> </th>
				<th width="100"><spring:message code="ggzybusinesstype_code" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.businessWayId}">
					<td><input name="ids" value="${item.businessWayId}" type="checkbox"></td>
					<td>${item.name}</td>
					<td>${item.code}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
