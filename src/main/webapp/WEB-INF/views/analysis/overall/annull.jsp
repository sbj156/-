<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/overall/annull" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>开始时间：</label> <input type="text" name="startTime" value="${param['startTime'] }" onfocus="WdatePicker()" /></li>
				<li><label>截止时间：</label> <input type="text" name="endTime" value="${param['endTime'] }" onfocus="WdatePicker()" /></li>
				<input type="hidden" name="nv_" value="${param['nv_'] }" />
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
<div class="pageContent " selector="h1" layoutH="42">
	<div class="pageFormContent" layoutH="58">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr>
				<td class="td1"><label></label></td>
				<td class="td1" colspan="2" style="text-align: center">开标情况</td>
				<td class="td1" colspan="2" style="text-align: center">评标情况</td>
			</tr>
			<tr>
				<td class="td1"><label>交易类别</label></td>
				<td class="td1"><label>标段(包)数量</label></td>
				<td class="td1"><label>废标标段（包）数 </label></td>
				<td class="td1"><label>标段(包)数量</label></td>
				<td class="td1"><label>废标标段（包）数 </label></td>
			</tr>
			<c:set value="0" var="opt" />
			<c:set value="0" var="opet" />
			<c:set value="0" var="et" />
			<c:set value="0" var="eet" />
			<c:forEach items="${businessTypes}" var="item" varStatus="status">
				<c:set value="${opt + openning[status.index].total }" var="opt" />
				<c:set value="${opet + openningException[status.index].total }" var="opet" />
				<c:set value="${et + eval[status.index].total  }" var="et" />
				<c:set value="${eet + evalException[status.index].total  }" var="eet" />
				<tr>
					<td class="td1"><label>${item.name }</label></td>
					<td class="td2">${openning[status.index].total }</td>
					<td class="td2">${openningException[status.index].total }</td>
					<td class="td2">${eval[status.index].total }</td>
					<td class="td2">${evalException[status.index].total }</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="td1"><label>合计</label></td>
				<td class="td2">${opt }</td>
				<td class="td2">${opet }</td>
				<td class="td2">${et }</td>
				<td class="td2">${eet }</td>
			</tr>
		</table>
		<br /></br>
	</div>
</div>