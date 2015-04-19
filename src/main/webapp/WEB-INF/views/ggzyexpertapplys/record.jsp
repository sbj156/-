<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<script type="text/javascript">
<!--
$(function(){
	$(":input",".div_xmtj").removeAttr("onfocus").attr("readonly",true);
	$(".div_xmtj").append($("#append"));
})
//-->
</script>
<form method="PUT"
	action="${contextPath }/${business_ctx}/${module_path}"
	class="required-validate pageForm"
	onsubmit="return validateCallback(this, ${empty subCallbackFun?'dialogReloadNavTab':subCallbackFun});">
	<div class="pageContent">
		<%@include file="recordform.jsp" %>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
</form>

<div id="append">
	<input type="hidden" name="id" value="${expertApply.id}">
		<fieldset>
			<legend>抽取专家</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th>专家姓名</th>
						<th width="20%">通知方式</th>
						<th width="30%">通知时间</th>
					</tr>
				</thead>
				<c:forEach begin="1" end="${expertApply.eTotal}" var="index_">
					<tr>
						<td widtd="40">${index_ }</td>
						<td><input name="assessmentExperts[${index_ - 1 }].expert.id"
							type="hidden" value="${ggzyBidPro.tenderee.biddingSubjectId }" />
							<input class="validate[required] required"
							name="assessmentExperts[${index_ - 1 }].expert.name" type="text"
							readonly="readonly" style="width: 140px;"
							value="${ggzyBidPro.tenderee.subjectName }" /> <a
							class="btnLook"
							href="${contextPath }/business/ggzyexperts?nv_=ggzyexperts/lookUpList"
							lookupGroup="assessmentExperts[${index_ - 1 }].expert">查找带回</a></td>
						<td widtd="20%">
							<select class="combox" name="assessmentExperts[${index_ - 1 }].informWay">
							<option value="自动语音">自动语音</option>
							<option value="人工电话">人工电话</option>
							</select></td>
						<td widtd="20%"><input
							name="assessmentExperts[${index_ - 1 }].informTime" class="input-medium required validate[required]" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<fieldset>
			<legend>业主专家</legend>
			<table class="list" width="100%">
				<thead>
					<tr>
						<th width="40">序号</th>
						<th>专家姓名</th>
						<th width="20%">通知方式</th>
						<th width="30%">通知时间</th>
					</tr>
				</thead>
				<c:forEach begin="1" end="${expertApply.oTotal}" var="index_">
					<tr>
						<td widtd="40">${index_ }</td>
						<td><input
							name="assessmentExperts[${expertApply.eTotal + index_ - 1 }].expertName" class="input-medium validate[]"/>
						</td>
						<td widtd="20%"><input
							name="assessmentExperts[${expertApply.eTotal + index_ - 1 }].informWay" class="input-medium validate[]"/></td>
						<td widtd="20%"><input
							name="assessmentExperts[${expertApply.eTotal + index_ - 1 }].informTime" class="input-medium  validate[]" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
</div>