<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>

<form method="put" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateTenders(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
<div class="pageContent">
	<c:choose >
	<c:when test="${ggzyNotice.bidPro.businessWay.code eq 'Y' }">
	<%@include file="formy.jsp" %>
	</c:when>
	<c:otherwise>
	<%@include file="form.jsp" %>
	</c:otherwise>
	</c:choose>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>