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
	        	 alertMsg.error('唱标异常');
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
				<th >序号</th>
				<th ><spring:message code="ggzyapply_biddingsubject" /></th>
				<th >报价(元)</th>
				<th >密封情况</th>
				<th >保证金</th>
				<th >质量承诺</th>
				<th >工期（日历天）</th>
			</tr>
		</thead>
		<tbody id="hasRoles">
			<c:forEach var="item" items="${noticeTenders.ggzyApplyTenders}"
				varStatus="status">
				<tr applyTenderId="${item.applyTenderId}">
					<td>${status.index + 1}</td>
					<td>${item.apply.biddingSubject.subjectName}</td>
					<td><input style="width:50px" class="biddoc" name="price" value="${item.ggzyBidDocs.price }"/></td>
					<td><input style="width:50px"class="biddoc" name="seal" value="${item.ggzyBidDocs.seal==null?'完好':item.ggzyBidDocs.seal}"/></td>
					<td><input style="width:50px"class="biddoc" name="bond" value="${item.ggzyBidDocs.bond==null?'已缴纳':item.ggzyBidDocs.bond }"/></td>
					<td><select name="quality"><option value="详见标书">详见标书</option>
					<option value="合格">合格</option>
					<option value="其他">其他</option></select>
					<%-- <input style="width:50px"class="biddoc" name="quality" value="${item.ggzyBidDocs.quality }"/> --%></td>
					<td><input style="width:50px"class="biddoc" name="projectDuration" value="${item.ggzyBidDocs.projectDuration }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>