<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/classify/businessagency" var="listUrl_" />
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
			<tr><td class="td1" colspan="8" style="text-align: center;">代理数量排名表</td></tr>
			<tr>
				<td class="td1" rowspan="2">名次</td>
				<td class="td1" rowspan="2"><label>代理机构名称</label></td>
				<td class="td1" colspan="3" style="text-align: center;">代理数量情况</td>
				<td class="td1" colspan="3" style="text-align: center;">代理金额情况</td>
			</tr>         
			<tr>
				<td class="td1" style="text-align: center;" width="150">总代理数量</td>
				<td class="td1" style="text-align: center;" width="150">标段总数量</td>
				<td class="td1" style="text-align: center;" width="150">比例(%)</td>
				<td class="td1" style="text-align: center;" width="150">代理成交额</td>
				<td class="td1" style="text-align: center;" width="150">总成交额</td>
				<td class="td1" style="text-align: center;" width="150">比例(%)</td>
			</tr>
			<c:forEach items="${data}" var="item" varStatus="status">
				<tr>
					<td class="td2">${item.rn }</td>
					<td class="td2">${item.subject_name }</td>
					<td class="td2">${item.amount}</td>
					<td class="td2">${item.amount_total}</td>
					<td class="td2">${item.amount_prob }</td>
					<td class="td2">${item.bid_price}</td>
					<td class="td2">${item.price_total}</td>
					<td class="td2">${item.price_prob }</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr><td class="td1" colspan="8" style="text-align: center;">代理金额排名表</td></tr>
			<tr>
				<td class="td1" rowspan="2">名次</td>
				<td class="td1" rowspan="2"><label>代理机构名称</label></td>
				<td class="td1" colspan="3" style="text-align: center;">代理金额情况</td>
				<td class="td1" colspan="3" style="text-align: center;">代理数量情况</td>
			</tr>         
			<tr>
				<td class="td1" style="text-align: center;" width="150">代理成交额</td>
				<td class="td1" style="text-align: center;" width="150">总成交额</td>
				<td class="td1" style="text-align: center;" width="150">比例(%)</td>
				<td class="td1" style="text-align: center;" width="150">总代理数量</td>
				<td class="td1" style="text-align: center;" width="150">标段总数量</td>
				<td class="td1" style="text-align: center;" width="150">比例(%)</td>
			</tr>
			<c:forEach items="${dataPrice}" var="item" varStatus="status">
				<tr>
					<td class="td2">${item.rn }</td>
					<td class="td2">${item.subject_name }</td>
					<td class="td2">${item.bid_price}</td>
					<td class="td2">${item.price_total}</td>
					<td class="td2">${item.price_prob }</td>
					
					<td class="td2">${item.amount}</td>
					<td class="td2">${item.amount_total}</td>
					<td class="td2">${item.amount_prob }</td>
				</tr>
			</c:forEach>
		</table>
		<br /></br>
	</div>
</div>