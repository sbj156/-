<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
<title>审核公告</title>
</head>
<body>
  <c:set value="${contextPath }/${business_ctx}/${module_path }" var="listUrl_" />
	<div class="twotit"><a href="${contextPath }/management/index" class="floL hand backbt"></a>公告审核情况</div>
	<div class="titall">
		 <div class="brief">
			<div class="sele">
			<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzybidproes" page="${page }" >
				名称：<input type="text" name="search_LIKE_basePro.proName" value="${param["search_LIKE_basePro.proName"] }" />
				<input type="hidden" name="nv_" value="${param['nv_'] }"/>
				<input type="submit" value="查询"/>
			</dwz:paginationForm>			
			</div>
			<c:forEach var="item" items="${list}">
				<div class="wor marT10">
				<div class="wor marT10">
				<a href="${contextPath}/${business_ctx}/ggzynotices?nv_=ggzynotices/listofpro&search_EQ_bidPro.bidProId=${item.bidProId}&businessTypeId=${item.businessType.businessTypeId}">
					<div class="wortit">${item.proCode}
					    <br />${item.basePro.proName}</div>
					<div class="worww"> <spring:eval expression="item.createTime" />
						<br />${item.tenderee.subjectName},${item.agency.subjectName}
						<br />公告数量:${fn:length(item.ggzyNotices) }
					</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>