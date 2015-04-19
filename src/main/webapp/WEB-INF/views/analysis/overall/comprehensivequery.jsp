<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/overall/comprehensivequery" var="listUrl_" />
<script type="text/javascript">
<!--
	function changeBusinessType() {
		var businessTypeId = $(this).val();
		$.ajax({
			url : '${contextPath}/business/ggzybusinesstypes/json/' + businessTypeId,
			success : function(data) {
				$('#majorType option').remove();
				$('#businessWay option').remove();
				$.each(data.ggzyBusinessTypeMajors, function(i, item) {
					$('#majorType').append("<option value='"+ item.majorType.majorTypeId +"'>" + item.majorType.name + "</option>");
				});
				$.each(data.ggzyBusinessTypeWays, function(i, item) {
					$('#businessWay').append("<option value='"+ item.businessWay.businessWayId +"'>" + item.businessWay.name + "</option>");
				});
			}
		});
	}
	function comprehensiveQuery(form, navTabId) {

		var $form = $(form);
		//if (form[DWZ.pageInfo.pageNum]) form[DWZ.pageInfo.pageNum].value = 1;
		if (form[DWZ.pageInfo.numPerPage])
			form[DWZ.pageInfo.numPerPage].value = 15;// 保存每页显示条数
		navTab.openTab("comprehensiveQuery", $form.attr('action'), {
			title : '综合查询结果',
			fresh : true,
			external : false,
			data : $form.serializeArray()
		});
		return false;
	}
	$(function() {
		$("#businessType").bind("change", changeBusinessType);
		$("#pagerForm", navTab.getCurrentPanel()).attr("onsubmit", "return comprehensiveQuery(this)");
	})
//-->
</script>
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li style="min-width: 100"><label>业务类型：</label> <select name="search_EQ_notice.bidPro.businessType.businessTypeId" id="businessType">
						<option value="">---请选择---</option>
						<c:forEach items="${businessTypes }" var="item">
							<option value="${item.businessTypeId}" ${param.business_type_id eq item.businessTypeId? "selected":"" }>${item.name }</option>
						</c:forEach>
				</select></li>
				<li style="min-width: 100"><label>专业类型：</label> <select name="search_EQ_notice.bidPro.majorType.majorTypeId" id="majorType">
				</select></li>
				<li style="min-width: 100;"><label>区域：</label>
					<div style="float: left;">
						<mh:lookUpTree rootId="2" group="search_EQ_notice.bidPro.basePro.area" />
					</div></li>
				<li style="min-width: 100"><label>交易方式：</label> <select name="search_EQ_notice.bidPro.businessWay.businessWayId" id="businessWay">
				</select></li>
			</ul>
			<ul class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label> <input type="text" name="search_LIKE_notice.bidPro.bidProName" value="${param['search_LIKE_notice.bidPro.bidProName'] }" /></li>
				<li><label><spring:message code="ggzybidpro_procode" />：</label> <input type="text" name="search_LIKE_notice.bidPro.proCode" value="${param['search_LIKE_notice.bidPro.proCode'] }" /></li>
				<li><label>代理机构：</label> <input type="text" name="search_LIKE_notice.bidPro.agency.subjectName" value="${param['search_LIKE_notice.bidPro.agency.subjectName'] }" /></li>
				<li><label>招标人：</label> <input type="text" name="search_LIKE_notice.bidPro.tenderee.subjectName" value="${param['search_LIKE_notice.bidPro.tenderee.subjectName'] }" /></li>
			</ul>
			<ul>
			<li class="searchContent"><label><spring:message code="ggzytenders_bidtime" />：</label> <input type="text" name="search_GTE_notice.bidDocSubEndtime" value="${param['search_GTE_notice.bidDocSubEndtime'] }" onfocus="WdatePicker()" />至<input type="text" name="search_LTE_notice.bidDocSubEndtime" value="${param['search_LTE_notice.bidDocSubEndtime'] }" onfocus="WdatePicker()" /></li>
				<input type="hidden" name="nv_" value="analysis/overall/querylist" />
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
