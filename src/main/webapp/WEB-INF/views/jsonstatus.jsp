<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%--  将AjaxObject转换为json,其中message要读取i18--%>
{"statusCode":"${status.statusCode}","message":"<c:choose><c:when test="${status.i18nMessage }"><spring:message code="${status.message}"/></c:when><c:otherwise>${status.message }</c:otherwise></c:choose> ","navTabId":"${status.navTabId}","rel":"${status.rel}","callbackType":"${status.callbackType}","forwardUrl":"${status.forwardUrl}"}
