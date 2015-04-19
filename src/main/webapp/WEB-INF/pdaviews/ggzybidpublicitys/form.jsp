<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${empty noticeTenders }">
<c:set value="${ggzyBidPublicity.noticeTenders }" var="noticeTenders" />
</c:if>
<c:set var="ggzyTenders" value="${noticeTenders.tenders}" />
<c:set var="bidPro" value="${noticeTenders.tenders.bidPro}" />
<c:set var="backUrl" value="${contextPath }/${business_ctx}/${module_path}?orderField=subTime&businessTypeId=${bidPro.businessType.businessTypeId}&taskId=auditpublicity_js&taskId=auditpublicity"/>
<div class="twotit">
<a href="javascript:location.href='${backUrl }'" class="floL hand backbt"></a>中标公示
</div>
<input type="hidden" name="bidPublicityId" value="${ggzyBidPublicity.bidPublicityId }" />
<input type="hidden" name="noticeTenders.id" value="<spring:eval expression="noticeTenders.id"/>" />


<div class="div_xmtj">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<caption style="height: 10px"></caption>
		<tr>
			<td class="td1" width="20%"><label><spring:message code="ggzybidpro_procode" />：</label></td>
			<td class="td2" width="30%">${ bidPro.proCode}</td>
		</tr>
		<tr>
			<td class="td1" width="20%"><label><spring:message code="ggzybidpro_bidproname" />：</label></td>
			<td class="td2" width="30%">${ bidPro.bidProName}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpro_tenderee" />：</label></td>
			<td class="td2">${ bidPro.tenderee.subjectName}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpro_agency" />：</label></td>
			<td class="td2">${ bidPro.agency.subjectName}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzytenders_tendersname" />：</label></td>
			<td class="td2">${ggzyTenders.tendersName}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_proname" />：</label></td>
			<td class="td2">${ggzyTenders.proName}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_address" />：</label></td>
			<td class="td2">${bidPro.basePro.proAddress}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_bidrange" />：</label></td>
			<td class="td2">${ggzyTenders.bidRange}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_area" />：</label></td>
			<td class="td2">${ggzyTenders.area}平方米</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_scale" />：</label></td>
			<td class="td2">${ggzyTenders.scale}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_structuretype" />：</label></td>
			<td class="td2">${ggzyTenders.structureType}</td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzytenders_bidtime" />:</label></td>
			<td class="td2" colspan="3"><spring:eval expression="noticeTenders?.bidTime" /></td>
		</tr>
		<c:if test="${not empty noticeTenders.biddingCandidate}">
			<c:set value="${noticeTenders.biddingCandidate }" var="item" />
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_biddingcandidate" /> ：</label></td>
				<td class="td2">${item.applyTender.apply.biddingSubject.subjectName }</td>
			</tr>
			<tr>
				<td class="td1"><label>中标价：</label></td>
				<td class="td2">${item.applyTender.ggzyBidDocs.price}元</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidduration" />：</label></td>
				<td class="td2">${item.applyTender.ggzyBidDocs.projectDuration }日历日</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_biddquality" />：</label></td>
				<td class="td2">${item.applyTender.ggzyBidDocs.quality}</td>
			</tr>
		</c:if>
		<tr>
			<td class="td1" colspan="2"><label>项目班子成员表：</label></td>
		</tr>
		<tr>
			<td colspan="2" class="td2"><spring:eval expression="noticeTenders?.bidPublicitiy?.publicityContent" htmlEscape="false" /></td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_publicitybegintime" />：</label></td>
			<td class="td2"><spring:eval expression="noticeTenders?.bidPublicitiy?.publicityBegintime" /></td>
		<tr />
		<tr>
			<td class="td1"><label><spring:message code="ggzybidpublicity_publicityendtime" />：</label></td>
			<td class="td2"><spring:eval expression="noticeTenders?.bidPublicitiy?.publicityEndtime" /></td>
		</tr>
	</table>
</div>
