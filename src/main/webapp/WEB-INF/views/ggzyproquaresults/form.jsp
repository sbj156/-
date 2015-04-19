<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
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