<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${empty ggzyBidPro}">
	<c:set var="ggzyBidPro" value="${ggzyNotice.bidPro }" />
</c:if>
<%-- 
重发公告可选择标段条件
1.全新标段(未发布)not exists notices
2.废标且处理方式为重发公告,且未重发 
 --%>
<script type="text/javascript">
<!--
	function loadTendersList() {
		$("#tenders").loadUrl('${contextPath }/${business_ctx}/ggzytenderses?nv_=ggzytenderses/listOfPro', {
			'search_EQ_bidPro.bidProId' : '${ggzyBidPro.bidProId}',
			'eventSource' : '${param.eventSource}',
			noticeId:"${ggzyNotice.noticeId}",
			businessTypeId:'${param.businessTypeId}'
		});
	}
	/* $(function() {
		loadTendersList();
	}); */
	function validateTenders(form, callback, confirmMsg) {
		/* var tenders = $("input[name='tendersId']", $("#tenders"));
		if (!(tenders && tenders.length > 0)) {
			alertMsg.warn('请录入标段(分包)信息');
			return false;
		} */
		return validateCallback(form, callback, confirmMsg);
	}
//-->
</script>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="bidPro.bidProId" value="${ggzyBidPro.bidProId}" /> 
	<input type="hidden" name="noticeId" value="${ggzyNotice.noticeId}" />

	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<caption>
				更正公告
			</caption>
			<tr>
				<td class="td1" width="25%"><label><spring:message code="ggzybidpro_procode"></spring:message>：</label></td>
				<td class="td2">${ggzyBidPro.proCode }</td>
				<td class="td1"><label><spring:message code="ggzybasepro_proname"></spring:message>：</label></td>
				<td class="td2">${ggzyBidPro.bidProName }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_businesstype" /> ：</label></td>
				<td class="td2">${ggzyBidPro.businessType.name }</td>
				<td class="td1"><label><spring:message code="ggzybidpro_businessway" />：</label></td>
				<td class="td2">${ggzyBidPro.businessWay.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_tenderee" />：</label></td>
				<td class="td2">${ggzyBidPro.tenderee.subjectName }</td>
				<td class="td1"><label><spring:message code="ggzybidpro_agency" />：</label></td>
				<td class="td2">${ggzyBidPro.agency.subjectName }</td>
			</tr>
			 <tr style="display: none">
				<td class="td1"><label><spring:message code="ggzynotice_noticenature" />：</label></td>
				<td class="td2"><mh:lookUpTree rootId="18" group="noticeNature" value="${ggzyNotice.noticeNature }" defaultId="21721" defaultName="更正公告"/></td>
				<td class="td1"><label><spring:message code="ggzynotice_noticetype" />：</label></td>
				<td class="td2"><mh:lookUpTree rootId="19" group="noticeType" value="${ggzyNotice.noticeType }" defaultId="21723" defaultName="招标公告"/></td>
			</tr>
			<%-- <tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgaintime" />：</label></td>
				<td class="td2"><input type="text" id="tendererDocGainTime" name="tendererDocGainTime" class="date validate[required] required" value='<spring:eval expression="ggzyNotice?.tendererDocGainTime"/>' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 09:00:00', minDate:'%y-%M-%d'})" readonly="readonly" /></td>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgainendtime" />：</label></td>
				<td class="td2"><input type="text" name="tendererDocGainEndTime" id="tendererDocGainEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 17:00:00',minDate:'#F{$dp.$D(\'tendererDocGainTime\',{d:5})||\'%y-%M-{%d+5}\'}'})" class="date validate[required] required" value='<spring:eval expression="ggzyNotice?.tendererDocGainEndTime"/>' readonly="readonly" /></td>
			</tr> --%>
			<%-- <tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgainway" />：</label></td>
				<td class="td2" colspan="3">
				<mh:dataClob name="tendererDocGainWay" dataClob="${ggzyNotice.tendererDocGainWay}"></mh:dataClob>
			</tr> --%>
			<%-- <tr>
				<td class="td1"><label><spring:message code="ggzynotice_time" />：</label></td>
				<td class="td2" colspan=3><input type="text" name="bidDocSubEndtime" class="date validate[required] required" value='<spring:eval expression="ggzyNotice?.bidDocSubEndtime"/>' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 09:30:00', minDate:'#F{$dp.$D(\'tendererDocGainEndTime\',{d:7, H:-%H-1})||\'%y-%M-{%d+7} 09:30:00\'}'})" readonly="readonly" /></td>
			</tr> --%>
			 <tr>
				<td class="td1"><label><spring:message code="ggzy_notice_agency_contacts" />：</label></td>
				<td class="td2">${ggzyBidPro.agencyContacts }</td>
				<td class="td1"><label><spring:message code="ggzy_notice_agency_tel" />：</label></td>
				<td class="td2">${ggzyBidPro.agencyTel }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticename" />：</label></td>
				<td class="td2" colspan="3"><input name="noticeName" value="${ggzyNotice.noticeName}" class="validate[required] required" size="70"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticecontent" />：</label></td>
				<td class="td2" colspan="3"><div class="unit">
						<%-- <textarea class="editor" name="noticeContent.content" rows="12" cols="90">
							<spring:eval expression="ggzyNotice?.noticeContent" />
						</textarea> --%>
						<mh:dataClob name="noticeContent" dataClob="${ggzyNotice.noticeContent}"></mh:dataClob>
					</div></td>
			</tr>
			<%-- <tr>
				<td class="td1"><label><spring:message code="ggzybidpro_ggzytenderss" />：</label></td>
				<td class="td2" colspan="3" style="line-height: 30px">注:可录入本项目全部招标标段(分包)信息,本次公告可以选择部分或全部标段(包)为本次招标标段(包)
					<div id="tenders" class="unitBox"></div>
				</td>
			</tr> --%>
			<tr>
				<%-- <td class="td1"><label><spring:message code="ggzynotice_noticeendtime" />：</label></td>
				<td class="td2"><input type="text" name="noticeEndtime" class="date validate[required] required" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value='<spring:eval expression="ggzyNotice?.noticeEndtime"/>' readonly="readonly" /></td> --%>
				<td class="td1"><label><spring:message code="ggzynotice_pubresponsible" />：</label></td>
				<td class="td2" colspan="3"><input name="pubResponsible" value="${ggzyNotice.pubResponsible}" class="validate[required] required" /></td>
			</tr>
		</table>
		<div id="tenders"></div>
	</div>
</div>