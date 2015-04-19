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
				<td class="td1"><label><spring:message code="ggzytenders_bidtime" />:</label></td>
				<td class="td2" colspan="3"><spring:eval expression="noticeTenders?.bidTime"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_company" />：</label></td>
				<td class="td2" colspan=3><table width=100%>
					<tr><td align=center><spring:message code="ggzytenders_tendersname"/></td><td align=center>采购内容</td><td align=center>中标供应商</td><td align=center>成交金额</td></tr>
					<tr>
						<td class=td2 align=center>${ggzyTenders.tendersName }</td>
						<td class=td2 align=center>${ mh:clob2String(ggzyTenders.tendersContent.content)}</td>
						<td class=td2 align=center>${noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }</td>
						<td class=td2 align=center>
						${empty noticeTenders.biddingCandidate.applyTender.last?noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.price:noticeTenders.biddingCandidate.applyTender.last }元</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_members" />：</label></td>
				<td class="td2" colspan=3>
				<c:forEach var="item" items="${noticeTenders.expertApply.assessmentExperts}">
					${item.expertName};
					<%-- <c:forEach var="exp" items="${item.assessmentExperts}">
					
					</c:forEach> --%>
				</c:forEach>	
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