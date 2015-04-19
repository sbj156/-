<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
$().ready(function(){
	$("#notice").click(function(){
		$("#noticecontent").toggle();
	})
})

</script>

<c:if test="${empty ggzyBidPro}">
	<c:set var="ggzyBidPro" value="${ggzyNotice.bidPro }" />
</c:if>
<c:set var="backUrl" value="${contextPath }/${business_ctx}/${module_path}?nv_=ggzynotices/listofpro&search_EQ_bidPro.bidProId=${ggzyBidPro.bidProId}&businessTypeId=${ggzyBidPro.businessType.businessTypeId}"/>
	    <div class="twotit">
          <a href="javascript:location.href='${backUrl }'" class="floL hand backbt"></a> 招标公告
        </div>
		<input type="hidden" name="bidPro.bidProId" value="${ggzyBidPro.bidProId}" /> 
	     <input type="hidden" name="noticeId" value="${ggzyNotice.noticeId}" />
		<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr>
				<td style="width: 100px"><spring:message code="ggzybidpro_procode"></spring:message>：</td>
				<td class="td2">${ggzyBidPro.proCode }</td>
			</tr>
			<tr>	
				<td class="td1"><label><spring:message code="ggzybasepro_proname"></spring:message>：</label></td>
				<td class="td2">${ggzyBidPro.bidProName }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_businesstype" /> ：</label></td>
				<td class="td2">${ggzyBidPro.businessType.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_businessway" />：</label></td>
				<td class="td2">${ggzyBidPro.businessWay.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_tenderee" />：</label></td>
				<td class="td2">${ggzyBidPro.tenderee.subjectName }</td>
			</tr>
			
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_agency" />：</label></td>
				<td class="td2">${ggzyBidPro.agency.subjectName }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticenature" />：</label></td>
				<td class="td2">${ggzyNotice.noticeNature.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticetype" />：</label></td>
				<td class="td2">${ggzyNotice.noticeType.name }</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgaintime" />：</label></td>
				<td class="td2"><spring:eval expression="ggzyNotice?.tendererDocGainTime"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_tendererdocgainendtime" />：</label></td>
				<td class="td2"><spring:eval expression="ggzyNotice?.tendererDocGainEndTime"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_biddocsubendtime" />：</label></td>
				<td class="td2"><spring:eval expression="ggzyNotice?.bidDocSubEndtime"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_noticename" />：</label></td>
				<td class="td2" colspan="3">${ggzyNotice.noticeName}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_ggzytenderss" />：</label></td>
				<td class="td2" colspan="3" style="line-height: 30px">
				<c:forEach var="item" items="${ggzyNotice.noticeTenderses }">
					${item.tenders.tendersName }<br>
				</c:forEach>
				</td>
			</tr>		
			<tr>
				<td class="td1"><label><spring:message code="ggzynotice_pubresponsible" />：</label></td>
				<td class="td2" colspan="3">${ggzyNotice.pubResponsible}</td>
			</tr>
			<tr>
				<td class="td1"><label ><spring:message code="ggzynotice_noticecontent" />：</label></td>
				<td class="td2"><a href="#" id="notice">点击查看(收起)详细</a></td>
			</tr>
			<tr>
				<td class="td2" colspan="2"><div class="unit" style="display:none" id="noticecontent">
						${mh:clob2String(ggzyNotice.noticeContent.content) }
					</div></td>
			</tr>
		</table>
</div>