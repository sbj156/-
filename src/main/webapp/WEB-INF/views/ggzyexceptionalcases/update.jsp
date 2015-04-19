<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	var div = $(".div_xmtj",$.pdialog.getCurrent());
	$(":input",div).readOnly();
	div.append($("#dealway"));
})
//-->
</script>
<c:if test="${empty noticeTenders }">
<c:set value="${exceptionalCase.noticeTenders}" var="noticeTenders"/>
</c:if>
<c:if test="${not empty exceptionalCase.dealTime }">
<c:set var="sysdate_" value="${ exceptionalCase.dealTime.time}"/>
</c:if>
<div class="pageContent">
	<form method="PUT" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
		<input type="hidden" name="id" value='<spring:eval expression="noticeTenders.id"/>' />
		<div class="pageFormContent" layoutH="58">
			<%@include file="form.jsp"%>
		</div>
		<div class="formBar">
			<ul>
				<c:if test="${empty  exceptionalCase.dealWay}">
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

<table style="vertical-align: middle" width="100%" id="dealway" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
	<tr>
		<td class="td1" width="25%"><label>处理方式：</label></td>
		<td class="td2" colspan="3"><mh:lookUpTree rootId="20" group="dealWay" value="${exceptionalCase.dealWay}"></mh:lookUpTree> </td>
		<td class="td1" width="25%"><label>处理时间：</label></td>
		<td class="td2" colspan="3"><input name="dealTime" value="<fmt:formatDate  value="${sysdate_}" pattern="yyyy-MM-dd HH:mm:ss"/>"/></td>
		
	</tr>
	
</table>