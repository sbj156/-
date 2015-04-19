<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('input').attr('readonly','true');
})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="prospectNoticeId" value="${ggzyprospectnotice.prospectNoticeId}"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>通知内容：</label>
			<input type="text" name="noticeContent" value="${mh:clob2String(ggzyprospectnotice.noticeContent)}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>通知发出时间：</label>
			<input type="text" name="publishTime" value="<fmt:formatDate value="${ggzyprospectnotice.publishTime.time }"></fmt:formatDate>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>