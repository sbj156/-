<%@page import="com.lmd.util.HttpRequestDeviceUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath()%>/styles/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<title></title>
<script type="text/javascript">
//
	function test(){
		$.ajax({
			type:'POST',
			dataType:'json', cache: false,
			url : '<%=request.getContextPath()%>/business/ggzybiddingresnotices/confirm',
			data:{ids:'eyJub3RpY2VJZCI6IjQwMjg4MTU0NDhhMDZhMjIwMTQ4YTBkMTdjZTMwMDBhIiwidGVuZGVyc0lkIjoiNDAyODgxNTQ0OGEwNmEyMjAxNDhhMGQxNTQxZTAwMDkifQ'},
			success : function(data) {
				console.info(data);
			}
		});
	}
</script>
</head>
<body>
	<button onclick="test()">ajax</button>
</body>
</html>