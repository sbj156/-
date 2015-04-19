<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/ggzytenderses/thead.jsp"%>
<th width="70" orderField="expertApplies.extractTime" class="${page.orderField eq 'expertApplies.extractTime' ? page.orderDirection : ''}"><spring:message code="ggzytenders_extracted" /></th>
<th width="70"><spring:message code="ggzytenders_recorded" /></th>