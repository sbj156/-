<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageFormContent" layoutH="58">
<c:set var="expertApply" value="${noticeTenders.expertApply}"/>
<%@ include file="/WEB-INF/views/ggzytenderses/cq/baseinfo.jsp"%>
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
				<th  width="70" class="none">选择</th>
				<th  width="200">企业名称</th>
				<th  width="200">最终报价</th>
				<th  width="200">轮数</th>
			</tr>
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<tr applyTenderId="${item.applyTenderId }">
				<td class="none"><input name="ids" value="${item.applyTenderId}" type="radio"></td>
				<td>${item.apply.biddingSubject.subjectName }</td>
				<td>${item.ggzyBidDocs.price }</td>
				<td>${item.ggzyBidDocs.projectDuration }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>记录人：</label></td>
			<td class="td2"><input type="text" name="recordPerson" value="${noticeTenders.evaluationReport.recordPerson }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2"><input type="text" name="supervisors"  value="${noticeTenders.evaluationReport.supervisors }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
		</tr>
	</table>
</div>