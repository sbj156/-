<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('input').attr('readonly','true');
})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>踏勘单位代表姓名：</label>
			<input type="text" name="representative" value="${ggzyprospectrecord.representative}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>踏勘时间：</label>
			<input type="text" name="prospectTime" value="<fmt:formatDate value="${ggzyprospectrecord.prospectTime.time}"></fmt:formatDate>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>