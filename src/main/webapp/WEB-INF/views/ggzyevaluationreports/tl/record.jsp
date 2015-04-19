<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$(function(){
	//$(".div_xmtj").append($("#append"));
	//$(":input",".div_xmtj").removeAttr("onfocus").attr("readonly",true);
	$('.expertScore').bind("blur", function(){
		if($(this).val().trim().length <= 0 || $(this).val().trim() == $(this).attr('oldValue'))
			return;
		var applyTenderId = ($(this).parents("tr").attr('applyTenderId'));
		var expertId = $(this).attr("expertId");
		var data_ = {
				"applyTender" : {
					"applyTenderId" : applyTenderId
				},
				"expert" : {
					"id" : expertId
				},
				score:$(this).val().trim()
			};
		jQuery.ajax({
	        type: 'POST',
	        dataType: "json",contentType:"application/json" ,
	        url: '${contextPath}/business/ggzyexpertscores/json',
	        data:JSON.stringify(data_),
	        beforeSend:function(){},
	        error: function() { 
	        	 alertMsg.error('评分保存异常');
	        },
	        success: function() { 
			}		
	    });});
	$('.scoreTypeScore').bind("blur", function(){
		if($(this).val().trim().length <= 0 || $(this).val().trim() == $(this).attr('oldValue'))
			return;
		var applyTenderId = ($(this).parents("tr").attr('applyTenderId'));
		var scoreTypeId = $(this).attr("scoreTypeId");
		var data_ = {
				id:{
					applyTenderId: applyTenderId,
					tendersId:'${noticeTenders.id.tendersId}',
					scoreTypeId:scoreTypeId,
					noticeId:'${noticeTenders.id.noticeId}'
				},
				score:$(this).val().trim()
			};
		jQuery.ajax({
	        type: 'POST',
	        dataType: "json",contentType:"application/json" ,
	        url: '${contextPath}/business/ggzyotherscores/json',
	        data:JSON.stringify(data_),
	        error: function() { 
	        	 alertMsg.error('评分保存异常');
	        },
	        success: function() { 
			}		
	    });});
	$('.final').live("blur", function(){
		if($(this).isErrorField())
			return;
		if($(this).val().trim().length <= 0 || $(this).val().trim() == $(this).attr('oldValue'))
			return;
		var applyTenderId = ($(this).parents("tr").attr('applyTenderId'));
		var data_ = {'applyTenderId': applyTenderId};
		data_[$(this).attr('name')] = $(this).val().trim();
		jQuery.ajax({
	        type: 'POST',
	        dataType: "json",contentType:"application/json" ,
	        url: '${contextPath }/${business_ctx}/ggzyapplytenders/json',
	        data:JSON.stringify(data_),
	        error: function() { 
	        	
	        },
	        success: function() { 
	        	
			}		
	        		
	    });	
	});
	
	$('[name="review"]').live('change',function(){
		if($(this).isErrorField())
			return;
		if($(this).val().trim().length <= 0 || $(this).val().trim() == $(this).attr('oldValue'))
			return;
		var applyTenderId = ($(this).parents("tr").attr('applyTenderId'));
		var data_ = {'applyTenderId': applyTenderId};
		data_[$(this).attr('name')] = $(this).val().trim();
		jQuery.ajax({
	        type: 'POST',
	        dataType: "json",contentType:"application/json" ,
	        url: '${contextPath }/${business_ctx}/ggzyapplytenders/json',
	        data:JSON.stringify(data_),
	        error: function() { 
	        	
	        },
	        success: function() { 
	        	
			}		
	        		
	    });
	});
	
	$('.biddoc').bind('focus', function(){
		$(this).attr('oldValue', $(this).val().trim());
	});
})
//-->
</script>
<form method="POST" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this, ${empty subCallbackFun?"dialogReloadNavTab":subCallbackFun});">
<input type="hidden" name="id" value="<spring:eval expression="noticeTenders.id"/>"/>

	<div class="pageContent">
		<%@include file="recordform.jsp"%>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</form>
