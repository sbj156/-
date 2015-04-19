<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/${module_path}/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
	<!--
		<p>
			<label>项目名称：</label>
			<input type="text" name="proName" value="${ggzyBasePro.proName}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label>区域：</label>
			<input name="area.id" value="${ggzyBasePro.area.id}" type="hidden"/>
			<input class="validate[required] required" name="area.name" type="text" readonly="readonly" value="${ggzyBasePro.area.name}" style="width: 140px;"/>
			<a class="btnLook" href="${contextPath}/business/area/lookupParent/-1?rootId=2" lookupGroup="area" mask="true" title="寻找区域" width="400">查找带回</a>
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
<div class="pageFormContent" layoutH="58">
	 <div class="div_masge">

		<table class="table" width="100%" >
			<thead>
				<tr>
				  <th width="35"><div align="center">序号</div></th>
					<th width="50"><div align="center">专家姓名</div></th>
				  <th width="35"><div align="center">性别</div></th>
				  <th width="60"><div align="center">技术职务(职称)</div></th>
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
				  <td width="60"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南建通建设项目管理有限公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center"> 2014-05-21 11:16(孟萍) </div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">2</div></td>
					<td width="50"><div align="center"> 徐文香 </div></td>
				  <td width="35"><div align="center">女</div></td>
				  <td width="60"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南新地房地产开发有限公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到 </div></td>
				  <td width="100"><div align="center">2014-05-21 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">3</div></td>
				  <td width="50"><div align="center"> 万宪义 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="60"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 山东省城建工程集团公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到)</div></td>
				  <td width="100"><div align="center">2014-05-21 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">4</div></td>
				  <td width="50"><div align="center"> 姚树奎 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="60"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 济南市建设监理服务中心 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center">2014-05-21 11:16(孟萍)</div></td>
				</tr>
				<tr>
				  <td width="35"><div align="center">5</div></td>
				  <td width="50"><div align="center"> 商元勋 </div></td>
				  <td width="35"><div align="center"> 男 </div></td>
				  <td width="60"><div align="center"> 高工 </div></td>
				  <td width="200"><div align="center"> 山东市政建设总公司 </div></td>
				  <td width="75"><div align="center"> 建设监理 </div></td>
				  <td width="75"><div align="center"> 一次抽取(已到) </div></td>
				  <td width="100"><div align="center">2014-05-21 11:16(孟萍)</div></td>
				</tr>

         </tbody>

		</table>
	</div>		
  	</div>		

	</div>
			
	<div class="formBar">
		<ul>
			<!--<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>-->
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>