<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/ggzybidproes" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="subBar">
				<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_bidProName"
					value="${param["search_LIKE_bidProName"] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode"/> ：</label> <input type="text"
					name="search_LIKE_proCode" value="${param.search_LIKE_proCode }" /></li>
<li><label>制作情况：</label> <select name="search_EQ_noticeMaked">
						<option value="">--全部--</option>
						<option value="0" ${param.search_EQ_noticeMaked eq '0'? 'selected':'' }>未制作</option>
						<option value="1" ${param.search_EQ_noticeMaked eq '1'? 'selected':'' }>已制作</option>
				</select></li>
				<input type="hidden" name="nv_" value="${param['nv_'] }">
				<li><div class="button">
							<div class="buttonContent">
								<button type="submit">
									<spring:message code="searchbtn" />
								</button>
							</div>
						</div></li>
			</ul>
			<div class="subBar">
				<ul>
					
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>
<script type="text/javascript">
<!--
function isMake(){
	try{
		var data = $.parseJSON( $('#selectDatanoticetable').val());
		if(data['ggzyNotices'].length > 0){
			alertMsg.error('该项目已制作公告');
			//return false;
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
<%-- ${contextPath }/${business_ctx}/${module_path}/{slt_uid} --%>
	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="notice:save">
			<li><a iconClass="application_add" target="dialog"
				rel="notice_add" minable="false" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}?bidProId={slt_uid}&form" name="ggzynotice_addbtn"><span><spring:message
							code="ggzynotice_addbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="notice:save">
			<li><a iconClass="application_add" target="dialog"
				rel="notice_add" minable="false" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}?bidProId={slt_uid}&form" data='{"nv_":"ggzynotices/correct"}'name="ggzynotice_addbtn"><span>更正<spring:message
							code="ggzynotice" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="notice:show">
			<li><a iconClass="application_form_magnify" target="navTab"
				rel="notice_list" mask="true" width="900" height="600"
				href="${contextPath }/${business_ctx}/${module_path}" data='{"nv_":"ggzynotices/listofpro","search_EQ_bidPro.bidProId":"{slt_uid}"}' ><span><spring:message
							code="ggzynotice_showlistbtn" /> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	<table id="noticetable" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybidpro_tenderee" /></th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="100"><spring:message code="ggzybidpro_createtime" /></th>
				<th width="100"><spring:message code="ggzybidpro_ggzynoticescount" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.bidProId}" data="<spring:eval expression="item.toJson('*.bidProId,*.ggzyNotices')"></spring:eval>">
					<td><input name="ids" value="${item.bidProId}" type="checkbox"></td>
					<td>${item.proCode}</td>
					<td>${item.basePro.proName}</td>
					<td>${item.tenderee.subjectName}</td>
					<td>${item.agency.subjectName}</td>
					<td><spring:eval expression="item.createTime"/></td>
					<td>${item.ggzyNotices.size()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page}" />
</div>
