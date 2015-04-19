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
				<input type="hidden" value="${param.nv_ }" name="nv_"/>
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
			<li><a iconClass="application_form_magnify" target="dialog" rel="show_history" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzybidproes/{slt_uid}?nv_=ggzybidproes/history"><span>查看历程 </span></a></li>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
