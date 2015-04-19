<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$(":input", $.pdialog.getCurrent()).readOnly();
	var selects = $('.select','.pageContent');
	$.each(selects, function(i, item){
		var select_ = $(item).next();
		if(select_){
			select_.show();
			$(item).hide();
		}
	});
});
//-->
</script>
<div class="pageContent">
	<%@include file="form.jsp" %>
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>