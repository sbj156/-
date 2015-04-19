<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="pageFormContent" layoutH="58">
	<p>
		<label><spring:message code="ggzybiddingsubject_subjectname" /> ：</label> <input type="text" name="subjectName" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBiddingSubject.subjectName }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_organizationcode"></spring:message>：</label> <input name="organizationCode" class="input-medium validate[required,maxSize[10],minSize[9],custom[orgCode]] required" value="${ggzyBiddingSubject.organizationCode }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_subjectcharge" /> ：</label> <input name="subjectCharge" value="${ggzyBiddingSubject.subjectCharge }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_country"></spring:message>：</label> <input name="country.id" type="hidden" value="${ggzyBiddingSubject.country.id }"/> <input class="validate[required] required" name="country.name" type="text" readonly="readonly" style="width: 140px;" value="${ggzyBiddingSubject.country.name }"/> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/4?rootId=4" lookupGroup="country" mask="true" title="寻找国别\区域" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_unitcharacter"></spring:message>：</label> <input type="hidden" name="unitCharacter.id" value="${ggzyBiddingSubject.unitCharacter.id }"/> <input class="validate[required] required" name="unitCharacter.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.unitCharacter.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/5?rootId=5" lookupGroup="unitCharacter" mask="true" title="寻找单位性质" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_adminareacode"></spring:message>：</label> <input type="hidden" name="adminAreaCode.id" value="${ggzyBiddingSubject.adminAreaCode.id }"/> <input class="validate[required] required" name="adminAreaCode.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.adminAreaCode.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/6?rootId=6" lookupGroup="adminAreaCode" mask="true" title="寻找行政区域" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_industrycode" />：</label> <input type="hidden" name="industryCode.id" value="${ggzyBiddingSubject.industryCode.id }"/> <input class="validate[required] required" name="industryCode.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.industryCode.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/3?rootId=3" lookupGroup="industryCode" mask="true" title="寻找行业类别" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_businesslicensecode" />：</label> <input type="text" name="businessLicenseCode" class="input-medium validate[maxSize[50]]" maxlength="32" value="${ggzyBiddingSubject.businessLicenseCode }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_cacode"></spring:message>：</label> <input type="text" name="caCode" class="input-medium validate[maxSize[32]]" maxlength="32" value="${ggzyBiddingSubject.caCode }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_taxcode"></spring:message>：</label> <input type="text" name="taxCode" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.taxCode }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_creditlevel"></spring:message>：</label> <input type="text" name="creditLevel" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.creditLevel }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_accountbank"></spring:message>：</label> <input type="text" name="accountBank" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.accountBank }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_accountnumber"></spring:message>：</label> <input type="text" name="accountNumber" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.accountNumber }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_registeredcapital"></spring:message>：</label> <input type="text" name="registeredCapital" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.registeredCapital }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_registeredcapitalcurrency"></spring:message>：</label> <input type="hidden" name="registeredCapitalCurrency.id" value="${ggzyBiddingSubject.registeredCapitalCurrency.id }"/> <input class="validate[required] required" name="registeredCapitalCurrency.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.registeredCapitalCurrency.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/7?rootId=7" lookupGroup="registeredCapitalCurrency" mask="true" title="寻找币种" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_registeredcapitalunit"></spring:message>：</label> <input type="hidden" name="registeredCapitalUnit.id" value="${ggzyBiddingSubject.registeredCapitalUnit.id }"/> <input class="validate[required] required" name="registeredCapitalUnit.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.registeredCapitalUnit.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/8?rootId=8" lookupGroup="registeredCapitalUnit" mask="true" title="寻找金额单位" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_contacttel"></spring:message>：</label> <input type="text" name="contactTel" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.contactTel }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_contactaddress"></spring:message>：</label> <input type="text" name="contactAddress" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.contactAddress }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_zipcode"></spring:message>：</label> <input type="text" name="zipCode" class="input-medium validate[maxSize[32]]" maxlength="32" value="${ggzyBiddingSubject.zipCode }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_email"></spring:message>：</label> <input type="text" name="eMail" class="input-medium validate[required,maxSize[32],email] required" maxlength="32" value="${ggzyBiddingSubject.eMail }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_subjecttype"></spring:message>：</label> <input type="hidden" name="subjectType.id" value="${ggzyBiddingSubject.subjectType.id }"/> <input class="validate[required] required" name="subjectType.name" type="text" readonly="readonly" value="${ggzyBiddingSubject.subjectType.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/9?rootId=9" lookupGroup="subjectType" mask="true" title="寻找<spring:message code="ggzybiddingsubject_subjecttype"/>" width="400">查找带回</a>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_platformverifier"></spring:message>：</label> <input type="text" name="platformVerifier" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBiddingSubject.platformVerifier }"/>
	</p>
	<p>
		<label><spring:message code="ggzybiddingsubject_verifytime"></spring:message>：</label> <input type="text" name="verifyTime" readonly="readonly" class="input-medium validate[required,maxSize[32]] required date" maxlength="32" onfocus="WdatePicker()" value="<spring:eval expression="ggzyBiddingSubject.verifyTime"/>"/>
	</p>
</div>