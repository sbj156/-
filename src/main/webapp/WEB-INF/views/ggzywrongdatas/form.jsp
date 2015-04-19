<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="id" value="${entity.id}" />
	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<tr>
				<td class="td1"><label>交易编号：</label></td>
				<td class="td2"><input type="text" name="projectCode" value="${entity.projectCode }" class="required validate[required,maxsize[200]]" maxlength="100" /></td>
				<td class="td1"><label>项目名称：</label></td>
				<td class="td2"><input type="text" name="projectName" value="${entity.projectName }" class="input-medium required validate[required]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label>代理机构：</label></td>
				<td class="td2"><input type="text" name="agency" value="${entity.agency }" class="input-medium validate[maxSize[100]]" maxlength="100" /></td>
				<td class="td1"><label>责任方：</label></td>
				<td class="td2">
				<form:select cssClass="combox" path="entity.dutyParty" items="${duties}"/>
				</td>
			</tr>
			<tr>
				<td class="td1"><label>原开标时间：</label></td>
				<td class="td2"><input type="text" name="oldBidTime" value="<spring:eval expression="entity.oldBidTime"/>" class="input-medium validate[maxSize[100]]" maxlength="100" /></td>
				<td class="td1"><label>修改后开标时间：</label></td>
				<td class="td2"><input type="text" name="bidTime" value="<spring:eval expression="entity.bidTime"/>" class="input-medium validate[maxSize[100]]" maxlength="100" /></td>
			</tr>
			
			<tr>
				<td class="td1">修改内容</td>
				<td class="td2" colspan="3"><textarea class="editor" name="changeReason" rows="12" cols="90">${entity.changeReason}</textarea></td>
			</tr>
			<tr>
				<td class="td1">出错环节</td>
				<td class="td2" colspan="3"><textarea class="editor" name="wrongDuty" rows="12" cols="90">${entity.wrongDuty}</textarea></td>
			</tr>
		</table>
	</div>
</div>