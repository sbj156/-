<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>依据和理由：</label>
			<input type="text" name="objectionReason" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>提交时间：</label>
			<input type="text" name="subTime" class="input-medium validate[maxSize[100]]" maxlength="100"/>
		</p>
		<p>
			<label>异议或投诉受理人：</label>
			<input type="text" name="represtative" class="input-medium validate[required,maxSize[50]] required" maxlength="128"/>
		</p>
		<p>
			<label>受理时间：</label>
			<input type="text" name="processingTime" class="input-medium validate[maxSize[32]] " maxlength="32"/>
		</p>		
		<p>
			<label>处理结果：</label>
			<input type="text" name="processiongResult" class="input-medium validate[maxSize[100]] " maxlength="100" />
		</p>
		<p>
			<label>反馈时间：</label>
			<input type="text" name="feedbackTime" class="input-medium validate[maxSize[32]]" maxlength="32"/>
		</p>
		<p>
			<label>异议与投诉内容：</label>
			<input type="text" name="objectionContent" class="input-medium validate[maxSize[100]]" maxlength="128"/>
		</p>		
		
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
