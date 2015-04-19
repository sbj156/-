<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>济南公共资源交易中心管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${contextPath}/styles/validationEngine/css/validationEngine.jquery.css" type="text/css"/>
<script src="${contextPath}/styles/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/styles/ca/ca.js" type="text/javascript"></script>
<script src="${contextPath}/styles/validationEngine/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/styles/validationEngine/js/jquery.validationEngine-2.6.4.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}

body {
	background-color: #1C7BBF;
	margin-left: 0px;
	margin-top: 20px;
	margin-right: 0px;
}

.STYLE7 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 14px;
}
-->
</style>
<script type="text/javascript">
jQuery(document).ready(function(){
    //jQuery("#formID").validationEngine();
});

<c:if test="${msg!=null }">
alert("${msg }");
</c:if>
</script>
</head>

<body>
<OBJECT id="JITDSignOcx" width="0" height="0"
			classid="clsid:06CA9432-D9BD-4867-8475-770B131E1759">
		</OBJECT>
	<form method="post" action="${contextPath}/login" id="formID" onsubmit="return sub_()">
			<input type="hidden" name="caName">
				<input type="hidden" name="SignnedData">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td background="${contextPath}/styles/images/admin_002.jpg"
					bgcolor="#8AA3BD">&nbsp;</td>
				<td width="900" background="${contextPath}/styles/images/admin_002.jpg"
					bgcolor="#FFFFFF"><object
						classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
						width="1000" height="374">
						<param name="movie" value="${contextPath}/styles/images/frist123.swf">
						<param name="quality" value="high">
						<embed src="${contextPath}/styles/images/frist123.swf" quality="high"
							pluginspage="http://www.macromedia.com/go/getflashplayer"
							type="application/x-shockwave-flash" width="1000" height="374"></embed>
					</object></td>
				<td background="${contextPath}/styles/images/admin_002.jpg">&nbsp;</td>
			</tr>
			<tr>
				<td background="${contextPath}/styles/images/admin_003.jpg"
					bgcolor="#FFFFFF"><img
					src="${contextPath}/styles/images/admin_003.jpg" width="1" height="163" /></td>
				<td height="164" background="${contextPath}/styles/images/6.jpg">
				<table width="60%"
						height="90" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="14%" height="12" align="center">&nbsp;</td>
							<td width="22%" align="center">&nbsp;</td>
							<td>&nbsp;</td>
							<td rowspan="4" align="left" valign="bottom" ><button type="submit" style="border: 0px; background:none;"><img
									onmouseover='this.src="${contextPath}/styles/images/admin_004.jpg"'
									src="${contextPath}/styles/images/admin_001.jpg"
									onmouseout='this.src="${contextPath}/styles/images/admin_001.jpg"' width="67"
									height="73" border="0" /></button></td>
						</tr>
						<tr>
							<td height="25" align="center">&nbsp;</td>
							<td height="25" align="right"><span class="STYLE7">用户名：</span></td>
							<td >
							<input type="text" name="username" style="width: 120px;" class="validate[required] login_input" id="username" value="${username }"/>
							</td>
						</tr>
						<tr>
							<td height="25" align="center">&nbsp;</td>
							<td height="25" align="right"><span class="STYLE7">密&nbsp;&nbsp;码：</span></td>
							<td><input type="password" name="password" style="width: 120px;" class="validate[required] login_input" id="password"/></td>
						</tr>
						<tr>
							<td height="15" colspan="4">&nbsp;</td>
						</tr>
					</table></td>
				<td background="${contextPath}/styles/images/admin_003.jpg" bgcolor="#FFFFFF">&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
