<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/classify/areaprice" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>业务类型：</label>
				<select class="combox" name="business_type_id">
					<c:forEach items="${businessTypes }" var="item">
					<option value="${item.businessTypeId}" ${param.business_type_id eq item.businessTypeId? "selected":"" }>${item.name }</option>
					</c:forEach>
				</select>
				</li>
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
				<td class="td1" rowspan="2">区域</td>
				<td class="td1" colspan="3" style="text-align: center;">标段数量</td>
				<td class="td1" colspan="4" style="text-align: center;">节约情况</td>
			</tr>         
			<tr><!-- style="text-align: center;" width="150"-->
				<td class="td1" style="text-align: center;">标段数量</td>
				<td class="td1" style="text-align: center;">标段总数量</td>
				<td class="td1" style="text-align: center;">比例(%)</td>
				<td class="td1" style="text-align: center;">总中标金额(元)</td>
				<td class="td1" style="text-align: center;">总估算金额(元)</td>
				<td class="td1" style="text-align: center;">节约金额(元)</td>
				<td class="td1" style="text-align: center;">节约率(%)</td>
			</tr>
			<c:forEach items="${data}" var="item" varStatus="status">
				<tr>
					<td class="td2" style="text-align: right;">${item.name }</td>
					<td class="td2">${item.mtotal }</td>
					<td class="td2">${item.total}</td>
					<td class="td2">${item.amount_prob }</td>
					<td class="td2">${item.bid_price}</td>
					<td class="td2">${item.compute_price}</td>
					<td class="td2">${item.save_price}</td>
					<td class="td2">${item.price_prob }</td>
				</tr>
			</c:forEach>
		</table>
		<br /></br>
	</div>
</div>