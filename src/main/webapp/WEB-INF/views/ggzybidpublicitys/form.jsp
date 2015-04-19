<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
	<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${empty noticeTenders }">
<c:set value="${ggzyBidPublicity.noticeTenders }" var="noticeTenders"/>
</c:if>
<c:set var="ggzyTenders" value="${noticeTenders.tenders}"/>
<c:set var="bidPro" value="${noticeTenders.tenders.bidPro}"/>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="bidPublicityId" value="${ggzyBidPublicity.bidPublicityId }"/>
	<input type="hidden" name="noticeTenders.id" value="<spring:eval expression="noticeTenders.id"/>"/>
	 <div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<caption>${businessType.name }项目中标公示</caption>
			<caption style="height: 10px"></caption>
			<tr>
				<td class="td1" width="20%"><label><spring:message code="ggzybidpro_procode"/>：</label></td>
				<td class="td2" width="30%">${ bidPro.proCode}</td>
				<td class="td1" width="20%"><label><spring:message code="ggzybidpro_bidproname"/>：</label></td>
				<td class="td2"  width="30%">${ bidPro.bidProName}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpro_tenderee"/>：</label></td>
				<td class="td2">${ bidPro.tenderee.subjectName}</td>
				<td class="td1"><label><spring:message code="ggzybidpro_agency"/>：</label></td>
				<td class="td2" >${ bidPro.agency.subjectName}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzytenders_tendersname"/>：</label></td>
				<td class="td2">${ggzyTenders.tendersName}</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_proname"/>：</label></td>
				<td class="td2">${ggzyTenders.proName}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_address"/>：</label></td>
				<td class="td2" colspan="3">${bidPro.basePro.proAddress}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidrange"/>：</label></td>
				<td class="td2" colspan="3">${ggzyTenders.bidRange}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_area"/>：</label></td>
				<td class="td2">${ggzyTenders.area}平方米</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_scale"/>：</label></td>
				<td class="td2">${ggzyTenders.scale}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_structuretype"/>：</label></td>
				<td class="td2">${ggzyTenders.structureType}</td>
				<td class="td1"><label><spring:message code="ggzytenders_bidtime" />:</label></td>
				<td class="td2" colspan="3"><spring:eval expression="noticeTenders?.bidTime"/></td>
			</tr>
			<c:if test="${not empty noticeTenders.biddingCandidate}">
			<c:set value="${noticeTenders.biddingCandidate }" var="item"/>
			<%-- <input type="hidden" name="tenders.biddingCandidates.id.applyTenderId" value="${item.applyTender.applyTenderId }"/>
			<input type="hidden" name="tenders.biddingCandidates.id.tendersId" value="${item.tenders.tendersId}"/> --%>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_biddingcandidate"/> ：</label></td>
				<td class="td2" >${item.applyTender.apply.biddingSubject.subjectName }</td>
				<c:choose>
					<c:when test="${noticeTenders.ggzyBidOpenings.openningType.id eq 3}">
					<td class="td1"><label>中标费率：</label></td>
					<td class="td2" >${item.applyTender.ggzyBidDocs.rate}%</td>
					</c:when>
					<c:otherwise>
					<td class="td1"><label>中标价：</label></td>
					<td class="td2" >${item.applyTender.ggzyBidDocs.price}元</td>
					</c:otherwise>
				</c:choose>
				
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidduration"/>：</label></td>
				<td class="td2" >${item.applyTender.ggzyBidDocs.projectDuration }日历日</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_biddquality"/>：</label></td>
				<td class="td2" >${item.applyTender.ggzyBidDocs.quality}</td>
			</tr>
			<tr>
				<td class="td1"><label>项目经理：</label></td>
				<td class="td2" colspan="3"><input name="PM" id="PM" type="text" class="input-medium validate[required] required" maxlength="50" value="${ggzyBidPublicity.PM }" /></td></tr>
			</c:if>
			<tr>
				<td class="td1"><label>项目班子成员表：</label></td>
				<td colspan="5" class="td2">
				<mh:dataClob name="publicityContent" dataClob="${ggzyBidPublicity.publicityContent}"></mh:dataClob>
				</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_publicitybegintime"/>：</label></td>
				<td class="td2" ><input name="publicityBegintime" id="publicityBegintime" type="text" class="input-medium required date validate[required]" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 09:00:00', minDate:'%y-%M-%d 09:00:00'})" value="<spring:eval expression="noticeTenders?.bidPublicitiy?.publicityBegintime"/>" readonly="readonly" /></td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_publicityendtime"/>：</label></td>
				<td class="td2" ><input name="publicityEndtime" id="publicityEndtime" type="text" class="input-medium validate[required] required date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 17:00:00', minDate:'#F{$dp.$D(\'publicityBegintime\',{d:+3});}'})" maxlength="100" value="<spring:eval expression="noticeTenders?.bidPublicitiy?.publicityEndtime"/>" readonly="readonly" /></td>
			</tr>
		</table>
	</div>
</div>