<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<c:set value="${contextPath }/${business_ctx}/ggzynoticetenderses" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }"
	onsubmit="return navTabSearch(this)">
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
	function validMake() {
		var data = $.parseJSON($('#selectDatapublicities',navTab.getCurrentPanel()).val());
		if (data['bidPublicitiy']) {
			alertMsg.warn("<spring:message code="ggzybidpublicity_maked"/>");
			return false;
		}
		return true;
	}
//-->
</script>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="publicity:save">
			<li><a iconClass="application_form_magnify" target="dialog" rel="publicity_add" minable='true' width="900" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}" data='{"nv_":"${module_path }/create"}' click="{fun:validMake}"><span><spring:message code="ggzybidpublicity_addbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="publicity:show">
			<li><a iconClass="application_form_magnify" target="navTab" minable='true' mask="true" width="900" height="600" ref="pulicitys_list" href="${contextPath }/${business_ctx}/${module_path}?search_EQ_noticeTenders.id={slt_uid}" data='{"nv_":"${module_path }/list"}'><span><spring:message code="ggzybidpublicity_showlistbtn" /> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" id="publicities" layoutH="137" width="100%">
		<thead>
			<tr>
				<%@ include file="/WEB-INF/views/ggzytenderses/thead.jsp"%>
				<th width="100"><spring:message code="ggzybidpublicity_makestatus" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>" data="<spring:eval expression="item.toJson({'ggzyBidOpenings','bidPublicitiy'})"/>">
					<%@ include file="/WEB-INF/views/ggzytenderses/tbody.jsp"%>
					<td>${empty item.bidPublicitiy ?"未制作":"已制作" }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
