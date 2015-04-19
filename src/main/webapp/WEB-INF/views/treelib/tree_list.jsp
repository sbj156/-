<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>    
<script type="text/javascript">
<!--

//-->
</script>
<div class="pageContent">
	<div class="tabs">
		<div class="tabsContent">
			<div>
				<div layoutH="5" id="jbsxBox2organizationTree${param.rootId }" style="float:left; display:block; overflow:auto; width:300px; border:solid 1px #CCC; line-height:21px; background:#fff">
					<c:import url="/business/treelib/tree/${rootId }?rootId=${param.rootId }"/>
				</div>
				
				<div layoutH="0" id="jbsxBox2organizationList${param.rootId }" class="unitBox" style="margin-left:306px;">
					<c:import url="/business/treelib/list/${rootId }?rootId=${param.rootId }"/>
				</div>
			</div>
		</div>
	</div>
</div>