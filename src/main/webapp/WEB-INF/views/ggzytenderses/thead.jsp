<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
<th width="100"><spring:message code="ggzybidpro_procode" /></th>
<th width="200"><spring:message code="ggzybasepro_proname" /></th>
<th width="70"><spring:message code="ggzytenders_tendersname" /></th>
<th width="100">
	<spring:message code="ggzynotice_noticename" /></th>
<th width="100" orderField="bidTime" class="${page.orderField eq 'bidTime' ? page.orderDirection : ''}"><spring:message code="ggzytenders_bidtime" /></th>
<th width="70" orderField="ggzyBidOpenings.recordTime" class="${page.orderField eq 'ggzyBidOpenings.recordTime' ? page.orderDirection : ''}"><spring:message code="ggzytenders_openned" /></th>