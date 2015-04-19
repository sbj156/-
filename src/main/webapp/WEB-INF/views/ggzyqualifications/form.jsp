<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="biddingSubject.biddingSubjectId" value="${empty ggzyqualification.biddingSubject.biddingSubjectId? param.biddingSubjectId: ggzyqualification.biddingSubject.biddingSubjectId }">
	<p>
		<label>证书编号：</label> <input type="text" name="certificateNumber" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyqualification.certificateNumber }"/>
	</p>
	<p>
		<label>资质序列：</label>
		<mh:lookUpTree rootId="22" group="quaSeq" value="${ggzyqualification.quaSeq }"/>
	</p>
	<p>
		<label>行业类别：</label>
		<mh:lookUpTree rootId="23" group="industry" value="${ggzyqualification.industry }"/>
	</p>
	<p>
		<label>专业类别：</label>
		<mh:lookUpTree rootId="24" group="major" value="${ggzyqualification.major }"/>
	</p>
	<p>
		<label>资质等级：</label>
		<mh:lookUpTree rootId="25" group="grade" value="${ggzyqualification.grade }"/>
	</p>
	<p>
		<label>信息申报责任人：</label> <input type="text" name="declareResponsible" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyqualification.declareResponsible }"/>
	</p>
</div>
