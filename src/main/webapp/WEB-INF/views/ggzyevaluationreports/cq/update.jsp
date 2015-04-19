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


		<p>
			<tr>
				<td>交易编号：</td>
				<td>2014JSSG02Z00019</td>
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
				<td>绿地新都会置业</td>
			</tr>
		</p>
		<p>
			<tr>
				<td>招标人委托代建单位：</td>
				<td>---</td>
			</tr>
		</p>

		<p>
			<tr>
				<td>开标时间：</td>
				<td>2014-05-28</td>
			</tr>
		</p>

		<p>
			<tr>
				<td>招标代理机构：</td>
				<td>济南忠诚信工程咨询有限公司</td>
			</tr>
		</p>

	<p>
			
			<tr>
			   <td>
				<label><b>请选择评标标段:</b> </label>
				  <select name="select">
                   <option>一标段</option>
                   <option>二标段</option>
                </select>  
	           </td>
			</tr>
	
	</p>
	<tr></tr>
		<table class="table" width="100%" >
			<thead>
				
				<tr>
					
					<th  width="500">企业名称</th>
					<th  width="150">信誉分</th>
					<th  width="150">报价分</th>

					<th width="150">陈岚</th>
					<th width="150">陈谦</th>
					<th width="150">董华</th>
					<th width="150">廖湘宁</th>
					<th width="150">王洪书</th>
					<th width="150">最终得分</th>
					<th width="150">排名</th>
				</tr>				
			</thead>
			<tbody>
				
				
				<tr>
					
					<td   width="500">山东新昌隆建设咨询有限公司</td>
					<td align="center" width="150">19.5</td>
					<td align="center" width="150">15.0</td>
					<td  align="center" width="150">53.9</td>
                    <td  align="center" width="150">53.7</td>
					<td  align="center" width="150">53.9</td>
                    <td  align="center" width="150">53.7</td>
                    <td align="center"  width="150">53</td>
					<td align="center" width="150">92.97</td>
					<td align="center"  width="150">1</td>
					
				
				</tr>
				<tr>
					<td   width="500">山东中恒建设集团有限公司</td>
					<td align="center"  width="150">19.5</td>
					<td align="center" width="150">15.0</td>
					<td align="center" width="150">53.9</td>
                    <td align="center" width="150">53.7</td>
					<td align="center"  width="150">52.5</td>
                    <td align="center" width="150">51.7</td>
                    <td align="center" width="150">53</td>
					<td align="center" width="150">92.97</td>
					<td align="center" width="150">2</td>
				
				</tr>
				<tr>
					<td width="500">山东科信达建筑安装有限公司</td>
					<td align="center" width="150">19.5</td>
					<td align="center" width="150">15.0</td>
					<td align="center" width="150">50</td>
                    <td align="center" width="150">49.6</td>
                    <td align="center" width="150">49.4</td>
					<td align="center" width="150">48.9</td>
                    <td align="center" width="150">46.7</td>
					<td align="center" width="150">89.03</td>
					<td align="center" width="150">3</td>
					
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