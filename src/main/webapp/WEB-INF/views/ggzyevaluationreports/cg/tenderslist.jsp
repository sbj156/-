<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<c:set value="${contextPath }/${business_ctx}/ggzynoticetenderses" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_notice.bidPro.basePro.proName" value="${param['search_LIKE_notice.bidPro.basePro.proName'] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode" />：</label> <input type="text" name="search_LIKE_notice.bidPro.proCode" value="${param['search_LIKE_notice.bidPro.proCode'] }" /></li>
				<li><label><spring:message code="ggzytenders_bidtime" />：</label> <input type="text" name="search_GTE_bidTime" value="${param['search_GTE_bidTime'] }" onfocus="WdatePicker()" /></li>
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
function isExtract(){
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	if(data['extracted'] == true){
		$(this).attr('data','{"nv_":"ggzyexpertapplys/showextract"}');
	}else{
		$(this).attr('data','{"nv_":"ggzyexpertapplys/extract"}');
	}
	return true;
}
function validRecord(){
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	if(data.evaluationReport!=null &&　data.evaluationReport.finish){
		$(this).attr('data','{"nv_":"ggzyevaluationreports/showrecord"}');
	}else{
		$(this).attr('data','{"nv_":"ggzyevaluationreports/record"}');
	}
	return true;
}
function validConfirm(){
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	if(data['biddingCandidate']){
		$(this).attr('data','{"nv_":"ggzyevaluationreports/showcadidate"}');
	}else{
		$(this).attr('data','{"nv_":"ggzyevaluationreports/cadidate"}');
	}
	return true;
}
function validShow(){
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	if(!data['evaluationReport']){
		alertMsg.warn("未记录评标结果");
		return false;
	}
	if(!data['biddingCandidate']){
		alertMsg.warn("未确认中标候选人,目前只能查看评分情况");
	}
	
	return true;
}
function validCreate(){
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	console.info(data['evaluationReport.finish']);
	if("竞争性谈判"==$.trim(data.tenders.bidPro.businessWay.name)){
		if(data.evaluationReport!=null && data.evaluationReport.finish)$(this).attr('data','{"nv_":"ggzyevaluationreports/showlast"}');
		else $(this).attr('data','{"nv_":"ggzyevaluationreports/last"}');
	}else{
		alertMsg.warn("非竞争性谈判，不能进行最后报价");
		return false;
	}
	return true;
}
function validEvalAnnull() {
	var data = $.parseJSON($('#selectDataevaluationreports', navTab.getCurrentPanel()).val());
	if (data.evaluationReport!=null && data.evaluationReport.finish) {
		alertMsg.warn('已记录评标结果,无法进行废标操作');
		return false;
	}
	return true;
}
//-->
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="evaluation:signlist">
				<li><a iconClass="application_form_magnify" target="dialog" rel="evaluation_signlist" minable='true' mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyevaluationreports/signlist"}'><span><spring:message code="ggzyevaluationreport_signbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="evaluation:save">
				<li><a iconClass="application_add" target="dialog" rel="evaluation_score_type" mask="true" width="500" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}?form&scoreTypeParentId=21" data='{"nv_":"ggzyevaluationreports/assign_score_type"}'><span><spring:message code="ggzyevaluationreport_assignscoretypebtn_type" /> </span></a></li>
				<li><a iconClass="application_add" target="dialog" rel="evaluation_record" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyevaluationreports/record"}' click="{fun:validRecord}"><span><spring:message code="ggzyevaluationreport_recordbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="evaluation:save">
				<li><a iconClass="application_add" target="dialog" rel="evaluation_create" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" click="{fun:validCreate}"><span><spring:message code="ggzyevaluationreport_last" /></span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="evaluation:confirmcadidate">
				<li><a iconClass="application_add" target="dialog" rel="evaluation_confirmcadidate" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyevaluationreports/cadidate"}' click="{fun:validConfirm}"><span><spring:message code="ggzyevaluationreport_confirmcadiatebtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="evaluation:show">
				<li><a iconClass="application_form_magnify" target="dialog" rel="evaluation_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyevaluationreports/showcadidate"}' click="{fun:validShow}"><span><spring:message code="ggzyevaluationreport_showbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="evaluation:save">
				<li><a iconClass="application_add" target="dialog" rel="evaluation_annulled" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzyexceptionalcases?form&tendersId={slt_uid}&step=eval" click="{fun:validEvalAnnull}"><span><spring:message code="ggzybidopening_annulledbtn" /> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>
	<table class="table" id="evaluationreports" layoutH="137" width="100%">
		<thead>
			<tr>
				<%@ include file="thead.jsp"%>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>" data="<spring:eval expression="item.toJson({'ggzyBidOpenings','tenders.bidPro.businessWay.name','bidTime.time','expertApply.recordCount','expertApply.total','evaluationReport.finish','biddingCandidate.biddingCandidateFinish','biddingCandidate'})"/>">
					<%@ include file="tbody.jsp"%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
