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
<%-- 				<th rowspan="2" width="200">企业名称</th>
				<c:if test="${noticeTenders.scoreTypes.size() > 0 }">
				<th align="center" colspan="${ noticeTenders.scoreTypes.size()}">统一打分</th></c:if>
				<c:if test="${expertApply.signed.size() > 0 }">
				<th align="center" colspan="${expertApply.signed.size() }">专家打分</th>
				</c:if>
				<th rowspan="2">最终得分</th> --%>
			<th rowspan="1" width="200">企业名称</th>
				<c:if test="${noticeTenders.scoreTypes.size()>=1 && noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法'}">
				<c:forEach items="${expertApply.signed }" var="item">
					<th>${item.expertName }</th>
				</c:forEach>
				<th rowspan="1">最终得分</th>
				</c:if>
				<th rowspan="1">排名</th>
			</tr>
	<%-- 		<tr>
				<c:forEach items="${noticeTenders.scoreTypes }" var="item">
					<th>${item.scoreType.name }</th>
				</c:forEach>
				<c:forEach items="${expertApply.signed }" var="item">
					<th>${item.expertName }</th>
				</c:forEach>
			</tr> --%>
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<%-- <tr applyTenderId="${item.applyTenderId }">
				<td class="none"><input name="ids" value="${item.applyTenderId}" type="radio"></td>
				<td>${item.apply.biddingSubject.subjectName }</td>
				<c:forEach items="${noticeTenders.scoreTypes }" var="item_">
					<td>${item.getOtherScore(item_.id.scoreTypeId).score }</td>
				</c:forEach>
				<c:forEach items="${expertApply.signed }" var="item_">
					<td>${item.getExpertScore(item_.id).score }</td>
				</c:forEach>
				<td>${item.finalScore }</td>
				<td>${item.rank }</td>
			</tr> --%>
					<tr applyTenderId="${item.applyTenderId }">
					<td class="none"><input name="ids" value="${item.applyTenderId}" type="radio"></td>
				<td>${item.apply.biddingSubject.subjectName }</td>
				<c:if test="${noticeTenders.scoreTypes.size()>=1 && noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法'}">
				<%-- <c:forEach items="${noticeTenders.scoreTypes }" var="item_">
					<td><input scoreTypeId="${item_.id.scoreTypeId }" value="${item.getOtherScore(item_.id.scoreTypeId).score }" size="8" class="scoreTypeScore required validate[required,custom[score]]" /></td>
				</c:forEach> --%>
				<c:forEach items="${expertApply.signed }" var="item_">
					<td><input expertId="${item_.id }" size="8" value="${item.getExpertScore(item_.id).score }" class="expertScore required validate[required,custom[score]]" /></td>
				</c:forEach>
				<td><input value="${item.finalScore }" size="8" name="finalScore" class="final required validate[required,custom[score]]" /></td>
				</c:if>
				<td><input value="${item.rank }" size="8" name="rank" class="final required validate[required,custom[integer]]" /></td>
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