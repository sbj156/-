<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="backUrl" value="/ggzy/business/ggzybidproes?nv_=ggzynotices/list&orderField=createTime&businessTypeId=F785D42A3F81B399E040007F0100159F&taskId=makenotice_js&taskId=makenotice"/>
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
<title>招标公告</title>
</head>
<body>
	<div class="twotit"> <a href="javascript:location.href='${backUrl }'" class="floL hand backbt"></a>招标公告</div>
	<div class="titall">
		<div class="brief">
			<c:forEach var="item" items="${list}">
				<div class="wor marT10">
					<div class="wor marT10">
						<a href="${contextPath}/${business_ctx}/ggzynotices/${item.noticeId}?businessTypeId=${item.bidPro.businessType.businessTypeId}">
							<div class="wortit">
								${item.bidPro.proCode} 
							</div>
							<div class="worww">
								${item.bidPro.bidProName}<br /> ${item.noticeName}<br />
								<spring:eval expression="item.makeTime" />
								<br />${item.bidPro.tenderee.subjectName},${item.bidPro.agency.subjectName} <br /> <font color="blue">${mh:auditStatus(item.auditStatus) }</font>
							</div>
						</a>
					</div>
					<div class="wor marT10"></div>
			</c:forEach>
		</div>
	</div>
</body>
</html>