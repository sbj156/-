<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="../module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybidpublicitys" page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_noticeTenders.tenders.bidPro.basePro.proName" value="${param['search_LIKE_noticeTenders.tenders.bidPro.basePro.proName'] }" /></li>
				<li><label><spring:message code="ggzybasepro_procode" />：</label> <input type="text" name="search_LIKE_noticeTenders.tenders.bidPro.proCode" value="${param['search_LIKE_noticeTenders.tenders.bidPro.proCode'] }" /> </li>
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
	function validPrint(time_) {
		var data = $.parseJSON($('#selectDataprintResNotice', navTab.getCurrentPanel()).val());
		try{
		if (data['noticeTenders'].tenders.biddingResNotice.printTime) {
			alertMsg.warn("已打印中标通知");
			return false;
		}else if(!data['noticeTenders'].tenders.biddingResNotice.allowPrintTime){
			alertMsg.warn("主管部门未审核中标通知");
			return false;
		}else if(data['noticeTenders'].tenders.biddingResNotice.allowPrintTime){
			var allowPrintTime = new Date();
			allowPrintTime.setTime(data['noticeTenders'].tenders.biddingResNotice.allowPrintTime.time);
			var d = new Date(time_.replaceAll("-","/"));
			if(d < allowPrintTime){
				alertMsg.warn("未到打印时间");
				return false;
			}
		}}catch(e){
			alertMsg.warn("主管部门未审核中标通知");
			return false;
		}
			if(!data.noticeTenders.tenders.fee){
				alertMsg.warn("未交纳交易服务费");
				return false;
			}
		return true;
	}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="res_notice:save">
				<li><a iconClass="application_add" target="dialog"
					rel="tenders_add" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}?nv_=ggzybiddingresnotices/create" click="{url:'${contextPath }/app/sysdate',fun:validPrint}"><span>打印 </span></a></li>
				<li><a iconClass="application_delete" target="selectedTodo" rel="ids"
					href="${contextPath }/${business_ctx}/${module_path}/confirm"
					title="确认已打印完成?"><span>打印完成</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="res_notice:show">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="tenders_show" mask="true" width="1000" height="600"
					href="${contextPath }/${business_ctx}/${module_path}?tendersId={slt_uid}&nv_=ggzybiddingresnotices/show"><span><spring:message code="ggzytradingservicesfees_showbtn"/></span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%" id="printResNotice">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybasepro_procode" /> </th>
				<th width="100"><spring:message code="ggzytenders_tendersname" /> </th>
				<th width="100"><spring:message code="ggzybidpublicity_biddingcandidate"/></th>
				<th width="100">交易服务费</th>
				<th width="100">可打印日期</th>
				<th width="100">打印状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.noticeTenders.id"/>" data="<spring:eval expression="item.toJson({'noticeTenders.tenders.biddingResNotice.printTime','noticeTenders.tenders.biddingResNotice.allowPrintTime.time','noticeTenders.tenders.fee'})"/>">
					<td><input name="ids" value="<spring:eval expression="item.noticeTenders.id"/>" type="checkbox"></td>
					<td>${item.noticeTenders.tenders.bidPro.bidProName}</td>
					<td>${item.noticeTenders.tenders.bidPro.proCode}</td>
					<td>${item.noticeTenders.tenders.tendersName}</td>
					<td>${item.noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }</td>
					<td>${empty item.noticeTenders.tenders.fee ?"未交纳" :"已交纳" }</td>
					<td><spring:eval expression="item.noticeTenders.tenders?.biddingResNotice?.allowPrintTime"/> </td>
					<td>${empty item.noticeTenders.tenders.biddingResNotice.printTime ?"未打印" :"已打印"}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
