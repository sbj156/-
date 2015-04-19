<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set value="${noticeTenders.expertApply.signed}" var="experts" />
<spring:eval expression="noticeTenders?.expertApply?.assessmentExperts.removeAll(experts)" var="__"/>
<%-- ${noticeTenders.expertApply.assessmentExperts } --%>

<style>
<!--
.priority_input {
	border: none;
	border-bottom: 1px solid gray;
	background: none;
	width: 50px;
	height: 22px;
	padding: 0px;
	float: left;
	margin-right: 10px;
	border-bottom: 1px solid gray;
	background: none;
	width: 50px;
	height: 22px;
	padding: 0px;
	float: left;
}
-->
</style>
<script type="text/javascript">
<!--
	jQuery(document).ready(function() {

		$(".assignRole").click(function() {
			var applyId = $(this).attr("applyId");

			jQuery.ajax({
				type : 'POST',
				dataType : "json",
				contentType : "application/json",
				url : '${contextPath }/${business_ctx}/ggzyassessmentexperts/json',
				data : JSON.stringify({
					'id' :applyId,
					'signed':true
				}),
				error : function() {
					alertMsg.error('签到异常');
				},
				success : function() {
					$.pdialog.reload("${contextPath }/${business_ctx}/ggzynoticetenderses/<spring:eval expression="noticeTenders.id"/>?nv_=ggzyevaluationreports/signlist");
				}

			});
		});

	});
//-->
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
		<fieldset>
			<legend>已签到专家</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th><spring:message code="ggzyexpert_name" /></th>
						<th width="20%">签到时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${experts}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${item.expertName}</td>
							<td><spring:eval expression="item.signTime"/> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
		<legend>未签到专家</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th><spring:message code="ggzyexpert_name" /></th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${noticeTenders.expertApply.assessmentExperts}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${item.expertName}</td>
							<td><shiro:hasPermission name="evaluation:sign"><div class="button">
									<div class="buttonContent">
										<c:choose>
											<c:when test="${signed}">
												<button applyId="${item.id }" class="assignRole">查看</button>
											</c:when>
											<c:otherwise>
											
												<button applyId="${item.id }" class="assignRole">签到</button>
											
											</c:otherwise>
										</c:choose>
									</div>
								</div></shiro:hasPermission></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</fieldset>		
	</div>
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