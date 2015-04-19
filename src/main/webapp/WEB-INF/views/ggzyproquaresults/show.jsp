<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	$(":input",$.pdialog.getCurrent()).readOnly();
})
//-->
</script>
<style>
<!--
.priority_input {
	border: none;
	border-bottom: 1px solid gray;
	background: none;
	width: 50px;
	height: 22px;
	padding: 0px;
	float: left;
	margin-right: 10px;
}
-->
</style>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<%@include file="form.jsp"%>
		<fieldset>
			<legend>预审通过投标人(供应商)</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="200"><spring:message code="ggzyapply_biddingsubject" /></th>
						<th width="100"><spring:message code="ggzyapply_contact" /></th>
						<th width="100"><spring:message code="ggzyapply_tel" /></th>
						<th width="100"><spring:message code="ggzyapply_operator" /></th>
						<th width="100"><spring:message code="ggzyapply_applytime" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${ggzyNotice.ggzyApplies}" varStatus="status">
						<c:if test="${item.official }">
							<tr target="slt_uid" rel="${item.applyId }">
								<td>${item.biddingSubject.subjectName}</td>
								<td>${item.contact}</td>
								<td>${item.tel}</td>
								<td>${item.operator}</td>
								<td><spring:eval expression="item?.applyTime" /></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
		<fieldset>
			<legend>预审未通过投标人(供应商)</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="200"><spring:message code="ggzyapply_biddingsubject" /></th>
						<th width="100"><spring:message code="ggzyapply_contact" /></th>
						<th width="100"><spring:message code="ggzyapply_tel" /></th>
						<th width="100"><spring:message code="ggzyapply_operator" /></th>
						<th width="100"><spring:message code="ggzyapply_applytime" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${ggzyNotice.ggzyApplies}" varStatus="status">
						<c:if test="${!item.official }">
							<tr target="slt_uid" rel="${item.applyId }">
								<td>${item.biddingSubject.subjectName}</td>
								<td>${item.contact}</td>
								<td>${item.tel}</td>
								<td>${item.operator}</td>
								<td><spring:eval expression="item?.applyTime" /></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
		<div class="panel">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
				<tr>
					<td class="td1" width="16%"><label>见证人：</label></td>
					<td class="td2" width="16%"><input type="text" name="witness" value="${ggzyNotice.proQuaResult.witness }" class="validate[maxSize[50],required] required" /></td>
					<td class="td1" width="16%"><label>监督人：</label></td>
					<td class="td2" width="16%"><input type="text" name="supervisors" value="${ggzyNotice.proQuaResult.supervisors }" class="validate[maxSize[50],required] required" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>
