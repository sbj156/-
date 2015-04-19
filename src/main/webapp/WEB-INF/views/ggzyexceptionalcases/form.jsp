<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
<div class="div_xmtj">
	<input name="step" type="hidden" value="${param.step }">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label>废标原因：</label></td>
			<td class="td2" colspan="3"><mh:dataClob name="caseDesc" dataClob="${exceptionalCase.caseDesc}"></mh:dataClob></td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label>见证人：</label></td>
			<td class="td2"><input type="text" name="witness" value="${exceptionalCase.witness }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
			<td class="td1" width="25%"><label>监督人：</label></td>
			<td class="td2"><input type="text" name="supervisors" value="${exceptionalCase.supervisors }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
		</tr>
	</table>
</div>