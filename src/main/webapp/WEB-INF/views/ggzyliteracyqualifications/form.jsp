<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="qualificationId"
		value="${ggzyliteracyqualification.qualificationId}" />
		
	<p>
		<label><spring:message code="ggzyliteracy_literacyidcode" />：</label>
		<select name="ggzyLiteracy.literacyId">
			<c:forEach var="items" items="${list}">
				<option value="${items.literacyId }"
					${param['ggzyLiteracy.literacyId'] == items.literacyId ? "selected='selected'" : ""}>
					${items.literacyIdcode}</option>
			</c:forEach>
		</select>
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyqualification_literacyquasequence" />：</label> <input
			type="text" name="literacyQuaSequence"
			value="${ggzyliteracyqualification.literacyQuaSequence }"
			class="input-medium validate[required,maxSize[50] required"
			maxlength="50" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyqualification_literacygrade" />：</label> <input
			type="text" name="literacyGrade"
			value="${ggzyliteracyqualification.literacyGrade }"
			class="input-medium validate[required,maxSize[50]] required"
			maxlength="50" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyqualification_quacertificatenumber" />：</label> <input
			type="text" name="quaCertificateNumber"
			value="${ggzyliteracyqualification.quaCertificateNumber }"
			class="input-medium validate[required,maxSize[50] required"
			maxlength="50" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyqualification_recertificatenumber" />：</label> <input
			type="text" name="reCertificateNumber"
			value="${ggzyliteracyqualification.reCertificateNumber }"
			class="input-medium validate[required,maxSize[50] required"
			maxlength="50" />
	</p>



</div>
