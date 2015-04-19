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

	var majorTypeId = $(this).attr("id").split("submit_")[1];
	var $majorTypeRow = $("#majorTypeRow_" + majorTypeId);
	var priority = parseInt($("#priority_" + majorTypeId).val());
	
	if (isNaN(priority) || priority > 999 || priority < 1) {
		alert("请输入1-999的数字!");
		return false;
	}  

	jQuery.ajax({
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        url: '${contextPath}/business/ggzybusinesstypes/typemajor/create?id.businessTypeId=${businessType.businessTypeId}&id.majorTypeId=' + majorTypeId + "&sortIndex=" + priority,
        error: function() { 
        	 alertMsg.error('分配角色失败！');
        },
        success: function() { 
        	// 删除已分配
			var $remove = $majorTypeRow.remove();
        	var name = $remove.find("td").eq(0).text();
	    	// 添加分配
			$("#has").append("<tr id=\"majorTypeRow_" + majorTypeId +"\"><td>" + name + "</td><td>" + priority + "</td><td><div class=\"button\"><div class=\"buttonContent\"><button id=\"submit_"+ majorTypeId +"\" class=\"cancleLink\">取消</button></div></div></td></tr>");
	    	$("#submit_" + majorTypeId).click(unLink);
			$('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(6).find("div").append(name + "  "); 
		}		
    });	
}
function unLink(){
	var majorTypeId = $(this).attr("id").split("submit_")[1];
	var $majorTypeRow = $("#majorTypeRow_" + majorTypeId);
	jQuery.ajax({
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        url: '${contextPath}/business/ggzybusinesstypes/typemajor/delete?businessTypeId=${businessType.businessTypeId}&majorTypeId=' + majorTypeId,
        error: function() { 
        	 alertMsg.error('分配角色失败！');
        },
        success: function() { 
        	// 删除已分配
			var $remove = $majorTypeRow.remove();
        	var name = $remove.find("td").eq(0).text();
	    	// 添加分配
			$("#unHas").append("<tr id=\"majorTypeRow_"+majorTypeId+"\"><td>" + name + "</td><td><input type=\"text\" id=\"priority_"+majorTypeId+"\" name=\"priority\" value=\"999\" maxlength=\"3\" class=\"priority_input\"></td><td><div class=\"button\"><div class=\"buttonContent\"><button id=\"submit_"+majorTypeId+"\" class=\"assignRole\">关联</button></div></div></td></tr>");
	    	$("#submit_"+majorTypeId).click(link);
			$('tr[class="selected"]', getCurrentNavtabRel()).find("td").eq(6).find("div").append(name + "  "); 
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
		<legend>已关联专业类型</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">专业类型</th>
					<th width="30%">优先级（数值越小，优先级越高）</th>
					<th width="30%">操作</th>
				</tr>
			</thead>
			<tbody id="has">
				<c:forEach var="item" items="${businessType.ggzyBusinessTypeMajors}">
				<tr id="majorTypeRow_${item.majorType.majorTypeId}">
					<td>${item.majorType.name}</td>
					<td>${item.sortIndex}</td>
					<td><div class="button"><div class="buttonContent"><button id="submit_${item.majorType.majorTypeId}" class="cancleLink">取消</button></div></div></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
	<fieldset>
		<legend>可关联专业类型</legend>
		<table class="list" width="100%">
			<thead>
				<tr>
					<th width="40%">专业类型</th>
					<th width="30%">优先级（数值越小，优先级越高）</th>
					<th width="30%">操作</th>
				</tr>
			</thead>
			<tbody id="unHas">
				<c:forEach var="item" items="${majorTypes}">
				<tr id="majorTypeRow_${item.majorTypeId}">
					<td>${item.name}</td>
					<td>
						<input type="text" id="priority_${item.majorTypeId}" name="priority" value="999" maxlength="3" class="priority_input">
					</td>
					<td><div class="button"><div class="buttonContent"><button id="submit_${item.majorTypeId}" class="assignRole">关联</button></div></div></td>
				</tr>	
				</c:forEach>
			</tbody>
		</table>
	</fieldset>
</div>