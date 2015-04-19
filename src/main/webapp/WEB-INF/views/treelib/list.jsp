<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<a id="refreshJbsxBox2organizationTree" rel="jbsxBox2organizationTree${param.rootId}" target="ajax" href="${contextPath}/business/treelib/tree/${param.rootId}?rootId=${param.rootId}" style="display:none;"></a>

<%-- <dwz:paginationForm action="${contextPath}/business/treelib/list/${parentggzyAreaId}?rootId=${param.rootId }" page="${page }" onsubmit="return divSearch(this, 'jbsxBox2organizationList');">
	<input type="hidden" name=search_LIKE_name value="${param.search_LIKE_name }"/>
</dwz:paginationForm> --%>
<dwz:paginationForm action="${contextPath}/business/treelib/list/${parentggzyAreaId}?rootId=${param.rootId }" page="${page }" 
	onsubmit="return divSearch(this, 'jbsxBox2organizationList${param.rootId}');">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label><spring:message code="tree${param.rootId}"/>名称：</label>
					<input type="text" name=search_LIKE_name value="${param.search_LIKE_name }"/>
				</li>
			</ul>
			<div class="subBar">
				<ul>						
					<li><div class="button"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		<shiro:hasPermission name="area:save">
			<li><a iconClass="group_add" target="dialog" mask="true" width="530" height="260" href="${contextPath}/business/treelib/create/${parentggzyAreaId}?rootId=${param.rootId}"><span>添加<spring:message code="tree${param.rootId}"/></span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Organization:edit">
			<li><a iconClass="group_edit" target="dialog" mask="true" rel="lookupParent2org_edit" width="530" height="300" href="${contextPath}/business/treelib/update/{slt_uid}?rootId=${param.rootId}"><span>编辑<spring:message code="tree${param.rootId}"/></span></a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="Organization:delete">
			<li><a iconClass="group_delete" target="ajaxTodo" callback="dialogReloadRel2Org" href="${contextPath}/business/treelib/delete/{slt_uid}?rootId=${param.rootId}" title="确认要删除该<spring:message code="tree${param.rootId}"/>?"><span>删除<spring:message code="tree${param.rootId}"/></span></a></li>
		</shiro:hasPermission>
		</ul>
	</div>
	<table class="table" layoutH="142" width="100%" rel="jbsxBox2organizationList" >
		<thead>
			<tr>
				<th width="150"><spring:message code="tree${param.rootId}"/>名称</th>
				<th width="100"><spring:message code="tree${param.rootId}"/>代码</th>
				<th width="60">优先级</th>
				<th>描述</th>
				<th width="150">父<spring:message code="tree${param.rootId}"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${ggzyAreas}">
			<tr target="slt_uid" rel="${item.id}">
				<td><%-- <a href="${contextPath}/business/treelib/list/${item.id}?rootId=${param.rootId }" target="ajax" rel="jbsxBox2organizationList"> --%>${item.name}<!-- </a> --></td>
				<td>
					${item.code }
				</td>
				<td>${item.priority}</td>
				<td>${item.description}</td>
				<td>${item.parent.name}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 分页 -->
	<dwz:pagination page="${page }" rel="jbsxBox2organizationList" onchange="navTabPageBreak({numPerPage:this.value}, 'jbsxBox2organizationList')"/>
</div>