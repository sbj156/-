<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<form method="POST" action="${contextPath }/${business_ctx}/ggzybiddingcandidates/confirm" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun},'确认要选择中标人吗,确认后将不能更改!');">
<input type="hidden" name="noticeTendersId" value="<spring:eval expression="noticeTenders.id"/>"/>
<input type="hidden" name="id" value="<spring:eval expression="noticeTenders.id"/>"/>
	<div class="pageContent">
		<%@include file="cadidateform.jsp"%>
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
	</div>
</form>
