<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybidpublicitys" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_tenders.bidPro.bidProName" value="${param['search_LIKE_tenders.bidPro.bidProName'] }" /></li>
				<li><label><spring:message code="ggzybasepro_procode" />：</label> <input type="text" name="search_LIKE_tenders.bidPro.proCode" value="${param['search_LIKE_tenders.bidPro.proCode'] }" /> </li>
				<input type="hidden" name="nv_" value="${param['nv_'] }" />
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit"><spring:message code="searchbtn"/></button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>
<script type="text/javascript">
<!--
	function validAudit() {
		var data = $.parseJSON($('#selectDataauditResNotice').val());
		if (data['noticeTenders'].tenders.biddingResNotice) {
			alertMsg.warn("已审核中标通知");
			return false;
		}
		return true;
	}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="auditresnotice:audit">
				<li><a iconClass="application_add" target="dialog"
					rel="auditresnotice_add" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}?nv_=ggzybiddingresnotices/audit" click="{fun:validAudit}"><span>审核中标通知</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="auditresnotice:show">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="tenders_show" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}?tendersId={slt_uid}&nv_=ggzybiddingresnotices/show"><span><spring:message code="ggzytradingservicesfees_showbtn"/></span></a></li>
			</shiro:hasPermission>
			<%-- <shiro:hasPermission name="tradingfee:update">
				<li><a iconClass="application_add" target="dialog"
					rel="tenders_update" mask="true" max="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}?tendersId={slt_uid}"><span><spring:message code="ggzytradingservicesfees_updatebtn"/> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="tradingfee:delete">
				<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/${module_path}/delete"
					title="确认要删除?"><span><spring:message code="ggzytradingservicesfees_deletebtn"/> </span></a></li>
			</shiro:hasPermission> --%>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%" id="auditResNotice">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybasepro_procode" /> </th>
				<th width="100"><spring:message code="ggzytenders_tendersname" /> </th>
				<th width="100"><spring:message code="ggzybidpublicity_biddingcandidate"/></th>
				<th width="100"><spring:message code="ggzybidpublicity_publicityendtime"/></th>
				<th width="100">审核状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.noticeTenders.id"/>" data="<spring:eval expression="item.toJson({'noticeTenders.tenders.biddingResNotice'})"/>">
					<td><input name="ids" value="<spring:eval expression="item.noticeTenders.id"/>" type="checkbox"></td>
					<td>${item.noticeTenders.tenders.bidPro.bidProName}</td>
					<td>${item.noticeTenders.tenders.bidPro.proCode}</td>
					<td>${item.noticeTenders.tenders.tendersName}</td>
					<td>${item.noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }</td>
					<td><spring:eval expression="item.publicityEndtime"/></td>
					<td>${empty item.noticeTenders.tenders.biddingResNotice ?"未" :"已"}审核</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
