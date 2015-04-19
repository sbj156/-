<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		$('input').attr('readonly', 'true');
		$(".tble_masge").each(function(){
			$(this).find("tr:even").addClass("even");
			$(this).find("tr:odd").addClass("odd");
		
			})
	})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}" />
	<div class="pageFormContent" layoutH="58">
		<!--	
					
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
		</p>-->


		
<div class="div_masge">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
  <tr>
    <td class="td1" style="width:25%">交易编号：</td>
    <td class="td2" style="width:25%">2014JSSG02Z00019</td>
    <td class="td1" style="width:25%">项目名称：</td>
    <td class="td2" style="width:25%">绿地新都会</td>
    </tr>
     <tr>
    <td class="td1">交易编号：</td>
    <td class="td2">2014JSSG02Z00019</td>
    <td class="td1">项目名称：</td>
    <td class="td2">绿地新都会</td>
    </tr>
</table>

</div>
		<table class="table" width="100%" >
			<thead>
				
				<tr>
					<th width="300"><div align="center">企业名称</div></th>
					<th width="150"><div align="center">报价（元）</div></th>
					<th width="150"><div align="center">工期承诺</div></th>
					<th width="150"><div align="center">质量承诺</div></th>
					
				</tr>				
			</thead>
			<tbody>
				
				
				<tr>
					<td width="300"><div align="center">山东新昌隆建设咨询有限公司</div></td>
					<td width="150"><div align="center">257300.9</div></td>
					<td width="150"><div align="center">500</div></td>
					<td width="150"><div align="center">详见标书</div></td>
				
				</tr>
				<tr>
					<td width="300"><div align="center">山东中恒建设集团有限公司</div></td>
					<td width="150"><div align="center">286300.2</div></td>
					<td width="150"><div align="center">500</div></td>
					<td width="150"><div align="center">详见标书</div></td>
				
				</tr>
				<tr>
					<td width="300"><div align="center">山东科信达建筑安装有限公司</div></td>
					<td width="150"><div align="center">256600.5</div></td>
					<td width="150"><div align="center">500</div></td>
					<td width="150"><div align="center">详见标书</div></td>
					
				</tr>
			</tbody>
		</table>
	</div>

	<div class="formBar">
		<ul>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>