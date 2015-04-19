<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>场所预约</title>
</head>
<body>
	<div class="twotit">
		<a href="${contextPath }/management/index" class="floL hand backbt"></a>场所预约
	</div>
	<div class="titall">
		<div class="brief">
			<div class="sele">
				<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzynotices" page="${page }">
				名称:<input type="text" name="search_LIKE_bidPro.basePro.proName" value="${param['search_LIKE_bidPro.basePro.proName'] }" />
					<input type="hidden" name="nv_" value="${param['nv_'] }" />
					<input type="submit" value="查询" style="width: 50px" />
				</dwz:paginationForm>
			</div>
			<div class="wor marT10">
				<c:forEach var="item" items="${list}">
					<div class="wor marT10">
					<c:if test="${empty item.bidDocSubEndtime}">
						<a href="${contextPath }/${business_ctx}/ggzynotices/${item.noticeId}?businessTypeId=${item.bidPro.businessType.businessTypeId}&nv_=ggzybidsites/create"></c:if>
							<div class="wortit">${item.bidPro.proCode}</div>
							<div class="worww">
								${item.noticeName}<br />
								<spring:eval expression="item?.tendererDocGainEndTime" />
								<br />${item.bidPro.tenderee.subjectName},${item.bidPro.agency.subjectName} <br />
								${empty item.bidDocSubEndtime?"未":"已" }预约<spring:eval expression="item.bidDocSubEndtime"/>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>