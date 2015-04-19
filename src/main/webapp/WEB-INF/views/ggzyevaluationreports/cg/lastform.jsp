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
				<th rowspan="1" width="300">企业名称</th>
				<th rowspan="1">最终报价(元)</th>
			</tr>
		</thead>
		<c:forEach items="${noticeTenders.ggzyApplyTenders}" var="item">
			<tr applyTenderId="${item.applyTenderId }">
				<td>${item.apply.biddingSubject.subjectName }</td>
				<td><input value="${item.last }" size="8" name="last" class="final required validate[required,custom[number]]" /></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</div>