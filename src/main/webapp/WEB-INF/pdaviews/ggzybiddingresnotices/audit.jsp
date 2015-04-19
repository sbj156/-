<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp"%>
<title>审核中标通知书</title>
<script src="${contextPath}/styles/mobile/mobiscroll-2.5.2/js/mobiscroll.core-2.5.2.js" type="text/javascript"></script>
<script src="${contextPath}/styles/mobile/mobiscroll-2.5.2/js/mobiscroll.core-2.5.2-zh.js" type="text/javascript"></script>
<link href="${contextPath}/styles/mobile/mobiscroll-2.5.2/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/styles/mobile/mobiscroll-2.5.2/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />
<script src="${contextPath}/styles/mobile/mobiscroll-2.5.2/js/mobiscroll.datetime-2.5.1.js" type="text/javascript"></script>
<script src="${contextPath}/styles/mobile/mobiscroll-2.5.2/js/mobiscroll.datetime-2.5.1-zh.js" type="text/javascript"></script>
<!-- S 可根据自己喜好引入样式风格文件 -->
<script src="${contextPath}/styles/mobile/mobiscroll-2.5.2/js/mobiscroll.android-ics-2.5.2.js" type="text/javascript"></script>
<link href="${contextPath}/styles/mobile/mobiscroll-2.5.2/css/mobiscroll.android-ics-2.5.2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
        $(function () {
			var currYear = (new Date()).getFullYear();	
			var opt={};
			opt.date = {preset : 'date'};
			//opt.datetime = { preset : 'datetime', minDate: new Date(2012,3,10,9,22), maxDate: new Date(2014,7,30,15,44), stepMinute: 5  };
			opt.datetime = {preset : 'datetime'};
			opt.time = {preset : 'time'};
			opt.default = {
				theme: 'android-ics light', //皮肤样式
		        display: 'modal', //显示方式 
		        mode: 'scroller', //日期选择模式
				lang:'zh',
		        startYear:currYear , //开始年份
		        endYear:currYear + 10 //结束年份
			};

			
		  	var optDateTime = $.extend(opt['datetime'], opt['default']);
		    $("input[name='allowPrintTime']").mobiscroll(optDateTime).datetime(optDateTime);
			
			//下面注释部分是上面的参数可以替换改变它的样式
			//希望一起研究插件的朋友加我个人QQ也可以，本人也建个群 291464597 欢迎进群交流。哈哈。这个不能算广告。
			// 直接写参数方法
			//$("#scroller").mobiscroll(opt).date(); 
			// Shorthand for: $("#scroller").mobiscroll({ preset: 'date' });
			//具体参数定义如下
		    //{
		    //preset: 'date', //日期类型--datatime --time,
		    //theme: 'ios', //皮肤其他参数【android-ics light】【android-ics】【ios】【jqm】【sense-ui】【sense-ui】【sense-ui】
										//【wp light】【wp】
		    //mode: "scroller",//操作方式【scroller】【clickpick】【mixed】
		    //display: 'bubble', //显示方【modal】【inline】【bubble】【top】【bottom】
		    //dateFormat: 'yyyy-mm-dd', // 日期格式
		    //setText: '确定', //确认按钮名称
		    //cancelText: '清空',//取消按钮名籍我
		    //dateOrder: 'yymmdd', //面板中日期排列格
		    //dayText: '日', 
		    //monthText: '月',
		    //yearText: '年', //面板中年月日文字
		    //startYear: (new Date()).getFullYear(), //开始年份
		    //endYear: (new Date()).getFullYear() + 9, //结束年份
		    //showNow: true,
		    //nowText: "明天",  //
		    //showOnFocus: false,
		    //height: 45,
		    //width: 90,
		    //rows: 3}

        });
    </script>
</head>
<body>
	<div class="pageContent">
		<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this,subCallback,'确认要提交审核结果吗');">
			<%@include file="auditform.jsp"%>
			<div class="formBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">确定</button>
							</div>
						</div></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
function subCallback(data){
	location.href="${backUrl}";
}
</script>
