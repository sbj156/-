<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		$.ajax({
			url : '${contextPath}/business/ggzybusinesstypes/json/${param.businessTypeId}',
			success : function(data) {
				$.each(data.ggzyBusinessTypeMajors, function(i, item) {
					$('#majorType').append("<option value='"+ item.majorType.majorTypeId +"'>" + item.majorType.name + "</option>");
				});
				$.each(data.ggzyBusinessTypeWays, function(i, item) {
					$('#businessWay').append("<option value='"+ item.businessWay.businessWayId +"'>" + item.businessWay.name + "</option>");
				});
				$('#majorType').val('${ggzyBidPro.majorType.majorTypeId}');
				$('#businessWay').val('${ggzyBidPro.businessWay.businessWayId}');
			}
		});
	});
//-->
</script>
<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
<div class="pageContent">
	<%@include file="form.jsp" %>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>
</form>