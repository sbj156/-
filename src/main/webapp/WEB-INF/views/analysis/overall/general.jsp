<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/overall/general" var="listUrl_" />
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
				<td class="td1" colspan="2"><label>类别</label></td>
				<%@include file="/WEB-INF/views/analysis/businesstype_td.jsp"%>
				<td class="td2" width="100"><label>合计</label></td>
			</tr>
			<tr>
				<td class="td1" colspan="2"><label>进场登记(项)</label></td>
				<mh:displayTd displayField="count" list="${register }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1" colspan="2"><label>发布公告(项)</label></td>
				<mh:displayTd displayField="count" list="${notice }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1" rowspan="2" width="100px"><label>开标完成</label></td>
				<td class="td1" width="100px"><label>标段（包）数</label></td>
				<mh:displayTd displayField="total" list="${openning }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1"><label>涉及废标标段（包）数</label></td>
				<mh:displayTd displayField="total" list="${openningException }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1" rowspan="3" width="100px"><label>评标完成</label></td>
				<td class="td1" width="100px"><label>标段（包）数</label></td>
				<mh:displayTd displayField="total" list="${eval }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1"><label>成交金额(元)</label></td>
				<mh:displayTd displayField="price" list="${eval }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1"><label>涉及废标标段（包）数</label></td>
				<mh:displayTd displayField="total" list="${evalException }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1" colspan="2"><label>发布结果公示(项)</label></td>
				<mh:displayTd displayField="total" list="${publicity }" showTotal="true" />
			</tr>
			<tr>
				<td class="td1" colspan="2"><label>中标通知书打印(项) </label></td>
				<mh:displayTd displayField="total" list="${resNotice }" showTotal="true" />
			</tr>
		</table>
		<br /></br>
	</div>
</div>