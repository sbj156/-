<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<style>
<!--
.priority_input {
	border:none;border-bottom:1px solid gray;background:none;width:50px;height:22px;padding: 0px;float: left;margin-right: 10px;
}
-->
</style>
<script type="text/javascript">
<!--
// top
function link(){

	var openningTypeId = $(this).attr("id").split("submit_")[1];
	var $openningTypeRow = $("#openTypeRow_" + openningTypeId);
	var priority = parseInt($("#priority_" + openningTypeId).val());
	
	if (isNaN(priority) || priority > 999 || priority < 1) {
		alert("请输入1-999的数字!");
		return false;
	}  

	jQuery.ajax({
        type: 'POST',
        dataType: "json",contentType:"application/json" ,
        url: '${contextPath }/${business_ctx}/ggzybusinesstypeopenningtypes/json',
        data:JSON.stringify({
        	id:{
        		businessTypeId:'${ggzyBusinessType.businessTypeId}',
        		openningTypeId:openningTypeId
        	},
        	sortIndex:priority
        }),
        error: function() { 
        	 alertMsg.error('分配失败');
        },
        success: function() { 
        	$.pdialog.reload('${contextPath }/${business_ctx}/ggzybusinesstypes/${ggzyBusinessType.businessTypeId}?form&nv_=ggzybusinesstypes/linkopenningtype');
		}		
    });	
}
function unLink(){
	var businessWayId = $(this).attr("id").split("submit_")[1];
	var $businessWayRow = $("#businessWayRow_" + businessWayId);
	jQuery.ajax({
        type: 'DELETE',
        dataType: "json",contentType:"application/json" ,
        url: '${contextPath }/${business_ctx}/ggzybusinesstypeopenningtypes/json/' + businessWayId,
        error: function() { 
        	 alertMsg.error('取消失败！');
        },
        success: function() { 
        	$.pdialog.reload('${contextPath }/${business_ctx}/ggzybusinesstypes/${ggzyBusinessType.businessTypeId}?form&nv_=ggzybusinesstypes/linkopenningtype');
		}		
    });	

}
jQuery(document).ready(function(){
     
    $(".assignRole").click(link);
    
    $(".cancleLink").click(unLink);
    
});
//-->
</script>
<div class="pageContent" layoutH="0" >

	<fieldset>
		<legend>已关联交易方式</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">交易方式</th>
					<th width="30%">优先级（数值越小，优先级越高）</th>
					<th width="30%">操作</th>
				</tr>
			</thead>
			<tbody id="has">
				<c:forEach var="item" items="${ggzyBusinessType.openningTypes}">
				<tr id="businessWayRow_${item.openningType.id}">
					<td>${item.openningType.name}</td>
					<td>${item.sortIndex}</td>
					<td><div class="button"><div class="buttonContent"><button id="submit_<spring:eval expression="item.id"/>" class="cancleLink">取消</button></div></div></td>
				</tr>
				<spring:eval expression="openningTypes.remove(item.openningType)" var="__"/>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<fieldset>
		<legend>可关联交易方式</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">交易方式</th>
					<th width="30%">优先级（数值越小，优先级越高）</th>
					<th width="30%">操作</th>
				</tr>
			</thead>
			<tbody id="unHas">
				<c:forEach var="item" items="${openningTypes}">
				<tr id="openTypeRow_${item.id}">
					<td>${item.name}</td>
					<td>
						<input type="text" id="priority_${item.id}" name="priority" value="999" maxlength="3" class="priority_input">
					</td>
					<td><div class="button"><div class="buttonContent"><button id="submit_${item.id}" class="assignRole">关联</button></div></div></td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</div>