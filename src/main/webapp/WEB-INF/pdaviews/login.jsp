<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui">
	<title>登录</title> <%@ include file="/WEB-INF/pdaviews/head.jsp"%>
	<script type="text/javascript">
<c:if test="${msg!=null }">
alert("${msg }");
</c:if>
function validate(){
	if($("input[name='username']").val().length < 2 || $("#phone").text().length < 11){
		alert("请输入正确且已绑定手机号的用户名");
		return false;
	}
	if($("input[name='captcha_key']").val().length < 4){
		alert("请输入正确的验证码");
		return false;
	}
	return true;
}
var leftSeconds;
function getUp(){
	if($("input[name='username']").val().trim().length == 0){
		alert("请输入用户名");
		return;
	}
	
	$("#captcha_btn").attr("disabled", true);
	jQuery.ajax({
        type: 'POST',
        dataType: "text",
        url: '${contextPath}/userp',
        data:{
			username:$("input[name='username']").val()
		},
        error: function() { 
        	 alert('用户不存在或未绑定手机');
        	 $("#phone").text("");
            $("#captcha_btn").removeAttr("disabled");
        },
        success: function(data) { 
        	$("#phone").text(data);
        	jQuery.ajax({
                type: 'get',
                url: '${contextPath}/Captcha.jpg',
                data:{
        			username:$("input[name='username']").val()
        		},
                error: function(request) { 
                	 alert('发送验证码失败,请联系管理员处理,');
                },
                success: function(data) { 
                	leftSeconds = 60;
                	InterValObj = window.setInterval(reSendTime, 1000);
        		}
            });
		}
    });
}
function reSendTime(){
	if(leftSeconds > 0)
		$("#captcha_btn").text((leftSeconds--) + "秒后重发");
	else{
		window.clearInterval(InterValObj);
		$("#captcha_btn").text("发送验证码");
		$("#captcha_btn").removeAttr("disabled");
	}
}

function sendCaptha(){
	if($("#phone").text().length < 11){
		alert("请输入正确且已绑定手机号的用户名");
		return false;		
	}
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="${contextPath}/styles/mobile/css/main.css" />
<body class="body1">
	<div class="dldiv1"></div>
	<form method="post" action="${contextPath}/login" id="formID" onsubmit="return validate()">
		<table width="230" border="0" cellspacing="0" cellpadding="0" class="srk" align="center">
			<tr>
				<td align="right"><span>用户名</span></td>
				<td align="left" class="tdmr"><input type="text" name="username" style="width: 120px;" class="validate[required] login_input" id="username" value="${username }"/></td>
			</tr>
			<tr id="ph">
				<td align="right"><span>手机号</span></td>
				<td align="left" class="tdmr"><a id="phone"></a><br/><button id="captcha_btn" type="button" onclick="getUp()">发送验证码</button></td>
			</tr>
			<tr>
				<td align="right"><span>验证码</span></td>
				<td align="left" class="tdmr"><input type="text" name="captcha_key" style="width: 120px;" class="validate[required] login_input" id="captcha_key" value="" /></td>
			</tr>
			<tr>
				<td align="right"><span>密&nbsp;&nbsp;&nbsp;码</span></td>
				<td align="left" class="tdmr"><input type="password" name="password" style="width: 120px;" class="validate[required] login_input" id="password" /></td>
			</tr>
			<tr>
				<td colspan="2" height="20"></td>
			</tr>
			<tr>
				<td align="right">
				<button type="button" style="border: 0px; background:none;"><a href="http://www.baidu.com/"><img src="${contextPath}/styles/mobile/images/back_.png" style="height: 24px;" class="hand"></a></button>
				</td>
				<td align="center">
				<button type="submit" style="border: 0px; background:none;"><img src="${contextPath}/styles/mobile/images/dlmon.png" style="height: 24px;" class="hand"/></button>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="20"></td>
			</tr>
		</table>
	</form>
	<div class="dldiv2"></div>
</body>
</html>
