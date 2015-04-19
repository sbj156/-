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
				<input type="hidden" name="search_EQ_openned" value="${param['search_EQ_openned'] }" />
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
	function isOpen(time_) {
		try {
	 		var data = $.parseJSON($('#selectDataopenning', navTab.getCurrentPanel()).val());
			$(this).removeAttr('data') ;
			if(data['exceptionalCase']){
				alertMsg.warn('该标段已废标');
				return false;
			}
			
			if (data['ggzyBidOpenings']) {
				$(this).attr('data', '{"nv_":"ggzybidopenings/show"}');
			} else {
				
				var bidTime = new Date();
				bidTime.setTime(data['bidTime'].time);
				var d = new Date(time_.replaceAll("-", "/"));
				if (bidTime > d) {
					alertMsg.warn('未到开标时间');
					return false;
				}
				return true;
			}
		} catch (e) {
			console.error(e);
			return false;
		}
		return true;
	}
	function validShow() {
		var data = $.parseJSON($('#selectDataopenning', navTab.getCurrentPanel()).val());
		if (data['ggzyBidOpenings']) {
			return true;
		}
		alertMsg.warn('未记录唱标结果');
		return false;
	}
	function validAnnull(){
		var data = $.parseJSON($('#selectDataopenning', navTab.getCurrentPanel()).val());
		if (data['ggzyBidOpenings']) {
			alertMsg.warn('已记录唱标结果,无法进行废标操作');
			return false;
		}
		return true;
	}
//-->
</script>
<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<shiro:hasPermission name="bidopening:signlist">
				<li><a iconClass="application_form_magnify" target="dialog" rel="bidopening_signlist" minable='true' mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/{slt_uid}?nv_=ggzybidopenings/signlist"><span><spring:message code="ggzybidopening_signbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="bidopening:save">
				<li><a iconClass="application_add" target="dialog" rel="bidopening_add" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/${module_path}?form&tendersId={slt_uid}" click="{url:'${contextPath }/app/sysdate',fun:isOpen}"><span><spring:message code="ggzybidopening_add" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="bidopening:show">
				<li><a iconClass="application_add" target="dialog" rel="bidopening_show" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/${module_path}?form&tendersId={slt_uid}" data='{"nv_":"ggzybidopenings/show"}' click="{fun:validShow}"><span><spring:message code="ggzybidopening_showbtn" /> </span></a></li>
			</shiro:hasPermission>
			<shiro:hasPermission name="bidopening:annulled">
				<li><a iconClass="application_add" target="dialog" rel="bidopening_annulled" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzyexceptionalcases?form&tendersId={slt_uid}&step=openning" click="{fun:validAnnull}"><span><spring:message code="ggzybidopening_annulledbtn" /> </span></a></li>
			</shiro:hasPermission>
		</ul>
	</div>

	<table class="table" id="openning" layoutH="137" width="100%">
		<thead>
			<tr>
				<%@ include file="/WEB-INF/views/ggzytenderses/thead.jsp"%>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>" data="<spring:eval expression="item.toJson({'ggzyBidOpenings', 'bidTime.time', 'exceptionalCase'})"/>">
					<%@ include file="/WEB-INF/views/ggzytenderses/tbody.jsp"%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
