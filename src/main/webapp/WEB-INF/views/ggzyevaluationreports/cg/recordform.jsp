<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set var="expertApply" value="${noticeTenders.expertApply}"/>
<div class="pageFormContent" layoutH="58">
	<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
	<div class="div_xmtj">
		<table class="list" width="100%">
		<thead>
			<tr>
				<th rowspan="1" width="200">企业名称</th>
				<c:if test="${noticeTenders.scoreTypes.size()>=1 && noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法'}">
				<c:forEach items="${expertApply.signed }" var="item">
					<th>${item.expertName }</th>
				</c:forEach>
				<th rowspan="1">最终得分</th>
				</c:if>
				<th rowspan="1">排名</th>
			</tr>
			
			
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<tr applyTenderId="${item.applyTenderId }">
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
	</div><input type='hidden' value="1" name='finish' />
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>记录人：</label></td>
			<td class="td2"><input type="text" name="recordPerson" value="${noticeTenders.evaluationReport.recordPerson }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2"><input type="text" name="supervisors" value="${noticeTenders.evaluationReport.supervisors }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
		</tr>
	</table>
</div>