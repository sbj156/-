<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	function loadTendersList() {
		$("#tenders").loadUrl('${contextPath }/${business_ctx}/ggzytenderses?nv_=ggzytenderses/listOfPro', {
			'search_EQ_bidPro.bidProId' : '${ggzyBidPro.bidProId}',
			'eventSource' : '${param.eventSource}'
		});
	}
	$(function() {
		loadTendersList();
	});
//-->
</script>
<c:if test="${empty ggzyBidPro}">
	<c:set var="ggzyBidPro" value="${ggzyNotice.bidPro }" />
</c:if>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="bidPro.bidProId" value="${ggzyBidPro.bidProId}" /> <input type="hidden" name="noticeId" value="${ggzyNotice.noticeId}" />

	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<caption>
				<spring:message code="ggzynotice"></spring:message>
			</caption>
			<caption style="height: 10px"></caption>
			<tr>
				<td class="td1" width="25%"><label><spring:message code="ggzybidpro_procode"></spring:message>：</label></td>
				<td class="td2">${ggzyBidPro.proCode }</td>
				<td class="td1"><label><spring:message code="ggzybasepro_proname"></spring:message>：</label></td>
				<td class="td2">${ggzyBidPro.bidProName }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_businesstype" /> ：</label></td>
				<td class="td2">${ggzyBidPro.businessType.name }</td>
				<%-- <td class="td1">
					<!-- 业务类型 --> <label>专业类型：</label>
				</td>
				<td class="td2">${ggzyBidPro.majorType.majorTypeId }</td> --%>
				<td class="td1"><label><spring:message code="ggzybidpro_businessway" />：</label></td>
				<td class="td2">${ggzyBidPro.businessWay.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_tenderee" />：</label></td>
				<td class="td2">${ggzyBidPro.tenderee.subjectName }</td>
				<td class="td1"><label><spring:message code="ggzynotice_noticetype" />：</label></td>
				<td class="td2"><select class="combox" name="noticeType">
						<option value="1">招标公告</option>
						<option value="2">资格预审公告</option>
						<option value="3">其他</option>
				</select></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgaintime" />：</label></td>
				<td class="td2"><input type="text" name="tendererDocGainTime" class="date" dateFmt="yyyy-MM-dd" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d+1}" value='<spring:eval expression="ggzyNotice?.tendererDocGainTime"/>' /></td>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgainendtime" />：</label></td>
				<td class="td2"><input type="text" name="tendererDocGainEndTime" class="date" dateFmt="yyyy-MM-dd" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d+1}" value='<spring:eval expression="ggzyNotice?.tendererDocGainEndTime"/>' /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgainway" />：</label></td>
				<td class="td2" colspan="3"><input name="tendererDocGainWay.content" value='<spring:eval expression="ggzyNotice?.tendererDocGainWay" />' class="validate[custom[chinese]]" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_biddocsubendtime" />：</label></td>
				<td class="td2"><input type="text" name="bidDocSubEndtime" class="date" dateFmt="yyyy-MM-dd" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d+1}" value='<spring:eval expression="ggzyNotice?.bidDocSubEndtime"/>' /></td>
				<td class="td1"><label><spring:message code="ggzynotice_biddocsubway" />：</label></td>
				<td class="td2"><input name="bidDocSubWay.content" value="${mh:clob2String(ggzyNotice.bidDocSubWay.content) }" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticeendtime" />：</label></td>
				<td class="td2"><input type="text" name="noticeEndtime" class="date" dateFmt="yyyy-MM-dd" minDate="{%y-10}-%M-%d" maxDate="{%y}-%M-{%d+1}" value='<spring:eval expression="ggzyNotice?.noticeEndtime"/>' /></td>
				<td class="td1"><label><spring:message code="ggzynotice_pubresponsible" />：</label></td>
				<td class="td2"><input name="pubResponsible" value="${ggzyNotice.pubResponsible}" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticecontent" />：</label></td>
				<td class="td2" colspan="3"><div class="unit">
						<textarea class="editor" name="noticeContent.content" rows="12" cols="130">
							<spring:eval expression="ggzyNotice?.noticeContent" />
						</textarea>
					</div></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_ggzytenderss" />：</label></td>
				<td class="td2" colspan="3"><div id="tenders" class="unitBox"></div></td>
			</tr>
		</table>
		<div id="tenders"></div>
	</div>
</div>