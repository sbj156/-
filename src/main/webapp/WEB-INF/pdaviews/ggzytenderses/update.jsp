<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@ include file="module.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath }/${business_ctx}/${module_path}/update" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}"/>
	<div class="pageFormContent" layoutH="58">
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
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>