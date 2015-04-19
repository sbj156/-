<%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>济南公共资源交易网综合管理</title>

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

<script type="text/javascript">
jQuery(document).ready(function(){
    //jQuery("#formID").validationEngine();
});

<c:if test="${msg!=null }">
alert("${msg }");
</c:if>
</script>
    <style>
        body{font-size:10pt;}
        table{font-size:10pt;}
        tr{font-size:10pt;}
        td{font-size:10pt;}
        .btn_ok {
            font-size: 9pt; cursor: hand; color: #2b333c; padding-top: 1px; height: 22px;width:60px
        }
        .btn_ok {
            border-right: #acb5b5 1px double; border-top: #c4cccc 1px double; background: #ffffff repeat-x; border-left: #acb5b5 1px double; border-bottom: #6f7777 1px double;height: 22px;width:60px
        }
    </style>
</head>

<body  text="#666666" vlink="#997799" alink="#339900" link="#003399" bgcolor="#c8d3dc" leftmargin="0" background="${contextPath}/styles/images/login_loginbg.gif" topmargin="0" marginheight="0" marginwidth="0">
<OBJECT id="JITDSignOcx" width="0" height="0"
			classid="clsid:06CA9432-D9BD-4867-8475-770B131E1759">
		</OBJECT>
	<form method="post" action="${contextPath}/login" id="formID" onsubmit="return sub_()">
			<input type="hidden" name="caName">
				<input type="hidden" name="SignnedData">
        <table width="100%" height="350" cellspacing="0" cellpadding="0" align="center" border="0" background="${contextPath}/styles/images/bg.jpg">
            <tbody><tr>
                <td>&nbsp;</td>
                <td width="480">
                    <table cellspacing="0" cellpadding="0" align="center" border="0" width="100%">
                        <tbody><tr>
                            <td height="50"></td>
                        </tr>
                        </tbody></table>
                    <table cellspacing="0" cellpadding="1" align="center" border="0" height="290" width="100%" style="border:1px solid #cccccc;background-color:#ffffff">
                        <tbody><tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" align="center" border="0" height="85" width="100%" bgcolor="#A2CEFF">
                                    <tbody><tr>
                                        <td align="center" valign="middle"><font style="font-family: &#39;黑体&#39;;font-size: 20px;">济南公共资源交易系统</font>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    </tbody></table>
                                <table cellspacing="0" cellpadding="0" align="center" border="0" height="60" width="100%" bgcolor="#A2CEFF">
                                    <tbody><tr>
                                        <td valign="middle" align="center">
                                            <table cellspacing="0" cellpadding="0" align="center" style="padding-left:10px;border-left:1px solid #333333;border-right:1px solid #333333" height="" width="256">
                                                <tbody><tr>
                                                    <td align="left" valign="middle"></td>
                                                </tr>
                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                                <table cellspacing="0" cellpadding="0" align="center" border="0" width="100%" bgcolor="#6B849B">
                                    <tbody><tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    </tbody></table>
                                <table cellspacing="0" cellpadding="0" align="center" border="0" height="127" width="100%" bgcolor="#f5f9ee">
                                    <tbody><tr>
                                        <td>
                                            <table cellspacing="3" cellpadding="3" border="0">
                                                <tbody><tr>
                                                    <td width="45">&nbsp;</td>
                                                    <td width="137" align="right" valign="bottom">登录名：</td>
                                                    <td width="294">
							<input type="text" name="username"  style="font:12px;width:147px;height:18px;border-right:0px;border-left:0px;border-bottom:1px solid #cccccc;border-top: 0px;background-color:#f5f9ee" class="validate[required] login_input" id="username" value="${username }"/>
							</td>
						</tr>
                                                <tr>
                                                    <td width="45">&nbsp;</td>
                                                    <td width="137" align="right" valign="bottom">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                                    <td width="294"><input type="password" name="password" style="font:12px;width:147px;height:18px;border-right:0px;border-left:0px;border-bottom:1px solid #cccccc;border-top: 0px;background-color:#f5f9ee" class="validate[required] login_input" id="password"/></td>
						</tr>
                                                <tr>
                                                    <td width="45">&nbsp;</td>
                                                    <td width="137">&nbsp;</td>
                                                    <td width="294"><input type="submit" name="Submit" value="登  录" class="btn_ok" onclick="return CAlogin()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重  填" class="btn_ok"></td>
                                                </tr>
                                                </tbody></table>
                                        </td>
                                    </tr>
                                    </tbody></table>
                            </td>
                        </tr>
                        </tbody></table>
                </td>
                <td>&nbsp;</td>
            </tr>
            </tbody></table>
	</form>
</body>
</html>
