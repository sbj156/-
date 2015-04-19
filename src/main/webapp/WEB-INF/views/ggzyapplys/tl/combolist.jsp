<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:forEach begin="1" end="${param.num}" var="item">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_biddingsubject"/>：</label></td>
				<td class="td2" colspan="3"><input name="comboCompany[${item-1}].biddingSubject.biddingSubjectId" type="hidden" value="${ggzyApply.comboCompany[item-1].biddingSubject.biddingSubjectId }"/>
					<input class="validate[required] required" name="comboCompany[${item-1}].biddingSubject.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyApply.comboCompany[item-1].biddingSubject.subjectName }"/> 
					<a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList?search_LIKE_subjectType.code=B&search_EQ_biddingSubjectId=${ggzyApply.comboCompany[item-1].biddingSubject.biddingSubjectId }" lookupGroup="comboCompany[${item-1}].biddingSubject">查找带回</a>
					<a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/${ggzyApply.comboCompany[item-1].biddingSubject.biddingSubjectId }" style="display:none" lookupGroup="comboCompany[${item-1}].biddingSubject" title="查看详细">查看详细</a>
					</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_contact"/>：</label></td>
				<td class="td2"><input name="comboCompany[${item-1}].contact" type="text"
					class="input-medium validate[required,maxSize[100],custom[chinese]] required"
					maxlength="100" value="${ggzyApply.comboCompany[item-1].contact }"></td>
				<td class="td1"><label><spring:message code="ggzyapply_tel"/>：</label></td>
				<td class="td2"><input name="comboCompany[${item-1}].tel" type="text"
					class="input-medium validate[required,maxSize[100],custom[phone]] required"
					maxlength="100" value="${ggzyApply.comboCompany[item-1].tel }"></td>
			</tr>
	</table>
	<BR>
</c:forEach>	