<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageContent">
<form method="put" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="biddingSubjectId" value="${ggzyBiddingSubject.biddingSubjectId}"/>
	<%@ include file="form.jsp" %>
</form>
</div>