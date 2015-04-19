<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/${module_path}/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
	<div class="panel" defH="90">
			<h1>项目基本信息</h1>
			<div>
				 
					 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
					   <tr height=20>
						<td    style="width:20%">交易编号：</td>
						<td  style="width:40%">2014JSSG02Z00019</td>
						<td  style="width:10%">项目名称：</td>
						<td>绿地新都会一期西河片区C-2地块项目施工</td>
						</tr>
						<tr height=20 >
						<td >招标人：</td>
						<td >绿地新都会一期西河片区C-2地块项目施工</td>
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
						<td >招标代理机构：</td>
						<td colspan="3">济南忠诚信工程咨询有限公司</td>
						
						</tr>
					 </table>
					
			</div>
		</div>
<!--
        <p>
		<tr>
			<td> 交易编号:</td>
			<td>2014JSSG02Z00019</td>
		</tr>
		</p>
		<p>
		<tr>
			<td> 项目名称：</td>
			<td>绿地新都会一期西河片区C-2地块项目施工 </td>
		</tr>
		</p>
		
		<p>
	    <tr>
			<td> 招标人：</td>
			<td>绿地新都会置业 </td>
		</tr>
		</p>	
		<p>
	    <tr>
			<td> 招标人委托代建单位：</td>
			<td>--- </td>
		</tr>
		</p>

          <p>
	    <tr>
			<td> 开标时间：</td>
			<td>2014-05-28 </td>
		</tr>
		</p>

       <p>
	    <tr>
			<td>招标代理机构：</td>
			<td>济南忠诚信工程咨询有限公司</td>
		</tr>
		</p>
		-->
<table class="list" width="100%">
		<thead>
			<tr>
				
				<th  width="50">序号</th>
                <th width="300">企业名称</th>
				<th width="100">企业详细信息</th>
		        <th width="150">签到信息</th>
		        <th width="150">所投标段</th>
			</tr>
		</thead>
		<tbody>
			<tr height=25>
				<td   align="center" width="50">1</td>
	    		<td width="300">山东新昌隆建设咨询有限公司</td>
		
			   <td align="center"width="100">查看</td>
				<td  align="center"width="150">签到</td>
				<td  align="center"width="150">--</td>
			</tr>
			<tr height=25>
		
			
				<td  align="center" width="50">2</td>
	    		<td  width="300">山东中恒建设集团有限公司</td>
		
			   <td align="center" width="100">查看</td>
				<td align="center" width="150">签到</td>
				<td align="center" width="150">---</td>
				
			</tr>
				
			<tr height=25>
		
			
				<td  align="center" width="50">3</td>
	    		<td width="300">山东科信达建筑安装有限公司</td>
		
			   <td align="center" width="100">查看</td>
				<td  align="center" width="150">签到</td>
				<td  align="center" width="150">--</td>
				
			</tr>
			<tr height=25>
		
			
				<td  align="center" width="50">4</td>
	    		<td width="300">山东三箭建设工程股份有限公司</td>
		
			   <td align="center"width="100">查看</td>
				<td  align="center"width="150">已签到</td>
				<td  align="center"width="150">第一标段</td>
				
			</tr>
		</tbody>
	</table>
		
	</div>



			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>