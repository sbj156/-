<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${!empty auditReses }">
<table id="audit_content" width="100%" border="0" cellspacing="0" cellpadding="0"
	class="tble_xmlb">
	<caption style="height: 10px"></caption>
	<caption><spring:message code="auditres"/></caption>
	<caption style="height: 10px"></caption>
	<c:forEach items="${auditReses }" var="item">
	<tr>
		<td class="td1" width="25%"><label><spring:message
					code="auditres_pass"></spring:message>：</label></td>
		<td class="td2"> 
			<select name="pass" class="combox">
				<option value="0" ${item.pass?"":"selected" }>不通过</option>
				<option value="1" ${item.pass?"selected":"" }>通过</option>
			</select>
		</td>
		<td class="td1" width="25%"><label><spring:message
					code="auditres_audittime"></spring:message>：</label></td>
		<td class="td2">
			<spring:eval expression="item?.auditTime"></spring:eval> </textarea>
		</td>
	</tr>
	<tr>
	<td class="td1" width="25%"><label><spring:message
					code="auditres_comment"></spring:message>：</label></td>
		<td class="td2" colspan="3">
			<textarea class="editor" name="comment" rows="8" cols="90"><spring:eval expression="item.comment"/></textarea>
		</td>
	</tr>
	</c:forEach>
	
</table>
</c:if>