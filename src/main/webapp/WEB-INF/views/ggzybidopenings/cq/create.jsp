<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<style>
<!--
.priority_input {
	border:none;border-bottom:1px solid gray;background:none;width:50px;height:22px;padding: 0px;float: left;margin-right: 10px;
}
-->
</style>
<script type="text/javascript">
<!--
// top
jQuery(document).ready(function(){
     
	$("select[name='openningType.id']").bind("change", function(){
		if($(this).val() > 0){
			var nv_ = $(this).find("option:selected").attr("formView");
			$('#mainPanel').loadUrl("${contextPath }/${business_ctx}/${module_path}?form&tendersId=${param.tendersId}&nv_=ggzybidopenings/" + nv_+"&businessTypeId=${param.businessTypeId}");
		}else{
			$('#mainPanel').html('');
		}
	});
    
});
//-->
</script>
<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
<input name="id" type="hidden" value="<spring:eval expression="noticeTenders.id"/>"/>
<div class="pageContent">
<div class="pageFormContent" layoutH="58">
	<div class="panel" >
		<h1>项目基本信息</h1>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tble_masge">
				<tr height=20>
					<td style="width: 20%"><spring:message
							code="ggzybidpro_procode" /> ：</td>
					<td style="width: 30%">${noticeTenders.tenders.bidPro.proCode }</td>
					<td style="width: 20%"><spring:message
							code="ggzybidpro_bidproname" />：</td>
					<td>${noticeTenders.tenders.bidPro.bidProName }</td>
				</tr>
				<tr height=20>
					<td>转让方：</td>
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
					<td><spring:message code="ggzybidopening_openningtypes"/>：</td>
					<td>
						<div>
						<select name="openningType.id" class="combox">
							<option>--请选择--</option>
							<c:forEach items="${openningTypes }" var="item">
							<option formView="${item.formView}" value="${item.id}">${item.name }</option>
							</c:forEach>
						</select> 
						</div>
					</td>
					<td><div style="display:none"><spring:message code="ggzybidopening_priceunit"></spring:message>：</div></td>
					<td>
						<div style="display:none">
			<input type="hidden" name="pricUnit.id" value="12425"/>
			<input class="validate[required] required" name="pricUnit.name" type="text" readonly="readonly" value="元" style="width: 140px;"/>
			<a class="btnLook" href="${contextPath}/business/treelib/lookupParent/8?rootId=8" lookupGroup="pricUnit" mask="true" title="寻找金额单位" width="400">查找带回</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
		</div>
		
		<div id="mainPanel"></div>
		<div class="panel">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
				<tr>
					<td class="td1" width="16%"><label>唱标人：</label></td>
					<td class="td2" width="16%"><input type="text" name="bidPerson" value="${noticeTenders.ggzyBidOpenings.bidPerson }" class="validate[maxSize[50],required] required"/></td>
					<td class="td1" width="16%"><label>见证人：</label></td>
					<td class="td2" width="16%"><input type="text" name="witness" value="${noticeTenders.ggzyBidOpenings.witness }" class="validate[maxSize[50],required] required"/></td>
					<td class="td1" width="16%"><label>监督人：</label></td>
					<td class="td2" width="16%"><input type="text" name="supervisors" value="${noticeTenders.ggzyBidOpenings.supervisors }" class="validate[maxSize[50],required] required"/></td>
				</tr>
			</table>
		</div>

		</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>