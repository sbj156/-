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

		
		$("[name='scoreTypeId']").change(function(){
			var s = $("#coef_dis");
			if($("[name='scoreTypeId']").val()==27143){
				s.css("display","block");
			}else{
				s.css("display","none");
			}
		});
		
		
		$(".assignRole").click(function() {
			//var scoreTypeId = $(this).attr("id").split("submit_")[1];
			var scoreTypeId=$(":input[name='scoreTypeId']").val();
			var sortIndex = $(":input[name='sortIndex']").val();
			
			var data_ = {
				"id" : {
					tendersId : '${noticeTenders.id.tendersId}',
					noticeId : '${noticeTenders.id.noticeId}',
					scoreTypeId : scoreTypeId
				},
				sortIndex : sortIndex,
				coef: $(":input[name='coef']").val(),
				scoreTypePerson:$(":input[name='scoreType_person']").val(),
				coefPerson:$(":input[name='coef_person']").val()
				
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
		<legend>已确认评标办法</legend>
		<table class="list" width="100%">
			<tbody id="hasRoles">
				<c:forEach var="item" items="${noticeTenders.scoreTypes}">
					<tr>
						<td>评分办法：</td>
						<td>${item.scoreType.name}</td>
						<td>评标办法抽取人：</td>
						<td>${item.scoreTypePerson}</td>
					</tr>
					<c:if test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
					<tr>
						<td>系数：</td>
						<td>${item.coef}</td>
						<td>调整系数抽取人:</td>
						<td>${item.coefPerson}</td>
					</tr>
					</c:if>
					<spring:eval expression="scoreTypes.remove(item.scoreType)" var="__" />
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<c:if test="${noticeTenders.scoreTypes.size()<=0}">
	<fieldset>
		<legend>评标办法</legend>
		<table class="list" width="100%">
			<tbody>
				<tr>
					<td>类型名称:</td>
					<td colspan='3'>
						<select name="scoreTypeId" class="required validate[required]">
							<option>----请选择----</option>
						<c:forEach var="item" items="${scoreTypes}">
							<option value="${ item.id }">${ item.name }</option>
						</c:forEach>
						</select>
					</td>
					
				</tr>
				<tr  id="coef_dis" style="display:none" >
					<td colspan='4'><span>评标系数:<select name='coef'>
							<option value='-0.2'>-0.2</option>
							<option value='-0.1'>-0.1</option>
							<option value='0.0'>0.0</option>
							<option value='0.1'>0.1</option>
							<option value='0.2'>0.2</option>
							<option value='0.3'>0.3</option>
							<option value='0.4'>0.4</option>
							<option value='0.5'>0.5</option>
						</select></span></td>
				</tr>
				<tr>
					<td>评标办法抽取人:</td>
					<td><input type="text" name="scoreType_person"/></td>
					<td>调整系数抽取人:</td>
					<td><input type="text" name="coef_person"/></td>
				</tr>
				<tr><td colspan=4 align="center"><button class="assignRole">确认评标办法</button></td></tr>
			</tbody>
		</table>
	</fieldset>
	</c:if>
</div>