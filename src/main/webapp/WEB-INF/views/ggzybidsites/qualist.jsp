<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzyproquaresults" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_notice.bidPro.basePro.proName" value="${param[" search_LIKE_notice.bidPro.basePro.proName"] }" /></li>
				<li><label>交易编号：</label> <input type="text" name="search_LIKE_notice.bidPro.proCode" value="${param["search_LIKE_notice.bidPro.proCode"] }" /></li>
				<input type="hidden" name="nv_" value="${param['nv_'] }" />
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
			var data = $.parseJSON($('#selectDataquaappointment').val(), navTab.getCurrentPanel());
			if (data['notice'] && data['notice']['bidSites'].length > 1) {
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
			var data = $.parseJSON($('#selectDataquaappointment').val(), navTab.getCurrentPanel());
			if (data['notice'] && data['notice']['bidSites'].length > 1) {
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
			</shiro:hasPermission>
			<shiro:hasPermission name="quaappointment:save">
				<li><a iconClass="application_edit" target="dialog" rel="notice_edit" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzybidsites/create"}' click="{fun:validAppiontment}"><span><spring:message code="ggzynotice_appointmentbtn" /></span></a></li>
			</shiro:hasPermission>
			<li><a iconClass="application_edit" target="dialog" rel="notice_edit" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzybidsites/show"}' click="{fun:validShow}"><span>查看</span></a></li>
		</ul>
	</div>
	<table id="quaappointment" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /></th>
				<th width="200"><spring:message code="ggzynotice_noticename" /></th>
				<th width="100"><spring:message code="ggzybidpro_tenderee" /></th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="100"><spring:message code="ggzynotice_maketime" /></th>
				<th width="100"><spring:message code="ggzynotice_noticenature" /></th>
				<th width="100"><spring:message code="ggzynotice_quatime" /></th>
				<th width="100"><spring:message code="ggzynotice_quaappointment" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.notice.noticeId}" data='<spring:eval expression="item?.toJson({'notice.bidSites'})"/>'>
					<td><input name="ids" value="${item.notice.noticeId}" type="checkbox"></td>
					<td>${item.notice.bidPro.proCode}</td>
					<td>${item.notice.noticeName}</td>
					<td>${item.notice.bidPro.tenderee.subjectName}</td>
					<td>${item.notice.bidPro.agency.subjectName}</td>
					<td><spring:eval expression="item.notice?.makeTime" /></td>
					<td>${item.notice.noticeNature.name}</td>
					<td><spring:eval expression="item.notice?.quaTime" /></td>
					<td>${item.notice.bidSites.size() > 1? "已预约":"未预约" }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
