<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
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