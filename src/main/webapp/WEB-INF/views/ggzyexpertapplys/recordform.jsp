<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<c:set var="expertApply" value="${noticeTenders.expertApply}" />
<div class="pageFormContent" layoutH="58">
	<%@ include file="/WEB-INF/views/ggzytenderses/baseinfo.jsp"%>
	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<tr>
				<td class="td1" width="25%"><label><spring:message
							code="ggzyexpertapply_expertlibname"></spring:message>：</label></td>
				<td class="td2" colspan="3"><input name="expertLibName"
					size="100" value="${expertApply.expertLibName }" /></td>
			</tr>
			<tr>
				<td class="td1" width="25%"><label><spring:message
							code="ggzyexpertapply_total"></spring:message>：</label></td>
				<td class="td2" colspan="3">共<input name="total"
					value="${expertApply.total}" />个专家,其中业主专家<input name="oTotal"
					value="${expertApply.oTotal}" />人,抽取专家<input name="eTotal"
					value="${expertApply.eTotal}" />人
				</td>
			</tr>
			<tr>
				<td class="td1" width="25%"><label><spring:message
							code="ggzyexpertapply_extractperson"></spring:message>：</label></td>
				<td class="td2" width="25%"><input name="extractPerson"
					value="${expertApply.extractPerson }" /></td>
				<td class="td1" width="25%"><label><spring:message
							code="ggzyexpertapply_extracttime"></spring:message>：</label></td>
				<td class="td2" width="25%"><input name="extractTime"
					onfocus="WdatePicker()"
					value="<spring:eval expression="noticeTenders.expertApply?.extractTime"/>" /></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message
							code="ggzyexpertapply_reviewtime"></spring:message>：</label></td>
				<td class="td2"><input name="reviewTime"
					onfocus="WdatePicker()"
					value="<spring:eval expression="noticeTenders.expertApply?.reviewTime"/>" /></td>
				<td class="td1"><label><spring:message
							code="ggzyexpertapply_reviewaddress"></spring:message>：</label></td>
				<td class="td2"><input name="reviewAddress"
					value="${expertApply.reviewAddress }" /></td>
			</tr>
		</table>
		<br />
	</div>
</div>