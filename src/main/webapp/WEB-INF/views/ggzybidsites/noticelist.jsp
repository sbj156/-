<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzynotices" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_bidPro.basePro.proName" value="${param["search_LIKE_bidPro.basePro.proName"] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode"/>：</label> <input type="text" name="search_LIKE_bidPro.proCode" value="${param['search_LIKE_bidPro.proCode'] }" /></li>
				<input type="hidden" name="nv_" value="${param['nv_'] }"/>
				<input type="hidden" name="search_EQ_bidPro.bidProId" value="${param['search_EQ_bidPro.bidProId'] }"/>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">
									<spring:message code="searchbtn" />
								</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>
<script type="text/javascript">
<!--
	function validAppiontment() {
		try {
			var data = $.parseJSON($('#selectDataappointment').val(), navTab.getCurrentPanel());
			if (data['bidSites'].length > 1) {
				alertMsg.warn('已预约交易场所');
				$(this).attr('data', '{"nv_":"ggzybidsites/show"}');
			} else {
				$(this).attr('data', '{"nv_":"ggzybidsites/create"}');
			}
		} catch (e) {
			console.error(e);
			return false;
		}
		return true;
	}
	function validShow() {
		try {
			var data = $.parseJSON($('#selectDataappointment').val(), navTab.getCurrentPanel());
			if (data['bidSites'].length > 0) {
				return true;
			} else {
				alertMsg.warn("未预约交易场所");
				return false;
			}
		} catch (e) {
			console.error(e);
			return false;
		}
	}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="notice:show">
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="notice_show" mask="true" width="1000" height="600"
				href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}" name="ggzynotice_showbtn"><span>查看公告</span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="quaappointment:save">
				<li><a iconClass="application_edit" target="dialog" rel="notice_edit" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzybidsites/create"}' click="{fun:validAppiontment}"><span><spring:message code="ggzynotice_appointmentbtn" /></span></a></li>
			</shiro:hasPermission>
			<li><a iconClass="application_edit" target="dialog" rel="notice_edit" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzybidsites/show"}' click="{fun:validShow}"><span>查看</span></a></li>
		</ul>
	</div>



	<table id="appointment" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="200"><spring:message code="ggzynotice_noticename" /></th>
				<th width="100"><spring:message code="ggzybidpro_tenderee" /></th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="100"><spring:message code="ggzynotice_maketime" /></th>
				<th width="100">预约状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.noticeId}" data='<spring:eval expression="item?.toJson({'auditStatus', 'bidSites'})"/>'>
					<td><input name="ids" value="${item.noticeId}" type="checkbox">
					</td>
					<td>${item.bidPro.proCode}</td>
					<td>${item.noticeName}</td>
					<td>${item.bidPro.tenderee.subjectName}</td>
					<td>${item.bidPro.agency.subjectName}</td>
					<td><%-- <fmt:formatDate value="${item.createTime.time}" type="date"/> --%>
					<spring:eval expression="item?.makeTime"/>
					 </td>
					<td>${empty item.bidDocSubEndtime?"未":"已" }预约<spring:eval expression="item.bidDocSubEndtime"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
