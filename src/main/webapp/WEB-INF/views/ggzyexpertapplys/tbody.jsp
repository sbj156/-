<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/ggzytenderses/tbody.jsp"%>
<td>${empty item.expertApply?"未抽取": "已抽取" }</td>
<td>${item.expertApply.recordCount > 0?"已记录":"未记录" }</td>