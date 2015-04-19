<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$(function(){
	$(".div_xmtj").append($("#append"));
	$(":input",$.pdialog.getCurrent()).readOnly();
})
//-->
</script>
<form method="PUT"
	action="${contextPath }/${business_ctx}/${module_path}"
	class="required-validate pageForm"
	onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
	<div class="pageContent">
		<c:set var="expertApply" value="${ggzyTenders.expertApply}" />
		<%@include file="recordform.jsp"%>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</form>

<div id="append">
	<table class="list" width="100%">
		<thead>
			<tr>
				<th width="40">序号</th>
				<th>专家姓名</th>
				<th width="20%">通知方式</th>
				<th width="20%">通知时间</th>
			</tr>
		</thead>
		<c:forEach items="${expertApply.assessmentExperts }" var="item"
			varStatus="status_">
			<tr>
				<td widtd="40">${status_.index + 1 }</td>
				<td>${empty item.expert?item.expertName:item.expert.name}</td>
				<td widtd="20%">${item.informWay }</td>
				<td widtd="20%"><spring:eval expression="item.informTime" /></td>
			</tr>
		</c:forEach>
	</table>
</div>
