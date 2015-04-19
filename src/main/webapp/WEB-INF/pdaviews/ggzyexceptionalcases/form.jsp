<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set var="backUrl" value="${contextPath }/${business_ctx}/ggzyexceptionalcases?businessTypeId=${ noticeTenders.notice.bidPro.businessType.businessTypeId}&taskId=exceptionalcases&orderField=subTime"/>
<div class="twotit">
	<a href="javascript:location.href='${backUrl }'" class="floL hand backbt"></a>废标管理
</div>
<div class="div_xmtj">
	<input name="step" type="hidden" value="${param.step }">
	<div class="panel">
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
				<tr height=20>
					<td><spring:message code="ggzybidpro_procode" /> ：</td>
					<td>${noticeTenders.tenders.bidPro.proCode }</td>
				</tr>
				<tr>
					<td><spring:message code="ggzybidpro_bidproname" />：</td>
					<td>${noticeTenders.tenders.bidPro.bidProName }</td>
				</tr>
				<tr height=20>
					<td><spring:message code="ggzybidpro_tenderee" />：</td>
					<td>${noticeTenders.tenders.bidPro.tenderee.subjectName}</td>
				</tr>
				<tr>
					<td><spring:message code="ggzybidpro_agency" />：</td>
					<td>${noticeTenders.tenders.bidPro.agency.subjectName}</td>
				</tr>
				<tr height=20>
					<td><spring:message code="ggzytenders_tendersname" />：</td>
					<td>${noticeTenders.tenders.tendersName }</td>
				</tr>
				<tr>
					<td><spring:message code="ggzytenders_bidtime" />：</td>
					<td><spring:eval expression="noticeTenders.bidTime" /></td>
				</tr>
			</table>
		</div>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>废标原因：</label></td>
			<td class="td2" colspan="3"><spring:eval expression="exceptionalCase.caseDesc" /></td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label>见证人：</label></td>
			<td class="td2">${exceptionalCase.witness }</td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2">${exceptionalCase.supervisors }</td>
		</tr>
		<tr>
			<td class="td1"><label>处理方式：</label></td>
			<td class="td2">
			<c:choose>
			<c:when test="${empty  exceptionalCase.dealWay}">
			<select name="dealWay.id">
					<option value="23069">重发公告</option>
					<option value="23070">停止招标</option>
			</select>
			</c:when>
			<c:otherwise>
			${exceptionalCase.dealWay.name }
			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr >
			<td class="td1"><label>处理时间：</label></td>
			<td class="td2"><input name="dealTime" readonly="readonly" value="<fmt:formatDate  value="${sysdate_}" pattern="yyyy-MM-dd HH:mm:ss"/>" /></td>
		</tr>
	</table>
</div>