<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		$('input').attr('readonly', 'true');
	})
//-->
</script>
<div class="pageContent">

	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}" />
	<div class="pageFormContent" layoutH="70">
		<div class="panel" defH="130">
			<h1>项目基本信息</h1>
			<div>
				 
					 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
					   <tr height=20>
						<td    style="width:18%">交易编号：</td>
						<td  style="width:28%">2014JSSG02Z00019</td>
						<td  style="width:18%">项目名称：</td>
						<td>绿地新都会一期西河片区C-2地块项目施工</td>
						</tr>
						<tr height=20 >
						<td >招标人：</td>
						<td >绿地新都会置业</td>
						<td >招标人委托代建单位：</td>
						<td >--</td>
						</tr>
						<tr height=20 >
						<td >开标时间：</td>
						<td >2014-05-28</td>
						<td >开标时间：</td>
						<td >2014-05-20 09:30</td>
						</tr>
						<tr height=20 >
						<td >招标代理机构：</td>
						<td >济南忠诚信工程咨询有限公司</td>
						<td >请选择唱标标段：</td>
						<td ><select name="select">
							   <option>一标段</option>
							   <option>二标段</option>
							</select>  
						</td>
						</tr>

						<tr height=20 >
						<td >选择唱价类型：</td>
						<td ><select name="select">
							   <option>报价</option>
							   <option>费率</option>
							</select> </td>
						<td >请选择报价方式：</td>
						<td ><select name="select">
							   <option>一个价格</option>
							   <option>二个价格</option>
							</select>  
						</td>
						</tr>
					
						
					 </table>
					
			</div>
		</div>

	<!--	<p>
			<tr>
				<td>交易编号：</td>
				<td  class="td2">2014JSSG02Z00019</td>
			</tr>
		</p>
		<p>
			<tr>
				<td>项目名称：</td>
				<td>绿地新都会一期西河片区C-2地块项目施工</td>
			</tr>
		</p>

		<p>
			<tr>
				<td>招标人：</td>
				<td  class="td2">绿地新都会置业</td>
			</tr>
		</p>
		<p>
			<tr>
				<td>招标人委托代建单位：</td>
				<td  class="td2">---</td>
			</tr>
		</p>

		<p>
			<tr>
				<td>开标时间：</td>
				<td  class="td2">2014-05-28</td>
			</tr>
		</p>

		<p>
			<tr>
				<td>招标代理机构：</td>
				<td  class="td2">济南忠诚信工程咨询有限公司</td>
			</tr>
		</p>

	<p>
			
			<tr>
			   <td>
				<label><b>请选择唱标标段:</b> </label>
				  <select name="select">
                   <option>一标段</option>
                   <option>二标段</option>
                </select>  
	           </td>
               <td>
				<label><b>选择唱价类型:</b> </label>
				  <select name="select">
                   <option>报价</option>
                   <option>费率</option>
                </select>  
	           </td>
			</tr>
			
	</p>
	 
	 <p>
	      <tr>
			  <td >
			
				<label><b>请选择报价方式:</b> 
				  <select name="select">
                   <option>一个价格</option>
                   <option>二个价格</option>
                </select>  </label>
	           </td>

</tr>
	</p>		
	-->
		
		<table class="list" width="100%" >
			<thead>
				
				<tr >
				    <th align="center" width="150">序号</th>
					<th align="center" width="300" >企业名称</th>
					<th align="center" width="150">报价（元）</th>
					<th align="center" width="150">工期承诺</th>
					<th align="center" width="150">质量承诺</th>
					
				</tr>				
			</thead>
			<tbody>
				
				
				<tr height=25>
			     	<td  align="center" width="150">1</td>
					<td width="300">山东新昌隆建设咨询有限公司</td>
					<td align="center" width="150">257300.9</td>
					<td align="center" width="150">500</td>
					<td align="center" width="150">详见标书</td>
				
				</tr>
				<tr height=25>
				    <td  align="center" width="150">2</td>
					<td width="300">山东中恒建设集团有限公司</td>
					<td align="center" width="150">286300.2</td>
					<td align="center" width="150">500</td>
					<td align="center" width="150">详见标书</td>
				
				</tr>
				<tr height=25>
				    <td  align="center" width="150">3</td>
					<td   width="300">山东科信达建筑安装有限公司</td>
					<td  align="center"width="150">256600.5</td>
					<td  align="center" width="150">500</td>
					<td  align="center" width="150">详见标书</td>
					 
				</tr>
			</tbody>
		</table>

	</div>

	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">导出Excel</button></div></div></li>
			
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>