<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/ggzywrongdatas/agencyorder" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>代理机构：</label> <input type="text" name="agencyName" value="${param['agencyName'] }"/></li>
				<li><label>修改时间：</label> <input type="text" name="startTime" value="${param['startTime'] }" onfocus="WdatePicker()" /></li>
				<li><label>至：</label> <input type="text" name="endTime" value="${param['endTime'] }" onfocus="WdatePicker()" /></li>
				<li><label>责任方：</label> 
				<form:select path="wrongData.dutyParty" id="dutyParty" itemLabel="dutyParty">
					<option value="0">请选择</option>
					<form:options items="${duties }"/>
				</form:select>
				</li>
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
				<td class="td1" ><label>序号</label></td>
				<td class="td1" "><label>代理机构</label></td>
				<td class="td1" "><label>修改次数</label></td>
			</tr>         
			<c:forEach items="${data}" var="item" varStatus="status">
				<tr>
					<td class="td2"><label>${status.index+1 }</label></td>
					<td class="td2" align="left">${item[0] }</td>
					<td class="td2">${item[1] }</td>
					<%-- <td class="td2">${item.amount}</td>
					<td class="td2">${item.amount_total}</td>
					<td class="td2">${item.amount_prob }</td>
					<td class="td2">${item.bid_price}</td>
					<td class="td2">${item.price_total}</td>
					<td class="td2">${item.price_prob }</td> --%>
				</tr>
			</c:forEach>
		</table>
		<br/><br/>
	</div>
	</div>