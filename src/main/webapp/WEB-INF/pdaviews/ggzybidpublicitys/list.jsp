<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
<title>中标公示</title>
</head>
<body>
	<c:set value="${contextPath }/${business_ctx}/${module_path }" var="listUrl_" />
	<div class="twotit"><a href="${contextPath }/management/index" class="floL hand backbt"></a>审核公示</div>
	<div class="titall">
		<div class="brief">
			<div class="sele">
				<dwz:paginationForm action="${listUrl_ }" page="${page }">
	名称:<input type="text" name="search_LIKE_noticeTenders.notice.bidPro.basePro.proName" value="${param["search_LIKE_noticeTenders.notice.bidPro.basePro.proName"] }" />
					<input type="hidden" name="nv_" value="${param['nv_'] }" />
					<input type="hidden" name="businessTypeId" value="${param['businessTypeId'] }" />
					<input type="submit" value="查询" style="width: 50px" />
				</dwz:paginationForm>
			</div>
			<div class="wor marT10">
				<c:forEach var="item" items="${list}">
					<div class="wor marT10">
						<a href="${contextPath }/${business_ctx}/${module_path}/${item.bidPublicityId}?nv_=${module_path}/${empty item.auditStatus||item.auditStatus < 1? "audit":"show"}&businessTypeId=${item.noticeTenders.notice.bidPro.businessType.businessTypeId}">
							<div class="wortit">${item.noticeTenders.notice.bidPro.proCode}</div>
							<div class="worww">
								${item.noticeTenders.notice.bidPro.bidProName}${item.auditStatus}<br /> ${item.noticeTenders.tenders.tendersName}<br />
								<spring:eval expression="item.subTime" />
								<br />${item.noticeTenders.notice.bidPro.tenderee.subjectName},${item.noticeTenders.notice.bidPro.agency.subjectName} <br /><font color="blue">${mh:auditStatus(item.auditStatus)}</font>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>