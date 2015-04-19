<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/views/ggzyexpertapplys/tbody.jsp"%>
<td>${empty item.evaluationReport?"未评标":"已评标" }&nbsp&nbsp${item.exceptionalCase.step eq 'eval'? "废标":""}</td>