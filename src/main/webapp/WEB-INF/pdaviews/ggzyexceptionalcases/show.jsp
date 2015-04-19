<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>废标处理</title>
<script type="text/javascript">
$().ready(function(){
	$(":input[type!=hidden]").each(function(){
		if($(this).val().length > 0){
			var text = $(this).val();
			$(this).after(text);
			$(this).remove();
		}
	})
	
});
</script>
</head>
<c:if test="${empty noticeTenders }">
<c:set value="${exceptionalCase.noticeTenders}" var="noticeTenders"/>
</c:if>
<c:if test="${not empty exceptionalCase.dealTime }">
<c:set var="sysdate_" value="${ exceptionalCase.dealTime.time}"/>
</c:if>
<div class="pageContent">
		<input type="hidden" name="id" value='<spring:eval expression="noticeTenders.id"/>' />
		<div class="pageFormContent" layoutH="58">
			<%@include file="form.jsp"%>
		</div>
</div>
