<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>审核公示</title>
</head>
<body>
	<div class="pageContent">
		<form:form commandName="ggzyTenders" method="PUT" action="${contextPath }/${business_ctx}/${module_path }/audit" class="required-validate pageForm" onsubmit="return validateCallback(this,subCallback,'确认要提交审核结果吗');">
			<%@include file="form.jsp"%>
			<%@include file="/WEB-INF/pdaviews/ggzyauditreses/show.jsp"%>
			<div class="formBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">确定</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form:form>
	</div>
</body>
</html>
<script type="text/javascript">
function subCallback(data){
	location.href="${backUrl}";
}
</script>