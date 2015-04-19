<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/overall/comprehensivequery" var="listUrl_" />
<div style="display: none">
	<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
		<input name="search_EQ_notice.bidPro.businessType.businessTypeId" value="${param['search_EQ_notice.bidPro.businessType.businessTypeId']}" />
		<input name="search_EQ_notice.bidPro.majorType.majorTypeId" value="${param['search_EQ_notice.bidPro.majorType.majorTypeId']}" />
		<input name="search_EQ_notice.bidPro.basePro.area.id" value="${param['search_EQ_notice.bidPro.basePro.area.id']}" />
		<input name="search_EQ_notice.bidPro.businessWay.businessWayId" value="${param['search_EQ_notice.bidPro.businessWay.businessWayId']}" />
		<input name="search_LIKE_notice.bidPro.bidProName" value="${param['search_LIKE_notice.bidPro.bidProName']}" />
		<input name="search_LIKE_notice.bidPro.proCode" value="${param['search_LIKE_notice.bidPro.proCode']}" />
		<input name="search_LIKE_notice.bidPro.tenderee.subjectName" value="${param['search_LIKE_notice.bidPro.tenderee.subjectName']}" />
		<input name="search_LIKE_notice.bidPro.agency.subjectName" value="${param['search_LIKE_notice.bidPro.agency.subjectName']}" />
		<input type="hidden" name="nv_" value="analysis/overall/querylist" />
		<input type="text" name="search_GTE_notice.bidDocSubEndtime" value="${param['search_GTE_notice.bidDocSubEndtime'] }"/>
		<input type="text" name="search_LTE_notice.bidDocSubEndtime" value="${param['search_LTE_notice.bidDocSubEndtime'] }"/>
	</dwz:paginationForm>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar"></ul>
	</div>
	<table class="table" layoutH="75" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /></th>
				<th width="150"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100">代理机构</th>
				<th width="100">招标人</th>
				<th width="70"><spring:message code="ggzytenders_tendersname" /></th>
				<th width="100">登记时间</th>
				<th width="100"><spring:message code="ggzynotice" /> <spring:message code="ggzynotice_maketime" /></th>
				<th width="100"><spring:message code="ggzytenders_bidtime" /></th>
				<th width="100">中标通知书打印时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>" data="<spring:eval expression="item.toJson({'ggzyBidOpenings', 'bidTime.time', 'exceptionalCase'})"/>">
					<td><input name="ids" value="<spring:eval expression="item.id"/>" type="checkbox"></td>
					<td>${item.tenders.bidPro.proCode}</td>
					<td>${item.tenders.bidPro.bidProName}</td>
					<td>${item.tenders.bidPro.agency.subjectName}</td>
					<td>${item.tenders.bidPro.tenderee.subjectName}</td>
					<td>${item.tenders.tendersName}</td>
					<td><spring:eval expression="item.notice.bidPro.createTime" /></td>
					<td><spring:eval expression="item.notice.makeTime" /></td>
					<td><spring:eval expression="item.notice.bidDocSubEndtime" /></td>
					<td><spring:eval expression="item.tenders.biddingResNotice?.printTime"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
