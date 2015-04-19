<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$('input').attr('readonly','true');
})
</script>
<div class="pageContent">
	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
		<!--
		<p>
			<label>项目名称：</label>
			<input type="text" name="proName" value="${ggzyBasePro.proName}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>项目code：</label>
			<input type="text" name="proCode" value="${ggzyBasePro.proCode}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>区域：</label>
			<input name="area.id" value="${ggzyBasePro.area.id}" type="hidden"/>
			<input class="validate[required] required" name="area.name" type="text" readonly="readonly" value="${ggzyBasePro.area.name}" style="width: 140px;"/>
		</p>
		<p>
			<label>项目地址：</label>
			<input type="text" name="proAddress" value="${ggzyBasePro.proAddress}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>法定代表人：</label>
			<input type="text" name="legalPerson" value="${ggzyBasePro.legalPerson}" class="input-medium validate[required,maxSize[50]] required" maxlength="128"/>
		</p>
		<p>
			<label>资金来源：</label>
			<input type="text" name="capticalSource" value="${ggzyBasePro.capticalSource}" class="input-medium validate[required,maxSize[32]] required" maxlength="32"/>
		</p>		
		<p>
			<label>联系人：</label>
			<input type="text" name="contactPerson" value="${ggzyBasePro.contactPerson}" class="input-medium validate[required,maxSize[100]] required" maxlength="100" />
		</p>
		<p>
			<label>联系方式：</label>
			<input type="text" name="contactWay" value="${ggzyBasePro.contactWay}" class="input-medium validate[custom[phone],maxSize[32]]" maxlength="32"/>
		</p>		
				
		<p>
			<label>项目规模：</label>
			<input type="text" name="proScal" value="${ggzyBasePro.proScal}" class="input-medium validate[required,maxSize[32]] required" maxlength="32"/>
		</p>
		-->
 <div class="div_masge">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
   <tr>
    <td class="td1" style="width:20%">交易编号：</td>
    <td class="td2" style="width:20%">2014JSJL05Z0008</td>
    <td class="td1" style="width:30%">项目名称：</td>
    <td class="td2" style="width:30%">济南市宝华街道路改造工程监理</td>
    </tr>
	 <tr>
    <td class="td1">开标时间：</td>
    <td class="td2">2014-05-21</td>
    <td class="td1">代理机构：</td>
    <td class="td2">山东普道建设项目管理有限公司 </td>
    </tr>
   </table>
  </div>
		<div class="pageFormContent" layoutH="58">
			<div class="div_xmtj">
				<table  width="100%"  class="tble_masge">
					<caption>评标专家抽取信息</caption>
					<caption style="height:10px"></caption>
					<tr>
						<td class="td1">
						<input type="hidden"	name="businessType.businessTypeId" value="${param.business_type }" /> <label>抽取方式:</label>
						</td>
						<td class="td2"> <label>自动语音</label></td>
						<td class="td1">
                           <input type="hidden"
							name="businessType.businessTypeId"
							value="${param.business_type }" /> <label>通知方式:</label>
						</td>
						<td class="td2"> <label>自动语音</label></td>
					    <td class="td1"> <label>专家数量:</label></td>
						<td class="td2" colspan="4"> 共5个专家,其中业主专家0人,抽取专家5人</td>	
					</tr>
					<tr>		
						<td class="td1"> <label>开始抽取时间:</label></td>
						<td class="td2"> <label>2014-05-21 08:51 </label></td>
				        <td class="td1"> <label>结束抽取时间:</label></td>
						<td class="td2"> <label>2014-05-21 09:00</label></td>
						<td class="td1"><label>计划评标时间:</label></td>
					    <td class="td2"> <label>2014-05-21 10:00</label></td>
					</tr>
					<tr>
					    <td class="td1"><label>抽取人:</label></td>
						<td class="td2"><label>于喜洋</label></td>	
						<td class="td1"><label>监督人:</label></td>
					    <td class="td2"> 卢桂芝</label></td>
						<td class="td1"><label>抽取操作人:</label></td>
						<td class="td2"><label>王慧</label></td>
					</tr>
					</table>
					</div>
	</div>
</div>
<div class="formBar">
		<ul>
		    <li><div class="button"><div class="buttonContent"><button type="button" class="close">保存</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
</div>