<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>废标管理</title>
</head>
<body>
	<div class="twotit">
		<a href="${contextPath }/management/index" class="floL hand backbt"></a>废标管理
	</div>
	<div class="titall">
		<div class="brief">
			<div class="sele">
				<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzyexceptionalcases?" page="${page }">
					<spring:message code="ggzybasepro_proname" />：<input type="text" name="search_LIKE_noticeTenders.tenders.bidPro.basePro.proName" value="${param['search_LIKE_noticeTenders.tenders.bidPro.basePro.proName'] }" />
					<input type="hidden" name="nv_" value="${param['nv_'] }" />
					<input type="submit" value="查询" style="width: 50px" />
				</dwz:paginationForm>
			</div>
			<div class="wor marT10">
				<c:forEach var="item" items="${list}">
					<div class="wor marT10">
						<a href="${contextPath }/${business_ctx}/ggzyexceptionalcases/<spring:eval expression="item.noticeTenders.id"/>?${empty item.dealWay?"form":""}&businessTypeId=${item.noticeTenders.notice.bidPro.businessType.businessTypeId}" >
							<div class="wortit">${item.noticeTenders.notice.bidPro.proCode}</div>
							<div class="worww">
								${item.noticeTenders.notice.bidPro.bidProName}<br /> ${item.noticeTenders.tenders.tendersName}<br />
								<spring:eval expression="item.subTime" />
								<br />${item.noticeTenders.notice.bidPro.tenderee.subjectName},${item.noticeTenders.notice.bidPro.agency.subjectName} <br /><font color="blue">${empty item.dealWay ?"未":"已"}处理</font>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
