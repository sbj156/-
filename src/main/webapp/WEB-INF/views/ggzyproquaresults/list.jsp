<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set var="listUrl_" value="${contextPath }/${business_ctx}/ggzynotices"/>
<dwz:paginationForm
	action="${listUrl_}" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_bidPro.basePro.proName"
					value="${param["search_LIKE_bidPro.basePro.proName"] }" /></li>

				<li><label><spring:message code="ggzybidpro_procode"/>：</label> <input type="text"
					name="search_LIKE_bidPro.proCode" value="${param['search_LIKE_bidPro.proCode']}" /></li>
				<input type="hidden" name="search_EQ_bidPro.bidProId" value="${param["search_EQ_bidPro.bidProId"] }"/>
				<input type="hidden" name="nv_" value="${param['nv_'] }"/>
				<input type="hidden" name="search_EQ_auditStatus" value="2"/>
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

function validQua(){
	var data = $.parseJSON( $('#selectDataquatable', navTab.getCurrentPanel()).val());
	if(data['proQuaResult']){
		$(this).attr("data", '{"nv_":"ggzyproquaresults/show"}');
	}else{
		$(this).attr("data", '{"nv_":"ggzyproquaresults/create"}');
	}
	return true;
}
function validShow(){
	var data = $.parseJSON( $('#selectDataquatable', navTab.getCurrentPanel()).val());
	if(!data['proQuaResult']){
		alertMsg.warn("未确认预审结果");
		return false;
	}
	return true;
}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<li><a iconClass="application_form_magnify" target="dialog"
				rel="apply_shownotice" mask="true" width="1000" height="600"
				href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}" name="ggzynotice_showbtn"><span><spring:message
							code="ggzyapply_shownoticebtn" /> </span></a></li>
			<shiro:hasPermission name="apply:save">
			<li><a iconClass="application_edit" target="dialog"
				rel="apply_add" mask="true" width="800" height="600"
				href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzyproquaresults/create"}' click="{fun:validQua}"><span><spring:message
							code="ggzyproquaresult_confirmbtn"/></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="apply:showlist">
			<li><a iconClass="application_edit" target="dialog"
				rel="apply_list" mask="true" width="800" height="600" href="${contextPath }/${business_ctx}/ggzynotices/{slt_uid}?form" data='{"nv_":"ggzyproquaresults/show"}' click="{fun:validShow}"><span><spring:message
							code="ggzyproquaresult_showbtn" /></span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	<table id="quatable" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="180"><spring:message code="ggzynotice_noticename" /></th>
				<th width="100"><spring:message code="ggzybidpro_tenderee" /></th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="70"><spring:message code="ggzynotice_quatime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.noticeId}" data='<spring:eval expression="item?.toJson('proQuaResult')"/>'>
					<td><input name="ids" value="${item.noticeId}" type="checkbox">
					</td>
					<td>${item.bidPro.proCode}</td>
					<td>${item.noticeName}</td>
					<td>${item.bidPro.tenderee.subjectName}</td>
					<td>${item.bidPro.agency.subjectName}</td>
					<td><spring:eval expression="item?.bidDocSubEndtime"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
