<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set value="${noticeTenders.notice.officialApply}" var="applys"/>
<style>
<!--
.priority_input {
	border: none; border-bottom : 1px solid gray; background : none; width :
	50px; height : 22px; padding : 0px; float : left;
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
	// top
	jQuery(document).ready(function() {

		$(".assignRole").click(function() {
			var applyId = $(this).attr("applyId");
			
			jQuery.ajax({
				type : 'POST',
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				url : '${contextPath }/${business_ctx}/ggzyapplytenders/json',
				data : JSON.stringify({
					'apply' : {
						applyId : applyId
					},
					'noticeTenders' : {
						id : {
								noticeId:'${noticeTenders.id.noticeId}',
								tendersId:'${noticeTenders.id.tendersId}'
							}
					}
				}),
				error : function() {
					alertMsg.error('签到异常');
				},
				success : function() {
					$.pdialog.reload("${contextPath }/${business_ctx}/ggzynoticetenderses/<spring:eval expression="noticeTenders.id"/>?nv_=ggzybidopenings/signlist");
				}

			});
		});

	});
//-->
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<div class="panel">
			<h1>项目基本信息</h1>
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
					<tr height=20>
						<td style="width: 20%"><spring:message code="ggzybidpro_procode" /> ：</td>
						<td style="width: 30%">${noticeTenders.tenders.bidPro.proCode }</td>
						<td style="width: 20%"><spring:message code="ggzybidpro_bidproname" />：</td>
						<td>${noticeTenders.tenders.bidPro.bidProName }</td>
					</tr>
					<tr height=20>
						<td>转让方：</td>
						<td>${noticeTenders.tenders.bidPro.tenderee.subjectName}</td>
						<td><spring:message code="ggzybidpro_agency" />：</td>
						<td>${noticeTenders.tenders.bidPro.agency.subjectName}</td>
					</tr>
					<tr height=20>
						<td><spring:message code="ggzytenders_tendersname" />：</td>
						<td>${noticeTenders.tenders.tendersName }</td>
						<td><spring:message code="ggzytenders_bidtime" />：</td>
						<td><spring:eval expression="noticeTenders.bidTime" /></td>
					</tr>
				</table>
			</div>
		</div>
		
		<fieldset>
			<legend>已签到企业(供应商)</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th>意向受让方</th>
						<th width="20%">签到时间</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody id="hasRoles">
					<c:forEach var="item" items="${noticeTenders.ggzyApplyTenders}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>${item.apply.biddingSubject.subjectName}</td>
							<td><spring:eval expression="item.signTime" /></td>
							<td><shiro:hasPermission name="bidopening:show">
									<a target="dialog" rel="apply_show" minable='true' mask="true" width="800" height="400" iconClass="application_view_detail" href="${contextPath }/${business_ctx}/ggzyapplys/${item.apply.applyId}" title="查看">查看</a></td>
							</shiro:hasPermission>
						</tr>
						<%-- 报名企业中移除已签到企业--%>
						<spring:eval expression="applys.remove(item.apply)" var="__" />
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>未签到企业(供应商)</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th>意向受让方</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${applys}" varStatus="status">
						<c:if test="${item.official }">
						<tr>
							<td>${status.index + 1}</td>
							<td>${item.biddingSubject.subjectName}</td>
							<td>
								<shiro:hasPermission name="bidopening:sign">
								<div class="button">
									<div class="buttonContent">
										<button applyId="${item.applyId }" class="assignRole">签到</button>
									</div>
								</div></td>
								</shiro:hasPermission>
						</tr>
						</c:if>
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