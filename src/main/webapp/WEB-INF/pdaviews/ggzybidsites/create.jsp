<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
<title>场所预约</title>
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

			
		  	var optDateTime = $.extend(opt['date'], opt['default']);
		    $("input[name='notice.bidDocSubEndtime']").mobiscroll(optDateTime).date(optDateTime);
			
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

<c:if test="${empty ggzyBidPro}">
	<c:set var="ggzyBidPro" value="${ggzyNotice.bidPro }" />
</c:if>
<c:set var="backUrl" value="${contextPath }/${business_ctx}/ggzynotices?nv_=ggzybidsites/noticelist&orderField=tendererDocGainTime&search_EQ_auditStatus=2&businessTypeId=${ ggzyBidProo.businessType.businessTypeId}&taskId=appointment"/>
<form method="post" action="${contextPath }/${business_ctx}/${module_path}" class="required-validate pageForm" onsubmit="return validateCallback(this,subCallback,'确认要保存吗');">
<c:choose>
	<c:when test="${empty ggzyNotice}">
		<c:set value="${noticeTenders.notice}" var="ggzyNotice"/>
		<spring:eval expression="noticeTenders?.bidTime" var="bidTime"/>
		<input type="hidden" name="tenders.tendersId" value="${noticeTenders.id.tendersId}" />
	</c:when>
	<c:otherwise>
		<spring:eval expression="ggzyNotice?.bidDocSubEndtime" var="bidTime"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="notice.noticeId" value="${ggzyNotice.noticeId }" />
<div class="twotit">
          <a href="javascript:location.href='${backUrl }'" class="floL hand backbt"></a> 场所预约
        </div>
		<div class="pageFormContent" layoutH="58">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr>
				<td style="width: 100px"><spring:message code="ggzybidpro_procode"></spring:message>：</td>
				<td class="td2">${ggzyBidPro.proCode }</td>
			</tr>
			<tr>	
				<td class="td1"><spring:message code="ggzybasepro_proname"></spring:message>：</td>
				<td class="td2">${ggzyBidPro.bidProName }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzybidpro_businesstype" /> ：</td>
				<td class="td2">${ggzyBidPro.businessType.name }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzybidpro_businessway" />：</td>
				<td class="td2">${ggzyBidPro.businessWay.name }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzybidpro_tenderee" />：</td>
				<td class="td2">${ggzyBidPro.tenderee.subjectName }</td>
			</tr>
			
			<tr>
				<td class="td1"><spring:message code="ggzybidpro_agency" />：</td>
				<td class="td2">${ggzyBidPro.agency.subjectName }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzynotice_noticenature" />：</td>
				<td class="td2">${ggzyNotice.noticeNature.name }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzynotice_noticetype" />：</td>
				<td class="td2">${ggzyNotice.noticeType.name }</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzynotice_tendererdocgaintime" />：</td>
				<td class="td2"><spring:eval expression="ggzyNotice?.tendererDocGainTime"/></td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzynotice_tendererdocgainendtime" />：</td>
				<td class="td2"><spring:eval expression="ggzyNotice?.tendererDocGainEndTime"/></td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzynotice_noticename" />：</td>
				<td class="td2" >${ggzyNotice.noticeName}</td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzybidpro_ggzytenderss" />：</td>
				<td class="td2" style="line-height: 30px">
				<c:forEach var="item" items="${ggzyNotice.noticeTenderses }">
					${item.tenders.tendersName }<br>
				</c:forEach>
				</td>
			</tr>		
			<tr>
				<td class="td1"><spring:message code="ggzynotice_pubresponsible" />：</td>
				<td class="td2">${ggzyNotice.pubResponsible}</td>
			</tr>
			<tr>
			<td class="td1" ><label>开标日期：</label></td>

			<td class="td2"><input id="bidtime" type="text" name="notice.bidDocSubEndtime" readonly="readonly" value="<fmt:formatDate value="${bidTime.time}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="validate[maxSize[50],required,ajax[ajaxBidSite]] required" onchange="$(this).val($(this).val()+' 9:30:00')"/></td>
		</tr>
		</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
			</ul>
		</div>
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