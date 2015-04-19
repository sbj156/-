<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set value="${ggzyTenders.bidPro.ggzyApplies}" var="applys" />
<style>
<!--
.priority_input {
	border: none;
	border-bottom: 1px solid gray;
	background: none;
	width: 50px;
	height: 22px;
	padding: 0px;
	float: left;
	margin-right: 10px;
}
-->
</style>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
	$('#mainPanel').loadUrl("${contextPath }/${business_ctx}/${module_path}?form&tendersId=${param.tendersId}&nv_=ggzybidopenings/${noticeTenders.ggzyBidOpenings.openningType.formView}",{},function(){
		$(':input',$.pdialog.getCurrent()).readOnly();
	});
});
//-->
</script>
<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
	<input name="tenders.tendersId" type="hidden" value="${ggzyTenders.tendersId}" />
	<div class="pageContent">
		<div class="pageFormContent" layoutH="58">
			<div class="panel">
				<h1>项目基本信息</h1>
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
						<tr height=20>
							<td style="width: 20%"><spring:message code="ggzybidpro_procode" /> ：</td>
							<td style="width: 30%">${noticeTenders.tenders.bidPro.proCode }</td>
							<td style="width: 20%"><spring:message code="ggzybidpro_bidproname" />：</td>
							<td>${noticeTenders.tenders.bidPro.bidProName }</td>
						</tr>
						<tr height=20>
							<td><spring:message code="ggzybidpro_tenderee" />：</td>
							<td>${noticeTenders.tenders.bidPro.tenderee.subjectName}</td>
							<td><spring:message code="ggzybidpro_agency" />：</td>
							<td>${noticeTenders.tenders.bidPro.agency.subjectName}</td>
						</tr>
						<tr height=20>
							<td><spring:message code="ggzytenders_tendersname" />：</td>
							<td>${noticeTenders.tenders.tendersName }</td>
							<td><spring:message code="ggzytenders_bidtime" />：</td>
							<td><spring:eval expression="noticeTenders.bidTime" /></td>
						</tr>
						<tr height=20>
							<td><spring:message code="ggzybidopening_openningtypes" />：</td>
							<td>${noticeTenders.ggzyBidOpenings.openningType.name }</td>
							<td><spring:message code="ggzybidopening_priceunit"></spring:message>：</td>
							<td>${noticeTenders.ggzyBidOpenings.priceUnit.name }</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="mainPanel"></div>
			<div class="panel">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
					<tr>
						<td class="td1" width="16%"><label>唱标人：</label></td>
						<td class="td2" width="16%">${noticeTenders.ggzyBidOpenings.bidPerson }</td>
						<td class="td1" width="16%"><label>见证人：</label></td>
						<td class="td2" width="16%">${noticeTenders.ggzyBidOpenings.witness }</td>
						<td class="td1" width="16%"><label>监督人：</label></td>
						<td class="td2" width="16%">${noticeTenders.ggzyBidOpenings.supervisors }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<a class="icon" href="${contextPath }/${business_ctx}/${module_path}/exportExcel/<spring:eval expression="noticeTenders.id"/>" target="dwzExport" targetType="dialog"> <span>导出EXCEL</span>
						</a>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
</form>