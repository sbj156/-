<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/ggzybusinessways/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="businessWayId" value="${ggzyBusinessWay.businessWayId}"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label><spring:message code="ggzybusinessway_name"/> </label>
			<input type="text" name="name" value="${ggzyBusinessWay.name }" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label><spring:message code="ggzybusinessway_code" />：</label>
			<input type="text" name="code" value="${ggzyBusinessWay.code }" class="input-medium validate[required,minSize[1],maxSize[1]] required" maxlength="100"/>
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