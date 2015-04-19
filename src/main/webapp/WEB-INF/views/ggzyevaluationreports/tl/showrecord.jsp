<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
$().ready(function(){
	$(":input").attr('readonly', true).removeAttr("onfocus").removeAttr("onblur");
})
</script>
<c:set var="expertApply" value="${ggzyTenders.expertApply}" />
<form method="POST" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
<input type="hidden" name="tenders.tendersId" value="${ggzyTenders.tendersId }"/>
<input type="hidden" name="id.tendersId" value="${ggzyTenders.tendersId }"/>
	<div class="pageContent">
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
