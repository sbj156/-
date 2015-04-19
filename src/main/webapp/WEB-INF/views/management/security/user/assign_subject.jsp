<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageContent">
<form method="post" action="${contextPath}/business/ggzybiddingusers" class="required-validate pageForm" onsubmit="return validateCallback(this, dialogReloadNavTab);">
	<input type="hidden" name="user.id" value="${user.id}"/>
	<div class="pageFormContent" layoutH="58">
		<p>
			<label>登录名称：</label>
			<label>${user.username }</label>
		</p>
		<p>
			<label>姓名：</label>
			<label>${user.realname }</label>
		</p>		
		<p>
			<label>电话：</label>
			<label>${user.phone }</label>
		</p>
		<p>
			<label>用户邮箱：</label>
			<label>${user.email }</label>
		</p>		
		<p>
			<label>用户状态：</label>
			<label>${user.status == "enabled" ? '可用' : '不可用'}</label>
		</p>
		<p>
			<label>组织：</label>
			<label>${user.organization.name }</label>
		</p>		
		<p>
			<label>关联招投标主体：</label>
			<input name="biddingSubject.biddingSubjectId" type="hidden" value="${ggzyBiddingUser.biddingSubject.biddingSubjectId }" /> <input class="validate[required] required" name="biddingSubject.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyBiddingUser.biddingSubject.subjectName }" /> <a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList" lookupGroup=biddingSubject rel="assign_subject_look">查找带回</a>
		</p>		
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
</form>
</div>