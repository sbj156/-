<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybidproes" page="${page}" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text"
					name="search_LIKE_basePro.proName" value="${param["search_LIKE_basePro.proName"] }" />
				</li>
				<li><label><spring:message code="ggzybidpro_procode" />：</label> <input type="text"
					name="search_LIKE_proCode" value="${param.search_LIKE_proCode }" />
				</li>
				<li><label>状态：</label> 
				<select class="combox" name="search_EQ_status">
					<option value="">---全部---</option>
					<option value="running" ${param.search_EQ_status eq 'running'?'selected':'' }>正常</option>
					<option value="paused" ${param.search_EQ_status eq 'paused'?'selected':'' }>暂停</option>
				</select>
				</li>
				<input type="hidden" name="nv_" value="${param.nv_ }"/>
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
			<shiro:hasPermission name="prostatus:修改状态">
				<li><a iconClass="application_edit" target="dialog" rel="change_status" width="1000" height="600"
					href="${contextPath }/${business_ctx}/ggzybidproes/{slt_uid}?status=paused&nv_=ggzybidproes/status" ><span>暂停</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="prostatus:修改状态">
				<li><a iconClass="application_edit" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzybidproes/status?status=running" title="确认要恢复正常状态?"><span>恢复</span></a></li>
			</shiro:hasPermission>
			<%-- <shiro:hasPermission name="prostatus:修改状态">
				<li><a iconClass="application_edit" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzybidproes/status?status=paused" title="确认要修改为暂停状态?"><span>暂停</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="prostatus:修改状态">
				<li><a iconClass="application_edit" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/ggzybidproes/status?status=running" title="确认要恢复正常状态?"><span>恢复</span></a></li>
			</shiro:hasPermission> --%>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<%-- <th width="100"><spring:message code="ggzybasepro_procode" /> </th>
				<th width="100"><spring:message code="ggzybidpro_bidprocode" /> </th> --%>
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybasepro_areacode" /></th>
				<th width="100"><spring:message code="ggzybasepro_proaddress" /></th>
				<th width="100"><spring:message code="ggzybasepro_contactperson" /></th>
				<th width="100"><spring:message code="ggzybasepro_contactway" /></th>
				<th width="100" orderField="createTime" class="${page.orderField eq 'createTime' ? page.orderDirection : ''}"><spring:message code="ggzybidpro_createtime" /></th>
				<th width="40">状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.bidProId}">
					<td><input name="ids" value="${item.bidProId}" type="checkbox"></td>
					<%-- <td>${item.basePro.proCode}</td>
					<td>${item.bidProCode}</td> --%>
					<td>${item.proCode}</td>
					<td>${item.basePro.proName}</td>
					<td>${item.basePro.area.name}</td>
					<td>${item.basePro.proAddress}</td>
					<td>${item.basePro.contactPerson}</td>
					<td>${item.basePro.contactWay}</td>
					<td><spring:eval expression="item.createTime"/></td>
					<td>${item.status eq 'paused'?'<font color=\'red\'>暂停</font>':'运行'}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
