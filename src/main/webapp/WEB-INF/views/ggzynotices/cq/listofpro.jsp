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
				<%-- <li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_basePro.proName"
					value="${param["search_LIKE_basePro.proName"] }" /></li>
				<li><label>交易编号：</label> <input type="text"
					name="search_LIKE_bidPro.proCode" value="${param["search_LIKE_bidPro.proCode"] }" /></li> --%>
				<li><label>审核情况：</label> <select name="search_EQ_auditStatus">
						<option value="">--全部--</option>
						<option value="0" ${param.search_EQ_auditStatus eq '0'? 'selected':'' }>未审核</option>
						<option value="1" ${param.search_EQ_auditStatus eq '1'? 'selected':'' }>审核未通过</option>
						<option value="2" ${param.search_EQ_auditStatus eq '2'? 'selected':'' }>审核通过</option>
				</select></li>
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
function validUpdate(){
	try{
		var data = $.parseJSON( $('#selectDatanoticeofprotable', navTab.getCurrentPanel()).val());
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
		var data = $.parseJSON( $('#selectDatanoticeofprotable', navTab.getCurrentPanel()).val());
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
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}" name="ggzynotice_showbtn"><span><spring:message
							code="ggzynotice_showbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="notice:edit">
			<li><a iconClass="application_edit" target="dialog"
				rel="notice_edit" mask="true" width="1000" height="600"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form" name="ggzynotice_updatebtn" 
				
				${mh:hasRole('管理员')?"":"click=\"{fun:validUpdate}\"" }><span><spring:message
							code="ggzynotice_updatebtn" /></span></a></li>
			</shiro:hasPermission>
			
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
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="200"><spring:message code="ggzynotice_noticename" /></th>
				<th width="100">转让方</th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="100"><spring:message code="ggzynotice_maketime" /></th>
				<th width="100"><spring:message code="ggzynotice_auditstatus" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.noticeId}" data='<spring:eval expression="item?.toJson('auditStatus')"/>'>
					<td><input name="ids" value="${item.noticeId}" type="checkbox">
					</td>
					<td>${item.bidPro.proCode}</td>
					<td>${item.noticeName}</td>
					<td>${item.bidPro.tenderee.subjectName}</td>
					<td>${item.bidPro.agency.subjectName}</td>
					<td><%-- <fmt:formatDate value="${item.createTime.time}" type="date"/> --%>
					<spring:eval expression="item?.makeTime"/>
					 </td>
					<td>${mh:auditStatus(item.auditStatus)}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
