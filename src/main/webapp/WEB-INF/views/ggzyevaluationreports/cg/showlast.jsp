<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
$().ready(function(){
	$(":input").attr('readonly', true).removeAttr("onfocus").removeAttr("onblur");
})
</script>
<form method="POST" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?"dialogReloadNavTab":subCallbackFun});">
<input type="hidden" name="id" value="<spring:eval expression="noticeTenders.id"/>"/>

	<div class="pageContent">
		<%@include file="lastform.jsp"%>
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
