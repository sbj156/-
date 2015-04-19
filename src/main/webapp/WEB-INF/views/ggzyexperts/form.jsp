<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<c:set var="expert" value="${ggzyExpert }" />
<div class="pageFormContent" layoutH="58">
	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr>
				<td class="td1" width="25%"><label><spring:message code="ggzyexpert_name" /> ：</label></td>
				<td class="td2" width="25%"><input type="text" name="name" value="${expert.name }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
				<td class="td1" width="25%"><label><spring:message code="ggzyexpert_sex" /> ：</label></td>
				<td class="td2" width="25%"><input name="sex.id" value="${expert.sex.id}" type="hidden" /> <input class="validate[required] required" name="sex.name" type="text" readonly="readonly" value="${expert.sex.name}" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=13" lookupGroup="sex" mask="true" title="寻找<spring:message code="ggzyexpert_idtype"/>" width="400">查找带回</a></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_idtype" /> ：</label></td>
				<td class="td2"><input name="idType.id" value="${expert.idType.id}" type="hidden" /> <input class="validate[required] required" name="idType.name" type="text" readonly="readonly" value="${expert.idType.name}" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=10" lookupGroup="idType" mask="true" title="寻找<spring:message code="ggzyexpert_idtype"/>" width="400">查找带回</a></td>
				<td class="td1"><label><spring:message code="ggzyexpert_idcode" /> ：</label></td>
				<td class="td2"><input type="text" name="idCode" value="${expert.idCode }" class="input-medium validate[custom[chinaId], required] required" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_birthday" /> ：</label></td>
				<td class="td2"><input type="text" name="birthday" value="<spring:eval expression="expert?.birthday"/>" class="input-medium validate[maxSize[100],required] date" maxlength="100" onfocus="WdatePicker()" /></td>
				<td class="td1"><label><spring:message code="ggzyexpert_adminarea" /> ：</label></td>
				<td class="td2"><input type="text" name="adminArea.name" readonly="readonly" value="${expert.adminArea.name}" class="input-medium validate[maxSize[100],required]" maxlength="100" /><input name="adminArea.id" value="${expert.adminArea.id}" type="hidden" /><a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=6" lookupGroup="adminArea" mask="true" title="寻找<spring:message code="ggzyexpert_adminarea"/>" width="400">查找带回</a></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_finallycollege" /> ：</label></td>
				<td class="td2"><input type="text" name="finallyCollege" value="${expert.finallyCollege }" class="input-medium validate[maxSize[100],required]" maxlength="100" /></td>
				<td class="td1"><label><spring:message code="ggzyexpert_topqualification" /> ：</label></td>
				<td class="td2"><input type="text" name="topQualification" value="${expert.topQualification }" class="input-medium validate[maxSize[30],required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_tel" /> ：</label></td>
				<td class="td2"><input type="text" name="tel" value="${expert.tel }" class="input-medium validate[maxSize[100],required]" maxlength="100" /></td>
				<td class="td1"><label><spring:message code="ggzyexpert_contactaddress" /> ：</label></td>
				<td class="td2"><input type="text" name="contactAddress" value="${expert.contactAddress }" class="input-medium validate[maxSize[100],required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_zipcode" /> ：</label></td>
				<td class="td2"><input type="text" name="zipCode" value="${expert.zipCode }" class="input-medium validate[custom[chinaZip],required]" maxlength="6" /></td>
				<td class="td1"><label><spring:message code="ggzyexpert_unitsname" /> ：</label></td>
				<td class="td2"><input type="text" name="unitsName" value="${expert.unitsName }" class="input-medium validate[maxSize[100],required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_workstatus" /> ：</label></td>
				<td class="td2"><input type="text" name="workStatus.name" readonly="readonly" value="${expert.workStatus.name }" class="input-medium validate[maxSize[100],required]" maxlength="100" /><input name="workStatus.id" value="${expert.workStatus.id}" type="hidden" /><a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=11" lookupGroup="workStatus" mask="true" title="寻找<spring:message code="ggzyexpert_workstatus"/>" width="400">查找带回</a></td>
				<td class="td1"><label><spring:message code="ggzyexpert_job" /> ：</label></td>
				<td class="td2"><input type="text" name="job" value="${expert.job }" class="input-medium validate[maxSize[50],required]" maxlength="50" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_majortype" /> ：</label></td>
				<td class="td2"><input type="text" name="majorType.name" readonly="readonly" value="${expert.majorType.name }" class="input-medium validate[maxSize[100],required]" maxlength="100" /><input name="majorType.id" value="${expert.majorType.id}" type="hidden" /><a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=12" lookupGroup="majorType" mask="true" title="寻找<spring:message code="ggzyexpert_majortype"/>" width="400">查找带回</a></td>
				<td class="td1"><label><spring:message code="ggzyexpert_technicaltitles" /> ：</label></td>
				<td class="td2"><input type="text" name="technicalTitles" value="${expert.technicalTitles }" class="input-medium validate[maxSize[100],required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_nvq" /> ：</label></td>
				<td class="td2"><input type="text" name="nvq" value="${expert.nvq }" class="input-medium validate[maxSize[50],required]" maxlength="50" /></td>
				<td class="td1"><label><spring:message code="ggzyexpert_nvqlevel" /> ：</label></td>
				<td class="td2"><input type="text" name="nvqLevel" value="${expert.nvqLevel }" class="input-medium validate[maxSize[50],required]" maxlength="50" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_entireperiod" /> ：</label></td>
				<td class="td2" colspan="3"><input type="text" name="entirePeriod" value="${expert.entirePeriod }" class="input-medium validate[maxSize[2],custom[integer],required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyexpert_workresume" /> ：</label></td>
				<td class="td2" colspan="3"><textarea rows="10" cols="110" class="editor" name="workResume.content">
						<spring:eval expression="expert?.workResume?.content" />
					</textarea></td>
			</tr>
		</table>
	</div>
</div>
