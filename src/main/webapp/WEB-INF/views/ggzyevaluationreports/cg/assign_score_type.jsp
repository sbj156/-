<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
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
}
-->
</style>
<script type="text/javascript">
<!--
	// top
	jQuery(document).ready(function() {

		$(".assignRole").click(function() {
			var scoreTypeId = $(this).attr("id").split("submit_")[1];
			var sortIndex = $(":input[name='sortIndex']", $(this).parents("tr")).val();
			var data_ = {
				"id" : {
					tendersId : '${noticeTenders.id.tendersId}',
					noticeId : '${noticeTenders.id.noticeId}',
					scoreTypeId : scoreTypeId
				},
				sortIndex : sortIndex
			};
			jQuery.ajax({
				type : 'POST',
				dataType : "json",
				contentType : "application/json",
				url : '${contextPath}/business/ggzytendersscoretypes/json',
				error : function() {
					alertMsg.error('分配角色失败！');
				},
				data : JSON.stringify(data_),
				success : function() {
					$.pdialog.reload("${contextPath }/${business_ctx}/ggzynoticetenderses/<spring:eval expression="noticeTenders.id"/>?form&scoreTypeParentId=${param.scoreTypeParentId}&nv_=${param.nv_}&businessTypeId=${param.businessTypeId}");
				}
			});
		});

	});
//-->
</script>
<div class="pageContent" layoutH="0">
	<fieldset>
		<legend>已分配类型</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">类型名称</th>
					<th width="60%">排序优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody id="hasRoles">
				<c:forEach var="item" items="${noticeTenders.scoreTypes}">
					<tr>
						<td>${item.scoreType.name}</td>
						<td>${item.sortIndex}</td>
					</tr>
					<spring:eval expression="scoreTypes.remove(item.scoreType)" var="__" />
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<c:if test="${noticeTenders.scoreTypes.size()<=0}">
	<fieldset>
		<legend>未分配类型</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">类型名称</th>
					<th width="60%">排序优先级（数值越小，优先级越高）</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${scoreTypes}" varStatus="status_">
					<tr id="userRoleRow_${item.id}">
						<td>${item.name}</td>
						<td><input type="text" name="sortIndex" value="${item.priority }" maxlength="3" class="priority_input">
							<div class="button">
								<div class="buttonContent">
									<button id="submit_${item.id}" class="assignRole">确认</button>
								</div>
							</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	</c:if>
</div>