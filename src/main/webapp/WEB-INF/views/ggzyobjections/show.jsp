<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
<!--
$().ready(function(){
	$('input').attr('readonly','true');
})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="objectionId" value="${ggzyObjection.objectionId}"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>依据和理由：</label>
			<input type="text" name="objectionReason" value="${mh:clob2String(ggzyobjection.objectionReason)}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>提交时间：</label>
			<input type="text" name="subTime" value="<fmt:formatDate value="${ggzyobjection.subTime.time }" pattern="yyyy-MM-dd"/>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>异议或投诉受理人：</label>
			<input type="text" name="represtative" value="${ggzyobjection.represtative }" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>受理时间：</label>
			<input type="text" name="processingTime" value="<fmt:formatDate value="${ggzyobjection.processingTime.time}" pattern="yyyy-MM-dd"/>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>处理结果：</label>
			<input type="text" name="processiongResult" value="${mh:clob2String(ggzyobjection.processiongResult)}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>异议与投诉内容：</label>
			<input type="text" name="objectionContent" value="${mh:clob2String(ggzyobjection.objectionContent)}" class="input-medium validate[maxSize[100]]" maxlength="100"/>
		</p>
		
		<p>
			<label>反馈时间：</label>
			<input type="text" name="feedbackTime" value="<fmt:formatDate value="${ggzyobjection.feedbackTime.time }" pattern="yyyy-MM-dd"/>" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		
		
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>