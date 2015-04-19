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
function validApply(time_){
	var data = $.parseJSON( $('#selectDataapplynoticetable').val());
	var tendererDocGainTime = new Date();
	tendererDocGainTime.setTime(data['tendererDocGainTime'].time);
	var tendererDocGainEndTime = new Date();
	tendererDocGainEndTime.setTime(data['tendererDocGainEndTime'].time);
	var d = new Date(time_.replaceAll("-","/"));
	if(d >= tendererDocGainTime && d <= tendererDocGainEndTime)
		return true;
	if(d < tendererDocGainTime){
		alertMsg.warn('<spring:message code="ggzyapply_applytime_ahead"/>');
		return false;
	}
	if(d > tendererDocGainEndTime){
		alertMsg.warn('<spring:message code="ggzyapply_applytime_expired"/>');
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
			<shiro:hasPermission name="apply:showlist">
			<li><a iconClass="application_edit" target="navTab"
				rel="apply_list" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/ggzyapplys?nv_=ggzybondrecords/applylist&search_EQ_notice.noticeId={slt_uid}&orderField=applyTime" name="ggzynotice_updatebtn"><span><spring:message code="ggzybondrecord_statusbtn"/></span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>



	<table id="applynoticetable" class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				<th width="100"><spring:message code="ggzybidpro_procode" /> </th>
				<th width="100"><spring:message code="ggzybasepro_proname" /></th>
				<th width="100"><spring:message code="ggzybidpro_tenderee" /></th>
				<th width="100"><spring:message code="ggzybidpro_agency" /></th>
				<th width="100"><spring:message code="ggzynotice_tendererdocgaintime" /></th>
				<th width="100"><spring:message code="ggzynotice_tendererdocgainendtime" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="${item.noticeId}" data='<spring:eval expression="item?.toJson('tendererDocGainTime.time,tendererDocGainEndTime.time')"/>'>
					<td><input name="ids" value="${item.noticeId}" type="checkbox">
					</td>
					<td>${item.bidPro.proCode}</td>
					<td>${item.bidPro.basePro.proName}</td>
					<td>${item.bidPro.tenderee.subjectName}</td>
					<td>${item.bidPro.agency.subjectName}</td>
					<td><spring:eval expression="item?.tendererDocGainTime"/></td>
					<td><spring:eval expression="item?.tendererDocGainEndTime"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
