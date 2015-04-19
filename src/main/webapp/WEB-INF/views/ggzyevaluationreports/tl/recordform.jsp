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
				<th rowspan="2" width="200"></th>
				<c:choose>
				<c:when test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<th align="center" colspan="2">统一打分</th>
				<th rowspan="2">评审是否通过</th>
				<th rowspan="2">最终得分</th>
				</c:when>
				<c:otherwise>
				<th rowspan="2">报价(元)</th>
				</c:otherwise>
				</c:choose>
				<th rowspan="2">排名</th>
			</tr>
			<tr><%-- 
			<c:forEach items="${noticeTenders.scoreTypes }" var="item">
					<th>${item.scoreType.name }</th>
				</c:forEach> --%>
			<c:if test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<th>信誉分</th>
				<th>报价分</th>
			</c:if>	
			</tr>
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<tr applyTenderId="${item.applyTenderId }">
				<td>${item.apply.biddingSubject.subjectName }</td>
			<c:choose>
			<c:when test="${noticeTenders.scoreTypes.toArray()[0].scoreType.name eq '综合评分法' }">
				<td><input value="${item.reputation }" size="8" name="reputation" class="final required validate[required,custom[score]]" /></td>
				<td><input value="${item.quotation }" size="8" name="quotation" class="final required validate[required,custom[score]]" /></td>
				<%-- <c:forEach items="${noticeTenders.scoreTypes }" var="item_"> --%>
					<%-- <td><input scoreTypeId="${item_.id.scoreTypeId }" value="${item.getOtherScore(item_.id.scoreTypeId).score }" size="8" class="scoreTypeScore required validate[required,custom[score]]" /></td>
					<td><input scoreTypeId="${item_.id.scoreTypeId }" value="${item.getOtherScore(item_.id.scoreTypeId).score }" size="8" class="scoreTypeScore required validate[required,custom[score]]" /></td> --%>
				<%-- </c:forEach> --%>
				<td>
				<select name='review'>
				<option value='true' ${item.review?"selected":""}>通过</option>
				<option value='false'${item.review?"":"selected"}>不通过</option></select>
				</td>
				<td><input value="${item.finalScore }" size="8" name="finalScore" class="final required validate[required,custom[score]]" /></td>
			</c:when>
			<c:otherwise>
				<td>${item.ggzyBidDocs.price }</td>
			</c:otherwise>
			</c:choose>
				<td><input value="${item.rank }" size="8" name="rank" class="final required validate[required,custom[integer]]" /></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>记录人：</label></td>
			<td class="td2"><input type="text" name="recordPerson" value="${noticeTenders.evaluationReport.recordPerson }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2"><input type="text" name="supervisors" value="${noticeTenders.evaluationReport.supervisors }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
		</tr>
	</table>
</div>