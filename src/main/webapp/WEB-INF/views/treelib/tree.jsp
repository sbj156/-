<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.lmd.ggzy.domain.GgzyTreeLib"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%!public String tree(GgzyTreeLib area, String basePath, String rootId) {
		StringBuilder builder = new StringBuilder();
		
		long pid = area.getParent() == null ? 0:area.getParent().getId();
		builder.append("{id:" + area.getId() +  ", pId:" + pid + 
				", name:\"" + area.getName() + "\", url:\"" + basePath + "/business/treelib/list/" + area.getId() + "?rootId=" + rootId + "\", target:\"ajax\"},");
		
		for(GgzyTreeLib o : area.getChildren()) {
			builder.append(tree(o, basePath, rootId));				
		}
		return builder.toString();
	}%>
<%
	GgzyTreeLib area2 = (GgzyTreeLib)request.getAttribute("ggzyArea");
	String rootId = request.getParameter("rootId");
	rootId = StringUtils.hasText(rootId)? rootId:(request.getAttribute("rootId") + "");
	String orgTree = tree(area2, request.getContextPath(), rootId);
	orgTree = orgTree.substring(0, orgTree.length() - 1);
%>   

<script type="text/javascript">
<!--
var setting = {
	view: {
		//showIcon: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		onClick: function(event, treeId, treeNode) {
			var $rel = $("#jbsxBox2organizationList${param.rootId }");
			$rel.loadUrl(treeNode.url, {}, function(){
				$rel.find("[layoutH]").layoutH();
			});

			event.preventDefault();
		}
	}	
};

     	
$(document).ready(function(){
	var t = $("#zTree<%=area2.getId()%>");
	t = $.fn.zTree.init(t, setting, [<%=orgTree%>]);
	t.expandAll(true); 
});
//-->
</script>
<style>
<!--
#orgTree li span {
	text-align:left;
	float: left;
	display: inline;
} 
-->
</style>
<!-- <oo id="ztree_div"></oo> 
attr${rootId}
para${param.rootId}
<ul id=\"orgTree\" class=\"ztree\" style=\"display: block;\"></ul>
-->
<ul id="zTree<%=area2.getId()%>" class="ztree" style="display: block;"></ul>
