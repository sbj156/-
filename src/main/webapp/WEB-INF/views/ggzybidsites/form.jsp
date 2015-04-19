<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<script type="application/javascript" >

	/*jQuery(document).ready(function(){
		jQuery('form',$.pdialog.getCurrent()).validationEngine();

	});*/
</script>

<c:choose>
	<c:when test="${empty ggzyNotice}">
		<c:set value="${noticeTenders.notice}" var="ggzyNotice"/>
		<spring:eval expression="noticeTenders?.bidTime" var="bidTime"/>
		<input type="hidden" name="tenders.tendersId" value="${noticeTenders.id.tendersId}" />
	</c:when>
	<c:otherwise>
		<spring:eval expression="ggzyNotice?.bidDocSubEndtime" var="bidTime"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="notice.noticeId" value="${ggzyNotice.noticeId }" />



<div class="panel">
	<h1>项目基本信息</h1>
	<div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
			<tr height=20>
				<td style="width: 20%"><spring:message code="ggzybidpro_procode" /> ：</td>
				<td style="width: 30%">${ggzyNotice.bidPro.proCode }</td>
				<td style="width: 20%"><spring:message code="ggzybidpro_bidproname" />：</td>
				<td>${ggzyNotice.bidPro.bidProName }</td>
			</tr>
			<tr height=20>
				<td><spring:message code="ggzybidpro_tenderee" />：</td>
				<td>${ggzyNotice.bidPro.tenderee.subjectName}</td>
				<td><spring:message code="ggzybidpro_agency" />：</td>
				<td>${ggzyNotice.bidPro.agency.subjectName}</td>
			</tr>
		</table>
	</div>
</div>
<div class="panel">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="16%"><label>开标日期：</label></td>

			<td class="td2"><input id="bidtime" type="text" name="notice.bidDocSubEndtime" readonly="readonly" value="<fmt:formatDate value="${bidTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="validate[maxSize[50],required,ajax[ajaxBidSite]] required" onfocus="WdatePicker({minDate:'%y-%M-{%d+20} 09:30:00',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
		</tr>
	</table>
</div>