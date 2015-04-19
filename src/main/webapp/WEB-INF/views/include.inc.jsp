<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib prefix="dwz" uri="http://www.ketayao.com/dwz"%>
<%@ taglib prefix="mh" uri="http://www.jnlmd.com/mh"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${!empty param.eventSource }">
<c:set var="eventSource" value="${mh:decode(param.eventSource) }"/>
<spring:eval expression="@js[${eventSource}_subcallback]" var="subCallbackFun"/>
</c:if>
