<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$(function(){
	$(":input",$.pdialog.getCurrent()).readOnly();
})

//-->
</script>
<form method="post"
	action="${contextPath }/${business_ctx}/${module_path}"
	class="required-validate pageForm"
	onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
	<div class="pageContent">
	<%@include file="extractform.jsp"%>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>
