<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$(":input",$.pdialog.getCurrent()).readOnly();
})
//-->
</script>
<c:if test="${empty noticeTenders }">
<c:set value="${exceptionalCase.noticeTenders}" var="noticeTenders"/>
</c:if>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<%@include file="form.jsp"%>
	</div>
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