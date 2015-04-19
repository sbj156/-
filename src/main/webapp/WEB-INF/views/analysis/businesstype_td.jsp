<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:forEach items="${businessTypes }" var="item">
<td class="td2">${item.name }</td>
</c:forEach>