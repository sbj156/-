<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%--
list
update
form
create
delete
 --%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzyattachments" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>附件名称：</label> <input type="text"
					name="search_LIKE_attachmentName" value="${param.search_LIKE_attachmentName }" />
				</li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">搜索</button>
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
				<li><a iconClass="user_add" target="dialog"
					rel="lookup2organization_add" mask="true" width="530" height="330"
					href="${contextPath }/${business_ctx}/ggzyattachments?form"><span>添加附件</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:edit:User拥有的资源">
				<li><a iconClass="user_edit" target="dialog"
					rel="lookup2organization_edit" mask="true" width="530" height="330"
					href="${contextPath }/management/security/user/update/{slt_uid}"><span>编辑用户</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:delete:User拥有的资源">
				<li><a iconClass="user_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzyattachments/delete"
					title="确认要删除?"><span>删除用户</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="User:reset:User拥有的资源">
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
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="attachmentId"
					class="checkboxCtrl"></th>
				<th width="100">附件名称</th>
				<th width="130" orderField="uplodTime"
					class="${page.orderField eq 'uplodTime' ? page.orderDirection : ''}">创建时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${attachments}">
				<tr target="slt_uid" rel="${item.attachmentId}">
					<td><input name="ids" value="${item.attachmentId}" type="checkbox"></td>
					<td>${item.attachmentName}</td>
					<td>
					<fmt:formatDate value="${item.uplodTime.time}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<%-- <spring:eval expression="${item.uplodTime}"></spring:eval>--%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
