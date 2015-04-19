<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>废标处理</title>
</head>
<c:if test="${empty noticeTenders }">
<c:set value="${exceptionalCase.noticeTenders}" var="noticeTenders"/>
</c:if>
<c:if test="${not empty exceptionalCase.dealTime }">
<c:set var="sysdate_" value="${ exceptionalCase.dealTime.time}"/>
</c:if>
<div class="pageContent">
	<form method="PUT" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this,subCallback,'确认要提交审核结果吗');">
		<input type="hidden" name="id" value='<spring:eval expression="noticeTenders.id"/>' />
		<div class="pageFormContent" layoutH="58">
			<%@include file="form.jsp"%>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
<script type="text/javascript">
function subCallback(data){
	location.href="${backUrl}";
}
</script>
