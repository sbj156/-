<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<c:set value="${contextPath }/${business_ctx}/${module_path }" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }"
 	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_noticeTenders.tenders.bidPro.basePro.proName" value="${param['search_LIKE_noticeTenders.tenders.bidPro.basePro.proName'] }" /></li>
				<li><label><spring:message code="ggzybasepro_procode" />：</label> <input type="text" name="search_LIKE_noticeTenders.tenders.bidPro.proCode" value="${param['search_LIKE_noticeTenders.tenders.bidPro.proCode'] }" /> </li>
				<input type="hidden" name="nv_" value="${param['nv_'] }" />
				<input type="hidden" name="search_EQ_noticeTenders.id" value="${param['search_EQ_noticeTenders.id'] }" />
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
	function validAudit() {
		try {
			var data = $.parseJSON($('#selectDatapublicity').val(), navTab.getCurrentPanel());
			if (data['auditStatus']) {
				if (data['auditStatus'] == 1) {
					alertMsg.error('<spring:message code="ggzybidpublicity_hasaudit_wait"/> ');
				} else {
					alertMsg.error('<spring:message code="ggzybidpublicity_hasaudit_pass"/> ');
				}
				return false;
			}
		} catch (e) {
			console.error(e);
			return false;
		}
		return true;
	}
function validUpdate() {
	try {
		var data = $.parseJSON($('#selectDatapublicity').val(), navTab.getCurrentPanel());
		if (data['auditStatus'] && data['auditStatus'] == 2) {
			alertMsg.warn('公示已审核通过,无法修改,如需修改请重新制作');
			return false;
		}
	} catch (e) {
		console.error(e);
		return false;
	}
	return true;
}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="publicity:show">
			<li><a iconClass="application_form_magnify" target="dialog" rel="publicity_show" minable='true' width="900" height="600" href="${contextPath }/${business_ctx}/${module_path }/{slt_uid}"><span><spring:message code="ggzybidpublicity_showbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="publicity:audit">
			<li><a iconClass="application_form_magnify" target="dialog" rel="publicity_audit" minable='true' width="900" height="600" href="${contextPath }/${business_ctx}/${module_path }/{slt_uid}" data='{"nv_":"ggzybidpublicitys/audit"}' click="{fun:validAudit}"><span><spring:message code="ggzybidpublicity_auditbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="publicity:edit">
			<li><a iconClass="application_form_magnify" target="dialog" rel="publicity_update" minable='true' width="900" height="600" href="${contextPath }/${business_ctx}/${module_path }/{slt_uid}" data='{"nv_":"ggzybidpublicitys/update"}' click="{fun:validUpdate}"><span><spring:message code="ggzybidpublicity_updatebtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="shiro:delete">
			<li><a iconClass="application_delete" target="selectedTodo" rel="ids" href="${contextPath }/${business_ctx}/${module_path}/delete" title="确认要删除?" callback="navTabReloadCurrentAndParent"><span><spring:message code="ggzybidpublicity_deletebtn" /> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" id="publicity" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybasepro_procode" /></th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzytenders_tenderscode" /></th>
				<th width="100"><spring:message code="ggzytenders_tendersname" /></th>
				<th width="100" orderField="subTime" class="${page.orderField eq 'subTime' ? page.orderDirection : ''}"><spring:message code="ggzybidpublicity_subtime" /></th>
				<th width="100"><spring:message code="ggzybidpublicity_publicitybegintime" /></th>
				<th width="100"><spring:message code="ggzybidpublicity_publicityendtime" /></th>
				<th width="100"><spring:message code="ggzybidpublicity_auditstatus" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.bidPublicityId}" data="<spring:eval expression="item.toJson({'auditStatus'})"/>">
					<td><input name="ids" value="${item.bidPublicityId}" type="checkbox"></td>
					<td>${item.noticeTenders.tenders.bidPro.proCode}</td>
					<td>${item.noticeTenders.tenders.bidPro.bidProName}</td>
					<td>${item.noticeTenders.tenders.tendersCode}</td>
					<td>${item.noticeTenders.tenders.tendersName}</td>
					<td><spring:eval expression="item.subTime" /></td>
					<td><spring:eval expression="item.publicityBegintime" /></td>
					<td><spring:eval expression="item.publicityEndtime" /></td>
					<td>${mh:auditStatus(item.auditStatus)}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
