<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${!empty auditReses }">
<table id="audit_content" width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
	</br>
	<caption style="line-height: 30px"><spring:message code="auditres"/></caption>
	<c:forEach items="${auditReses }" var="item">
	<tr><td colspan="2"><hr/></td></tr>
	<tr>
		<td class="td1" ><label><spring:message code="auditres_pass"></spring:message>：</label></td>
		<td class="td2"> 
				${item.pass?"":"不" }通过
			</select>
		</td>
	</tr>
	<tr>	
		<td class="td1" ><label><spring:message code="auditres_audittime"></spring:message>：</label></td>
		<td class="td2"><spring:eval expression="item?.auditTime"></spring:eval> </textarea>
		</td>
	</tr>
	<tr>
	<td class="td1" ><label><spring:message code="auditres_comment"></spring:message>：</label></td>
		<td class="td2" colspan="3">
			<spring:eval expression="item.comment"/>

		</td>
	</tr>
	</c:forEach>

</table>
</c:if>