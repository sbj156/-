<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
	<title>招标公告</title>
	<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
	<script>
		function andriod() {
			window.location.href = 'http://www.baidu.com/';
		};
	</script>
</head>
<body>
<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bttop">
    <tr>
        <td class="name1" valign="middle"> </td>
    </tr>
</table> --%>
<div class="twotit"><span>业务处理</span><a href="http://www.baidu.com/" style="float:left;margin-top:13px;" ><img src="${contextPath}/styles/mobile/images/back.png" width="21" height="21" border="0" align="middle" id="head" /></a></div>
<mh:mobileMenuAccordion urlPrefix="${contextPath}" moduleId="1" child="${menuModule}"></mh:mobileMenuAccordion>
</body>
</html>
