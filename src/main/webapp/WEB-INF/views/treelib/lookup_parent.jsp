<%@page import="org.apache.commons.collections.CollectionUtils"%>
<%@page import="com.lmd.ggzy.domain.GgzyTreeLib"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%> 
<%!public String tree(GgzyTreeLib ggzyArea, Long ggzyAreaId) {
		if (ggzyArea.getChildren().isEmpty()) {
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul>" + "\n");
		for(GgzyTreeLib m : ggzyArea.getChildren()) {
			// 不显示自己及子元素
			if (ggzyAreaId.equals(m.getId())) {
				continue;
			}
			buffer.append("<li><a href=\"javascript:\" ");
			if(CollectionUtils.isEmpty(m.getChildren()))
				buffer.append("onclick=\"$.bringBack({id:'" + m.getId() + "', name:'" + m.getName() + "'})\"");
			buffer.append(">" + m.getName() + "</a>" + "\n");
			buffer.append(tree(m, ggzyAreaId));
			buffer.append("</li>" + "\n");
		}
		buffer.append("</ul>" + "\n");
		return buffer.toString();
	}%>
<%
	GgzyTreeLib ggzyArea = (GgzyTreeLib)request.getAttribute("ggzyArea");
	Long ggzyAreaId = (Long)request.getAttribute("id");
%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<li><a href="javascript:"><%=ggzyArea.getName() %></a>
				<%=tree(ggzyArea, ggzyAreaId) %>
			</li>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>