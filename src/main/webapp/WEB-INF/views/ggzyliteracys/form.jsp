<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<div class="pageFormContent" layoutH="58">
	<div class="div_xmtj">
		<input type="hidden" name="literacyId"
			value="${ggzyliteracy.literacyId}" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<caption>
				<spring:message code="ggzyliteracy" />
			</caption>
			<caption style="height: 10px"></caption>
			<tr>
				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyidcode" />：</label></td>
				<td class="td2"><input type="text" name="literacyIdcode"
					value="${ggzyliteracy.literacyIdcode }"
					class="input-medium validate[required,minSize[18]] required"
					maxlength="18" /></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyname" />：</label></td>
				<td class="td2"><input name="literacyName" type="text"
					value="${ggzyliteracy.literacyName }" id="literacyname"
					class="input-medium validate[required,custom[onlyChinese],maxSize[100]] required"
					maxlength="100"></td>


				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacysex" />：</label></td>
				<td class="td2"><select name="literacySex">
						<option value="1"
							${ggzyliteracy.literacySex == 1 ? "selected='selected'" : ""}>男</option>
						<option value="2"
							${ggzyliteracy.literacySex == 2 ? "selected='selected'" : ""}>女</option>
				</select></td>
			</tr>

			<tr>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacybirthday" />：</label></td>
				<td class="td2"><input id="d12" type="text"
					name="literacyBirthday"
					value="<fmt:formatDate value="${ggzyliteracy.literacyBirthday.time }"></fmt:formatDate>" 
					class="input-medium validate[required,custom[date],maxSize[32]] date" onclick="WdatePicker();"
					maxlength="32" /><a class="inputDateButton" onclick="javascript:;">选择</a>
					 </td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_areacode" />：</label></td>
				<td class="td2"><input name="areaCode" type="text"
					value="${ggzyliteracy.areaCode }"
					class="input-medium validate[required,custom[onlyNumberSp],maxSize[6]] required"
					maxlength="100"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyhighestdegree" />：</label></td>
				<td class="td2"><input type="text"
					value="${ggzyliteracy.literacyHighestdegree }"
					name="literacyHighestdegree"
					class="input-medium validate[required,maxSize[50]] required"
					maxlength="50" /></td>

			</tr>
			<tr>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyphone" />：</label></td>
				<td class="td2"><input name="literacyPhone" type="text"
					value="${ggzyliteracy.literacyPhone }"
					class="input-medium validate[required,custom[phone],maxSize[32]] required"
					maxlength="32"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyaddress" />：</label></td>
				<td class="td2"><input name="literacyAddress" type="text"
					value="${ggzyliteracy.literacyAddress }"
					class="input-medium validate[required,maxSize[50]] required"
					maxlength="50"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacypostCode" />：</label></td>
				<td class="td2"><input type="text"
					value="${ggzyliteracy.literacyPostCode }" name="literacyPostCode"
					class="input-medium validate[required,custom[onlyNumberSp],maxSize[6]],minSize[6]] required"
					maxlength="6" /></td>

			</tr>
			<tr>



				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyfirmCode" />：</label></td>
				<td class="td2"><input name="literacyFirmCode" type="text"
					value="${ggzyliteracy.literacyFirmCode }"
					class="input-medium validate[required,maxSize[9]] required"
					maxlength="9"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyfirmName" />：</label></td>
				<td class="td2"><input name="literacyFirmName" type="text"
					value="${ggzyliteracy.literacyFirmName }"
					class="input-medium validate[required,maxSize[100]] required"
					maxlength="100""></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyisoffice" />：</label></td>
				<td class="td2"><select name="literacyisOffice">
						<option value="0"
							${ggzyliteracy.literacySex == 0 ? "selected='selected'" : ""}>是</option>
						<option value="1"
							${ggzyliteracy.literacySex == 1 ? "selected='selected'" : ""}>否</option>
				</select></td>

			</tr>
			<tr>



				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyduties" />：</label></td>
				<td class="td2"><input name="literacyDuties" type="text"
					value="${ggzyliteracy.literacyDuties }"
					class="input-medium validate[required,maxSize[50]] required"
					maxlength="100"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacytechnicaltitle" />：</label></td>
				<td class="td2"><input name="literacyTechnicalTitle"
					type="text" value="${ggzyliteracy.literacyTechnicalTitle }"
					class="input-medium validate[required,maxSize[50]] required"
					maxlength="100"></td>

				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyworkexperience" />：</label></td>
				<td class="td2"><input type="text"
					value="${ggzyliteracy.literacyWorkExperience }"
					name="literacyWorkExperience"
					class="input-medium validate[required,maxSize[200]] required"
					maxlength="200" /></td>

			</tr>
			<tr>
				<td class="td1"><label><spring:message
							code="ggzyliteracy_literacyworkagelimit" />：</label></td>
				<td class="td2" colspan="5"><input type="text"
					name="literacyWorkAgelimit"
					value="${ggzyliteracy.literacyWorkAgelimit }"
					class="input-medium validate[required,custom[onlyNumberSp],maxSize[2]] required"
					maxlength="2" /></td>

			</tr>

		</table>
	</div>
</div>