<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageContent">
<form method="put" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="prospectRecordId" value="${ggzyProspectRecord.prospectRecordId }"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>踏勘单位代表姓名：</label>
			<input type="text" name="representative" value="${ggzyProspectRecord.representative}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>踏勘时间：</label>
			<input type="text" name="prospectTime" value="<fmt:formatDate value="${ggzyProspectRecord.prospectTime.time}"></fmt:formatDate>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>