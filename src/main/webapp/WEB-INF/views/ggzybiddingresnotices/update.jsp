<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('input').attr('readonly','true');
})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
		<div class="panel" defH="90">
			<h1>项目基本信息</h1>
			<div>
				 
					 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
					   <tr height=20>
						<td    style="width:20%">交易编号：</td>
						<td  style="width:20%">2014JSSZ04Z0005</td>
						<td  style="width:10%">项目名称：</td>
						<td>化纤厂B-1地块住宅及其配套公建（一期）</td>
						</tr>
						<tr height=20 >
						<td >招标人：</td>
						<td >济南热电有限公司</td>
						<td >代理机构：</td>
						<td >济南安邦置业有限公司<</td>
						</tr>
						<tr height=20 >
						<td >招标人委托代建单位：</td>
						<td >--</td>
						<td >开标时间：</td>
						<td >2014-05-20 09:30</td>
						</tr>
						<tr height=20 >
						<td >招标人委托代建单位：</td>
						<td colspan="3">山东阳光招标有限公司</td>
						
						</tr>
					 </table>
					
			</div>
		</div>
		
		<table class="list" width="100%" >
			<thead>
				
				<tr >
					<th width="150" align="center">序号</th>
					<th width="150" align="center">中标标段</th>
					<th width="150" align="center">中标企业</th>
					<th width="150" align="center">打印确认时间</th>
				
				</tr>				
			</thead>
			<tbody>
				
				
				<tr height=25>
					<td width="150" align="center">1</td>
					<td width="150" align="center">第二标段</td>
					<td width="150" align="center">山东新昌隆建设咨询有限公司</td>
					<td width="150" align="center"><a target="blank" href="http://192.168.0.181:7001/jnggzyjy/zhgl/bidnotice/view_zftzs.jsp?CORRECTION_GUID=10385&type=y">2014-05-21</a></td>
				</tr>
			
				
			</tbody>
		</table>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</div>