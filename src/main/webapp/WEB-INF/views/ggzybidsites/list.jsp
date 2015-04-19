<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_notice.bidPro.bidProName" value="${param["search_LIKE_notice.bidPro.bidProName"] }" /></li>
				<li><label>交易编号：</label> <input type="text" name="search_EQ_bidPro.bidProCode" value="${param["search_EQ_bidPro.bidProCode"] }" /></li>
				<li><label>开标时间：</label><input name="time" readonly="readonly" value="${param['time'] }" onfocus="WdatePicker()"/></li>
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
function validUpdate(){
	try{
		var data = $.parseJSON( $('#selectDatanoticeofprotable').val(), navTab.getCurrentPanel());
		console.info(data);
		if(data['auditStatus'] && data['auditStatus'] == 2){
			alertMsg.error('<spring:message code="ggzynotice_hasaudit_pass_update_disable"/> ');
			return false;
		}
	}catch(e){
		console.error(e);
		return false;
	}
	return true;
}
function validDelete(){
	try{
		var data = $.parseJSON( $('#selectDatanoticeofprotable').val());
		console.info(data);
		if(data['auditStatus']){
			alertMsg.error('<spring:message code="ggzynotice_hasaudit_delete_disable"/> ');
			return false;
		}
	}catch(e){
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
			<shiro:hasPermission name="notice:show">
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="notice_show" mask="true" width="1000" height="600"
				href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}" name="ggzynotice_showbtn"><span><spring:message
							code="ggzynotice_showbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="notice:edit">
			<li><a iconClass="application_edit" target="dialog"
				rel="notice_edit" mask="true" width="1000" height="600"
				href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzybidsites/create"}'><span><spring:message
							code="ggzynotice_appointmentbtn" /></span></a></li>
			</shiro:hasPermission>
            <li><a class="icon"
                   href="${contextPath }/${business_ctx}/${module_path}/export"
                   target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"> <span>导出EXCEL</span></a></li>
			<shiro:hasRole name="管理员">
			<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?" callback="navTabReloadCurrentAndParent" click="validDelete()"><span><spring:message
							code="ggzynotice_deletebtn"/> </span></a></li>
			</shiro:hasRole>
		</ul>
	</div>



	<table id="noticeofprotable" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100">交易日期</th>
				<th width="200">交易时间</th>
				<th width="100">交易类别</th>
				<th width="100">招标方式</th>
				<th width="100">招标人(采购人)</th>
				<th width="100">招标内容(采购内容)</th>
				<th width="100">交易编号</th>
				<th width="100">代理机构</th>
				<th width="100">报名数</th>
				<th width="100">开标厅</th>
				<th width="100">评标厅</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.notice.noticeId}">
					<td><input name="ids" value="${item.notice.noticeId}" type="checkbox">
					</td>
					<td><fmt:formatDate value="${item.qua? item.notice.quaTime.getTime():item.notice.bidDocSubEndtime.getTime() }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${item.qua? item.notice.quaTime.getTime():item.notice.bidDocSubEndtime.getTime() }" pattern="HH:mm"/></td>
					<td>${item.notice.bidPro.businessWay.name}</td>
					<td>${item.notice.bidPro.businessType.name}</td>
					<td>${item.notice.bidPro.tenderee.subjectName}</td>
					<td>${item.notice.bidPro.bidProName}</td>
					<td>${item.notice.bidPro.proCode}</td>
					<td>${item.notice.bidPro.agency.subjectName}</td>
					<td>${item.notice.ggzyApplies.size() }</td>
					<td></td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
