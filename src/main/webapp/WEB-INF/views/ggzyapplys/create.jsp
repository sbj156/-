<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>

<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
<div class="pageContent">
	<%@include file="form.jsp" %>
	<c:if test="${ggzyNotice.noticeType.code eq '2' }">
	<input name="official" type="hidden" value="0"/>
	</c:if>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>