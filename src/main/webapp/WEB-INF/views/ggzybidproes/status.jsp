<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp" %>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/${module_path }/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<div class="pageFormContent" layoutH="58">
	<div class="panel" defH="55">
		<h1>项目基本信息</h1>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tble_masge">
				<tr>
					<td height=40 style="width: 15%"><spring:message code="ggzybidpro_procode"/> ：</td>
					<td style="width: 35%">${ggzyBidPro.proCode }</td>
					<td style="width: 15%"><spring:message code="ggzybasepro_proname"/>：</td>
					<td>${ggzyBidPro.bidProName}</td>
				</tr>
				<tr>
					<td><spring:message code="ggzybidpro_tenderee"/>：</td>
					<td>${ggzyBidPro.tenderee.subjectName }</td>
					<td><spring:message code="ggzybidpro_agency"/>：</td>
					<td>${ggzyBidPro.agency.subjectName }</td>
				</tr>
			</table>

		</div>
</div>
	<input type="hidden" name="bidPro.bidProId" value="${ggzyBidPro.bidProId}" />
	<div class="div_xmtj">
	<div style="line-height: 30px">修改原因</div>
	<textarea rows="15" class="editor" cols="120"></textarea>
	</div>
</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>