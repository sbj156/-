<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<c:set value="${contextPath }/${business_ctx}/ggzynoticetenderses" var="listUrl_"/>
<dwz:paginationForm
	action="${listUrl_ }"  page="${page }"
	onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_notice.bidPro.basePro.proName" value="${param['search_LIKE_notice.bidPro.basePro.proName'] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode" />：</label> <input type="text" name="search_LIKE_notice.bidPro.proCode" value="${param['search_LIKE_notice.bidPro.proCode'] }" /></li>
				<li><label><spring:message code="ggzytenders_bidtime" />：</label> <input type="text" name="search_GTE_bidTime" value="${param['search_GTE_bidTime'] }" onfocus="WdatePicker()" /></li>

				<input type="hidden" name="nv_" value="${param['nv_'] }" />
				<input type="hidden" name="search_EQ_openned" value="${param['search_EQ_openned'] }" />
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit"><spring:message code="searchbtn"/> </button>
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
	var data = $.parseJSON( $('#selectDataexpert', navTab.getCurrentPanel()).val());
	if(data['expertApply']){
		$(this).attr('data','{"nv_":"ggzyexpertapplys/showextract"}');
	}else{
		$(this).attr('data','{"nv_":"ggzyexpertapplys/extract"}');
	}
	return true;
}
function validShowExtract(){
	var data = $.parseJSON( $('#selectDataexpert', navTab.getCurrentPanel()).val());
	if(data['expertApply']){
		$(this).attr('data','{"nv_":"ggzyexpertapplys/showextract"}');
		return true;
	}
	alertMsg.warn('未记录专家抽取结果');
	return false;
}
function validRecord(){
	var data = $.parseJSON( $('#selectDataexpert', navTab.getCurrentPanel()).val());
	if(!data['expertApply']){
		alertMsg.warn('未记录专家抽取结果');
		return false;
	}else if(data['expertApply']['recordCount'] > 0){
		$(this).attr('data','{"nv_":"ggzyexpertapplys/showrecord"}');
		return true;
	}
	$(this).attr('data','{"nv_":"ggzyexpertapplys/record"}');
	return true;
}
function validShowRecord(){
	var data = $.parseJSON( $('#selectDataexpert', navTab.getCurrentPanel()).val());
	if(!data['expertApply']){
		alertMsg.warn('未记录专家抽取结果');
		return false;
	}else if(data['expertApply']['recordCount'] > 0){
		return true;
	}
	alertMsg.warn('未记录专家');
	return false;
}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
				<shiro:hasPermission name="expert_apply:extract">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="expert_apply_extract" minable='true' mask="true" width="900" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyexpertapplys/extract"}' click="{fun:isExtract}"><span><spring:message code="ggzyexpertapply_extractbtn"/> </span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="expert_apply:showextract">
				<li><a iconClass="application_form_magnify" target="dialog"
					rel="expert_apply_extract" minable='true' mask="true" width="900" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"ggzyexpertapplys/showrecord"}' click="{fun:validShowExtract}"><span><spring:message code="ggzyexpertapply_showextractbtn"/> </span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="expert_apply:record">
				<li><a iconClass="application_add" target="dialog"
					rel="expert_apply_record" mask="true" width="900" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" click="{fun:validRecord}" data='{"nv_":"ggzyexpertapplys/record"}'><span><spring:message code="ggzyexpertapply_recordexpertbtn"/> </span></a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="expert_apply:showrecord">
				<li><a iconClass="application_add" target="dialog"
					rel="expert_apply_record" mask="true" width="900" height="600"
					href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" click="{fun:validShowRecord}" data='{"nv_":"ggzyexpertapplys/showrecord"}'><span><spring:message code="ggzyexpertapply_showrecordbtn"/> </span></a></li>
				</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" id="expert" layoutH="137" width="100%">
		<thead>
			<tr>
				<%@ include file="thead.jsp"%>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>" data="<spring:eval expression="item.toJson({'bidTime.time','expertApply','expertApply.recordCount','expertApply.total'})"/>">
					<%@ include file="tbody.jsp"%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
