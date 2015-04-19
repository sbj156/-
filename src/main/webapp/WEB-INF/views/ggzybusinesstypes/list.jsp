<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybusinesstypes" page="${page }"
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
					href="${contextPath }/${business_ctx}/ggzybusinesstypes?form"><span><spring:message code="ggzybusinesstype_addbtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="application_edit" target="dialog"
					rel="lookup2organization_edit" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinesstypes/{slt_uid}?form"><span><spring:message code="ggzybusinesstype_updatebtn"/></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:delete:User拥有的资源">
				<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzybusinesstypes/delete"
					title="确认要删除?"><span><spring:message code="ggzybusinesstype_deletebtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="application_edit" target="dialog"
					rel="lookup2organization_edit" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinesstypes/linkbusinessway/{slt_uid}"><span><spring:message code="ggzybusinesstype_linkwaybtn"/></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="application_edit" target="dialog"
					rel="lookup2organization_edit" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinesstypes/linkmajortype/{slt_uid}"><span><spring:message code="ggzybusinesstype_linkmajorbtn"/></span></a></li>
			</shiro:hasPermission>
			<li><a iconClass="application_edit" target="dialog"
					rel="bus_open_type" mask="true" width="800" height="330"
					href="${contextPath }/${business_ctx}/ggzybusinesstypes/{slt_uid}?form&nv_=ggzybusinesstypes/linkopenningtype"><span>关联唱标方式</span></a></li>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybusinesstype_name" /> </th>
				<th width="100"><spring:message code="ggzybusinesstype_code" /></th>
				<th width="100">父类型</th>
				<th width="100" orderField="sortIndex" class="${page.orderField eq 'sortIndex' ? page.orderDirection : ''}">排序</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.businessTypeId}">
					<td><input name="ids" value="${item.businessTypeId}" type="checkbox"></td>
					<td>${item.name}</td>
					<td>${item.code}</td>
					<td>${item.parent.name}</td>
					<td>${item.sortIndex}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
