<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
//-->
</script>
<c:set value="${contextPath }/${business_ctx}/analysis/classify/area" var="listUrl_" />
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
				<td class="td1" rowspan="2"><label>交易金额(元)</label></td>
				<td class="td1" rowspan="2"><label>标段数</label></td>
				<td class="td1" colspan="${businessType.ggzyBusinessTypeWays.size() }"><label>交易方式</label></td>
			</tr>  
			<tr>
				<c:forEach items="${businessType.ggzyBusinessTypeWays}" var="item">
				<td class="td1" style="text-align: center">${item.businessWay.name }</a></td>
				</c:forEach>
			</tr>
			<tbody>       
			<c:forEach items="${data}" var="item" varStatus="status">
				<tr>
					<td class="td1">${item.name }</a></td>
					<td class="td2">${item.price }</td>
					<td class="td2">${item.total}</td>
					<c:forEach items="${businessType.ggzyBusinessTypeWays}" var="item_">
					<td class="td2" style="width: 200px"><spring:eval expression="item.${item_.businessWay.code }"/></td>
					</c:forEach>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br /></br>
	</div>
</div>	