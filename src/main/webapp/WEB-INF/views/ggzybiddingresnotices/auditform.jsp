<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
	<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${empty noticeTenders }">
<c:set value="${ggzyBidPublicity.noticeTenders }" var="noticeTenders"/>
</c:if>
<c:set var="ggzyTenders" value="${noticeTenders.tenders}"/>
<c:set var="bidPro" value="${noticeTenders.tenders.bidPro}"/>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="id.tendersId" value="${noticeTenders.id.tendersId}"/>
	<input type="hidden" name="id.noticeId" value="${noticeTenders.id.noticeId}"/>
	<input type="hidden" name="id.applyTenderId" value="${noticeTenders.biddingCandidate.applyTender.applyTenderId}"/>
	 <div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<caption>中标通知</caption>
			<caption style="height: 10px"></caption>
			<tr>
				<td class="td1" width="20%"><label><spring:message code="ggzybidpro_bidproname"/>：</label></td>
				<td class="td2"  width="30%">${ bidPro.bidProName}</td>
				<td class="td1" width="20%"><label><spring:message code="ggzybidpro_procode"/>：</label></td>
				<td class="td2" width="30%">${ bidPro.proCode}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzytenders_tendersname"/>：</label></td>
				<td class="td2">${ggzyTenders.tendersName}</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_proname"/>：</label></td>
				<td class="td2">${ggzyTenders.proName}</td>
			</tr>
			
			<tr>
				<td class="td2" colspan="4"><strong>${noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }:</strong> </td></tr>
			<tr>
				<td class="td2" colspan="4"><strong>&nbsp;&nbsp;&nbsp;&nbsp;${ggzyTenders.proName }<%--工程名称 --%>，于<spring:eval expression="noticeTenders.bidTime" /> 在济南公共资源交易中心开标后，经评标委员会评审，招标人确定，招标监督机构核准，你单位被确定为中标人。</strong> </td></tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_address"/>：</label></td>
				<td class="td2" colspan="3">${bidPro.basePro.proAddress}</td>
			</tr>
			<tr>
			<c:choose> 
				<c:when test="${!empty ggzyTenders.area}">
				<td class="td1"><label><spring:message code="ggzybidpublicity_area"/>：</label></td>
				<td class="td2">${ggzyTenders.area}平方米</td>
				</c:when>
				<c:otherwise>
				<td class="td1"><label><spring:message code="ggzybidpublicity_scale"/>：</label></td>
				<td class="td2">${ggzyTenders.scale}</td>
				</c:otherwise>
				</c:choose>
				<td class="td1"><label><spring:message code="ggzybidpublicity_structuretype"/>：</label></td>
				<td class="td2">${ggzyTenders.structureType}</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidrange"/>：</label></td>
				<td class="td2" colspan="3">${ggzyTenders.bidRange}</td>
			</tr>
			
			<tr>
				<td class="td1"><label>中标价：</label></td>
				<td class="td2" >${noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.price}元</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidduration"/>：</label></td>
				<td class="td2" >${noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.projectDuration }日历日</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_biddquality"/>：</label></td>
				<td class="td2" >${noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.quality}</td>
				<td class="td1"><label>项目经理(负责人)：</label></td>
				<td class="td2" >${noticeTenders.bidPublicitiy.PM}</td>
			</tr>
			
			
			<tr>
				<td colspan="4" class="td2">
					<strong>你单位收到中标通知书后，须在三十日内与招标人签订书面合同。</strong>
				</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_publicitybegintime"/>：</label></td>
				<td class="td2" ><spring:eval expression="noticeTenders?.bidPublicitiy?.publicityBegintime"/></td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_publicityendtime"/>：</label></td>
				<td class="td2" ><spring:eval expression="noticeTenders?.bidPublicitiy?.publicityEndtime"/></td>
			</tr>
			<tr>
				<td class="td1"><label>允许打印时间：</label></td>
				<td class="td2" ><input name="allowPrintTime" type="text" class="input-medium required date validate[required]" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 09:00:00', minDate:'<spring:eval expression="noticeTenders?.bidPublicitiy?.publicityBegintime"/>'})" value="<spring:eval expression="noticeTenders?.tenders.biddingResNotice?.allowPrintTime"/>" readonly="readonly" /></td></tr>
		</table>
	</div>
</div>