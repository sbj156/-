<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	var $pagerForm = $(".div_xmtj", $.pdialog.getCurrent());
	$(":input",$pagerForm).readOnly();
	$($pagerForm).append($('#audit_content'));
})
//-->
</script>
<div class="pageContent">
	<form:form commandName="ggzyTenders" method="PUT"
		action="${contextPath }/${business_ctx}/${module_path }/audit"
		class="required-validate pageForm"
		onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
		<%@include file="form.jsp"%>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form:form>
</div>
<%@include file="/WEB-INF/views/ggzyauditreses/show.jsp" %>