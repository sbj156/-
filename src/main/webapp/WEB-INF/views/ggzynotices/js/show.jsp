<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		var $pagerForm = $(".div_xmtj", $.pdialog.getCurrent());
		$($pagerForm).append($('#audit_content'));
		$(":input", $.pdialog.getCurrent()).readOnly();
	});
//-->
</script>
<div class="pageContent">
	<c:choose>
		<c:when test="${ggzyNotice.bidPro.businessWay.code eq 'Y' }">
			<%@include file="formy.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="form.jsp"%>
		</c:otherwise>
	</c:choose>
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