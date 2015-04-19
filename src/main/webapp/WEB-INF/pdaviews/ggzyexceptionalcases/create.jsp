<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>废标处理</title>
</head>
<body>
	<c:set value="${noticeTenders.exceptionalCase }" var="exceptionalCase" />
	<c:if test="${not empty  exceptionalCase}">
		<script type="text/javascript">
		<!--
			$().ready(function() {
				$(":input", $.pdialog.getCurrent()).readOnly();
			})
		//-->
		</script>
	</c:if>
	<div class="pageContent">
		<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
			<input type="hidden" name="id" value='<spring:eval expression="noticeTenders.id"/>' />
			<div class="pageFormContent" layoutH="58">
				<%@include file="form.jsp"%>
			</div>
			<div class="formBar">
				<ul>
					<c:if test="${empty  exceptionalCase}">
						<li><div class="button">
								<div class="buttonContent">
									<button type="submit">确定</button>
								</div>
							</div></li>
					</c:if>
					<li><div class="button">
							<div class="buttonContent">
								<button type="button" class="close">关闭</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>