<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>公示审核情况</title>
</head>
<body>
	<div class="twotit">
		<a href="${contextPath }/management/index" class="floL hand backbt"></a>公示审核情况
	</div>
	<div class="titall">
		<div class="brief">
			<div class="sele">
				<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzynoticetenderses" page="${page }">
				名称:<input type="text" name="search_LIKE_notice.bidPro.basePro.proName" value="${param['search_LIKE_notice.bidPro.basePro.proName'] }" />
					<input type="hidden" name="nv_" value="${param['nv_'] }" />
					<input type="submit" value="查询" style="width: 50px" />
				</dwz:paginationForm>
			</div>
			<div class="wor marT10">
				<c:forEach var="item" items="${list}">
					<div class="wor marT10">
						<c:if test="${not empty item.bidPublicitiy.bidPublicityId}">
							<a href="${contextPath }/${business_ctx}/${module_path}/${item.bidPublicitiy.bidPublicityId}?businessTypeId=${item.notice.bidPro.businessType.businessTypeId}">
						</c:if>
						<div class="wortit">${item.notice.bidPro.proCode}</div>
						<div class="worww">
							${item.notice.bidPro.bidProName}<br /> ${item.tenders.tendersName}<br />
							<spring:eval expression="item?.bidPublicitiy?.subTime" />
							<br />${item.notice.bidPro.tenderee.subjectName},${item.notice.bidPro.agency.subjectName} <br /><font color="blue">${empty item.bidPublicitiy?"未制作":mh:auditStatus(item.bidPublicitiy.auditStatus) }</font>
						</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>