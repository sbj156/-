<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('.biddoc').bind("blur", function(){
		if($(this).val().trim().length <= 0 || $(this).val().trim() == $(this).attr('oldValue'))
			return;
		var applyTenderId = ($(this).parents("tr").attr('applyTenderId'));
		var data_ = {};
		data_[$(this).attr('name')] = $(this).val();
		data_["applyTender"] = {applyTenderId:applyTenderId};
		jQuery.ajax({
	        type: 'POST',
	        dataType: "json",contentType:"application/json" ,
	        url: '${contextPath }/${business_ctx}/ggzybiddocs/json',
	        data:JSON.stringify(data_),
	        error: function() { 
	        	 alertMsg.error('签到异常');
	        },
	        success: function() { 
			}		
	    });
	$('.biddoc').bind('focus', function(){
		$(this).attr('oldValue', $(this).val().trim());
	});
	
});})
//-->
</script>
<div class="panel">
	<table class="list" width="100%">
		<thead>
			<tr>
				<th width="40">序号</th>
				<th width="200"><spring:message code="ggzyapply_biddingsubject" />
				</th>
				<th width="100">报价一(元)</th>
				<th width="100">报价二(元)</th>
				<th width="100">工期(日历天)</th>
				<th width="100">质量承诺</th>
			</tr>
		</thead>
		<tbody id="hasRoles">
			<c:forEach var="item" items="${noticeTenders.ggzyApplyTenders}"
				varStatus="status">
				<tr applyTenderId="${item.applyTenderId}">
					<td>${status.index + 1}</td>
					<td>${item.apply.biddingSubject.subjectName}</td>
					<td><input class="biddoc required validate[required,custom[number]]" name="price1" value="${item.ggzyBidDocs.price1 }"/></td>
					<td><input class="biddoc required validate[required,custom[number]]" name="price" value="${item.ggzyBidDocs.price }"/></td>
					<td><input class="biddoc required validate[required,custom[number]]" name="projectDuration" value="${item.ggzyBidDocs.projectDuration }"/></td>
					<td><input class="biddoc" name="quality" value="${item.ggzyBidDocs.quality }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>