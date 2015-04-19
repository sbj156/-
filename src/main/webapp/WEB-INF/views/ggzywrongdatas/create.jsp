<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<div class="pageContent">
	<form commandName="entity" method="post"
		action="${contextPath }/${module_path }"
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
	</form>
</div>
