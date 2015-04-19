<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/overall/businessfirst" var="listUrl_" />
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
				<td class="td1"><label>交易类别</label></td>
				<td class="td1"><label>企业名称</label></td>
				<td class="td1"><label>报名次数  </label></td>
				<td class="td1"><label>中标次数</label></td>
				<td class="td1"><label>中标率 (%)</label></td>
				<td class="td1"><label>中标金额（元） </label></td>
			</tr>         
			<c:forEach items="${first}" var="item" varStatus="status">
				<tr>
					<td class="td1"><label>${item.name }</label></td>
					<td class="td2">${item.subject_name }</td>
					<td class="td2">${item.apply_amount }</td>
					<td class="td2">${item.bid_amount }</td>
					<td class="td2">${item.prob }</td>
					<td class="td2">${item.bid_price }</td>
				</tr>
			</c:forEach>
		</table>
		<br /></br>
	</div>
</div>