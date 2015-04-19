<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('.tble_xmlb', navTab.getCurrentPanel()).rowspan({td:1});
})
//-->
</script>
<c:set value="${contextPath }/${business_ctx}/analysis/classify/majorbid" var="listUrl_" />
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
				<td class="td1" rowspan="2" style="width:100px">专业类型</td>
				<td class="td1" rowspan="2" style="width:70px;text-align: center">名次</td>
				<td class="td1" rowspan="2"><label>企业名称</label></td>
				<td class="td1" rowspan="2" rowspan="2" style="width:70px;text-align: center">标段数</td>
				<td class="td1" colspan="2" style="text-align: center">参与情况</td>
				<td class="td1" colspan="3" style="text-align: center">中标情况</td>
			</tr>  
			<tr>
				<td class="td1" style="text-align: center">参与次数</td>
				<td class="td1" style="text-align: center">参与率(%)</td>
				<td class="td1" style="text-align: center">中标次数</td>
				<td class="td1" style="text-align: center">中标率(%)</td>
				<td class="td1" style="text-align: center">中标金额(元)</td>
			</tr>
			<tbody>       
			<c:forEach items="${data}" var="item" varStatus="status">
				<tr>
					<td class="td1"><a target="navTab" rel="expert_amount_${item.business_type_id }" href="${contextPath }/${business_ctx}/analysis/classify/majorbid20?business_type_id=${item.business_type_id }&major_type_id=${item.major_type_id}">${item.name }<span style="display: none">企业中标情况</span></a></td>
					<td class="td2" style="width:70px">${item.rn }</td>
					<td class="td2">${item.subject_name }</td>
					<td class="td2">${item.total}</td>
					<td class="td2">${item.apply_amount }</td>
					<td class="td2">${item.apply_prob }</td>
					<td class="td2">${item.bid_amount }</td>
					<td class="td2">${item.prob }</td>
					<td class="td2">${item.bid_price }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br /></br>
	</div>
</div>	