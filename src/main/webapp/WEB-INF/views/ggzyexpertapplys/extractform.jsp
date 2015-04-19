<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set var="expertApply" value="${noticeTenders.expertApply}"/>
<div class="pageFormContent" layoutH="58">
<input name="noticeTenders.id" type="hidden" value="<spring:eval expression="noticeTenders.id"/>" />
<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
<div class="div_xmtj">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="tble_xmlb">
		<tr>
			<td class="td1" width="25%"><label><spring:message
						code="ggzyexpertapply_expertlibname"></spring:message>：</label></td>
			<td class="td2" colspan="3"><input name="expertLibName"
				size="100" class="required validate[required]" value="${expertApply.expertLibName }"/></td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label><spring:message
						code="ggzyexpertapply_total"></spring:message>：</label></td>
			<td class="td2" colspan="3"><span>共<input name="total" class="required validate[required,custom[number]]" size="5" value="${expertApply.total}"/>个专家,其中业主专家<input size="5" name="oTotal" class="required validate[required,custom[number]]" value="${expertApply.oTotal}"/>人,抽取专家<input size="5" name="eTotal" value="${expertApply.eTotal}" class="required validate[required,custom[number]]"/>人</span></td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label><spring:message
						code="ggzyexpertapply_extractperson"></spring:message>：</label></td>
			<td class="td2" width="25%"><input name="extractPerson" class="required validate[required]" value="${expertApply.extractPerson }"/></td>
			<td class="td1" width="25%"><label><spring:message
						code="ggzyexpertapply_extracttime"></spring:message>：</label></td>
			<td class="td2" width="25%"><input name="extractTime" class="required validate[required]"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<spring:eval expression="noticeTenders.expertApply?.extractTime"/>" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="td1"><label><spring:message
						code="ggzyexpertapply_reviewtime"></spring:message>：</label></td>
			<td class="td2"><input name="reviewTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<spring:eval expression="noticeTenders.expertApply?.reviewTime"/>" readonly="readonly" class="required validate[required]"/></td>
			<td class="td1"><label><spring:message
						code="ggzyexpertapply_reviewaddress"></spring:message>：</label></td>
			<td class="td2"><input name="reviewAddress" value="${expertApply.reviewAddress }" class="required validate[required]"/></td>
		</tr>
		<tr>
			<td class="td1" width="25%"><label><spring:message
						code="ggzyexpertapply_requirement"></spring:message>：</label></td>
			<td class="td2" colspan="3"><textarea class="editor"
					name="requirement" cols="90" rows="7"><spring:eval expression="noticeTenders.expertApply?.requirement"/> </textarea></td>
		</tr>
	</table>
</div>
</div>
