<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageFormContent" layoutH="58">
<c:set var="expertApply" value="${noticeTenders.expertApply}"/>
<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
	<div class="panel">
		<h1>中标人</h1>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tble_masge">
				<c:if test="${!empty noticeTenders.biddingCandidate }">
				<tr height=20>
					<td colspan="3">
						${noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }
					</td>
				</tr>
				</c:if>
			</table>
		</div>
	</div>
	<div class="div_xmtj">
		<table class="list" width="100%">
		<thead>
			<tr>
				<th rowspan="2" width="70" class="none">选择</th>
				<th rowspan="2" width="200">企业名称</th>
				<c:choose>
				<c:when test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<th align="center" colspan="2">统一打分</th>
				<th align="center" rowspan="2">评审是否通过</th>
				<th rowspan="2">最终得分</th>
				</c:when>
				<c:otherwise>
				<th rowspan="2">报价(元)</th>
				</c:otherwise>
				</c:choose>
				<th rowspan="2">排名</th>
			</tr>
			<tr>
			<c:if test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<th>信誉分</th>
				<th>报价分</th>
			</c:if>
			</tr>
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<tr applyTenderId="${item.applyTenderId }">
				<td class="none"><input name="ids" value="${item.applyTenderId}" type="radio"></td>
				<td>${item.apply.biddingSubject.subjectName }</td>
			<c:choose>
			<c:when test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<td>${item.reputation }</td>
				<td>${item.quotation }</td>
				<%-- </c:forEach> --%>
				<%-- <c:forEach items="${expertApply.signed }" var="item_">
					<td>${item.getExpertScore(item_.id).score }</td>
				</c:forEach> --%>
				<td>${item.review?"":"不"}通过</td>
				<td>${item.finalScore }</td>
			</c:when>
			<c:otherwise>
				<td>${item.ggzyBidDocs.price }</td>
			</c:otherwise>
			</c:choose>
				<td>${item.rank }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>记录人：</label></td>
			<td class="td2"><input type="text" name="recordPerson" readonly="readonly" value="${noticeTenders.evaluationReport.recordPerson }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2"><input type="text" name="supervisors" readonly="readonly" value="${noticeTenders.evaluationReport.supervisors }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
		</tr>
	</table>
</div>