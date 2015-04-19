<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		$(":input",$.pdialog.getCurrent()).readOnly();
		//$('input',$.pdialog.getCurrent()).attr('readonly', 'true');
		$(".tble_masge").each(function(){
			$(this).find("tr:even").addClass("even");
			$(this).find("tr:odd").addClass("odd");
		
			})
	})
//-->
</script>
<div class="pageContent">
	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">

 <div class="div_masge">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
   <tr>
    <td class="td1" style="width:20%">交易编号：</td>
    <td class="td2" style="width:20%">2014JSSG02Z00019</td>
    <td class="td1" style="width:30%">项目名称：</td>
    <td class="td2" style="width:30%">绿地新都会一期西河片区C-2地块项目施工</td>
    </tr>
	 <tr>
    <td class="td1">开标时间：</td>
    <td class="td2">2014-05-28</td>
    <td class="td1">代理机构：</td>
    <td class="td2">济南忠诚信工程咨询有限公司 </td>
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
						<td class="td2"> <label>2014-05-13  09:20</label></td>
				        <td class="td1"> <label>结束抽取时间:</label></td>
						<td class="td2"> <label>2014-05-13 09:36</label></td>
							<td class="td1"><label>计划评标时间:</label></td>
					   <td class="td2"> <label>2014-05-13 10:20</label></td>
					</tr>
					<tr>
					   <td class="td1"><label>抽取人:</label></td>
						<td class="td2"><label>刘利民</label></td>	
						<td class="td1"><label>监督人:</label></td>
					    <td class="td2"> 袁代君 </label></td>
						<td class="td1"><label>抽取操作人:</label></td>
						<td class="td2"><label>王慧</label></td>
					</tr>
					</table>
					</div>
<div class="pageFormContent" layoutH="58">
	 <div class="div_masge">

		<table class="table" width="100%" >
			<thead>
				<tr>
				  <th width="35"><div align="center">序号</div></th>
					<th width="50"><div align="center">专家姓名</div></th>
				  <th width="35"><div align="center">性别</div></th>
				  <th width="55"><div align="center">技术职务(职称)</div></th>
				  <th width="200"><div align="center">工作单位</div></th>
				  <th width="75"><div align="center">专业</div></th>
				  <th width="75"><div align="center">抽取类别</div></th>
				  <th width="100"><div align="center">专家签到(操作人)</div></th>
				</tr>				
			</thead>
			<tbody>
				
				<tr>
				  <td width="35"><div align="center">1</div></td>
				  <td width="50"><div align="center"> 周宜 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="55"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南建通建设项目管理有限公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center"> 2014-05-28 11:16(孟萍) </div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">2</div></td>
					<td width="50"><div align="center"> 徐文香 </div></td>
				  <td width="35"><div align="center">女</div></td>
				  <td width="55"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南新地房地产开发有限公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到 </div></td>
				  <td width="100"><div align="center">2014-05-28 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">3</div></td>
				  <td width="50"><div align="center"> 万宪义 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="55"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 山东省城建工程集团公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到)</div></td>
				  <td width="100"><div align="center">2014-05-28 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">4</div></td>
				  <td width="50"><div align="center"> 姚树奎 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="55"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南市建设监理服务中心 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center">2014-05-28 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">5</div></td>
				  <td width="50"><div align="center"> 商元勋 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="55"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 山东市政建设总公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center">2014-05-28 11:16(孟萍)</div></td>
				</tr>

         </tbody>

		</table>
	</div>		
  	</div>		    
	</div>
	</div>
		<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">导出Excel</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>