<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="performanceId"
		value="${ggzyliteracyperformance.performanceId}" />
	<p>
		<label><spring:message code="ggzyliteracy_literacyidcode" />：</label>
		<select name="ggzyLiteracy.literacyId">
			<c:forEach var="items" items="${list}">
				<option value="${items.literacyId }"
					${param['ggzyLiteracy.literacyId'] == items.literacyId ? "selected='selected'" : "" }>
					${items.literacyIdcode}</option>
			</c:forEach>
		</select>
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_contractamount" />：</label> <input
			type="text" name="contractAmount"
			value="${ggzyliteracyperformance.contractAmount }"
			class="input-medium validate[required,custom[number],maxSize[20] required"
			maxlength="20" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_settlementamount" />：</label> <input
			type="text" name="settlementAmount"
			value="${ggzyliteracyperformance.settlementAmount }"
			class="input-medium validate[required,custom[number],maxSize[20]] required"
			maxlength="20" />
	</p>
	
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_currencycodeamount" />：</label> <input type="text"
			name="currencyCodeAmount" value="${ggzyliteracyperformance.currencyCodeAmount }"
			class="input-medium validate[required,maxSize[3]] required"
			maxlength="3" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_monetaryunit" />：</label> 
			<select name="monetaryUnit">
						<option value="1"
							${ggzyliteracyperformance.monetaryUnit == 1 ? "selected='selected'" : ""}>元</option>
						<option value="2"
							${ggzyliteracyperformance.monetaryUnit == 2 ? "selected='selected'" : ""}>万元</option>
				</select>
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_contractsigningtime" />：</label> <input
			type="text" name="contractSigningTime"
			value="<fmt:formatDate value="${ggzyliteracyperformance.contractSigningTime.time }"></fmt:formatDate>"
			class="input-medium validate[required,custom[date],maxSize[100] required"
			maxlength="100" />
	</p>
	<p>
		<label><spring:message
				code="ggzyliteracyperformance_contractcompletiontime" />：</label> <input
			type="text" name="contractCompletionTime"
			value="<fmt:formatDate value="${ggzyliteracyperformance.contractCompletionTime.time }"></fmt:formatDate>"
			class="input-medium validate[required,custom[date],maxSize[100] required"
			maxlength="100" />
	</p>



</div>
