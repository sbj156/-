<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		var $pagerForm = $(".div_xmtj", $.pdialog.getCurrent());
		$($pagerForm).append($('#audit_content'));
		$(":input",$.pdialog.getCurrent()).readOnly();
	});
//-->
</script>
<div class="pageContent">
	<%@include file="form.jsp"%>
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
<%@include file="/WEB-INF/views/ggzyauditreses/list.jsp"%>