<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="bidProId" value="${ggzyBidPro.bidProId}" /> <input type="hidden" name="basePro.baseProId" value="${ggzyBidPro.basePro.baseProId}" />

	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<caption>${businessType.name }项目进场登记</caption>
			<caption style="height: 10px"></caption>
			<tr>
				<td class="td1"><label>交易编号：</label></td>
				<td class="td2" colspan="5"><input type="text" readonly="readonly" name="proCode" value="${ggzyBidPro.proCode }" class="input-medium validate[maxSize[100]]" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1">
					<!-- 业务类型 --> <input type="hidden" name="businessType.businessTypeId" value="${param.businessTypeId }" /> <label>专业类型：</label>
				</td>
				<td class="td2"><c:choose>
						<c:when test="${empty ggzyBidPro.majorType}">
							<select name="majorType.majorTypeId" id="majorType">
								<c:forEach var="item" items="${majorTypes}">
									<option value="${item.majorType.majorTypeId }">${item.majorType.name }</option>
								</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
				${ggzyBidPro.majorType.name}
					</c:otherwise>
					</c:choose></td>
				<td class="td1"><label>区域：</label></td>
				<td class="td2"><input name="basePro.area.id" value="${ggzyBidPro.basePro.area.id}" type="hidden" /> <input class="validate[required] required" name="basePro.area.name" type="text" readonly="readonly" value="${ggzyBidPro.basePro.area.name}" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/2?rootId=2" lookupGroup="basePro.area" mask="true" title="寻找区域" width="400">查找带回</a></td>
				<td class="td1"><label>招标方式：</label></td>
				<td class="td2"><c:choose>
						<c:when test="${empty ggzyBidPro.businessWay}">
							<select name="businessWay.businessWayId" id="businessWay">
								<c:forEach var="item" items="${businessWays}">
									<option value="${item.businessWay.businessWayId }">${item.businessWay.name }</option>
								</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
				${ggzyBidPro.businessWay.name}
					</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td class="td1"><label>项目名称：</label></td>
				<td class="td2" colspan='2'><input type="text" name="basePro.proName" value="${ggzyBidPro.bidProName }" class="input-medium validate[required,maxSize[100]] required" maxlength="100" /></td>
				<td class="td1"><label>项目地址：</label></td>
				<td class="td2" colspan='2'><input type="text" style="width:260px" name="basePro.proAddress" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.basePro.proAddress }" /></td>
				
				
			</tr>
			<tr>
				<td class="td1"><label>招标计划批文：</label></td>
				<td class="td2"><input name="approval" type="text" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.approval }"></td>
				<td class="td1"><label>招标计划批复：</label></td>
				<td class="td2"><input name="planLicence" type="text" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.planLicence }"></td>
				<td class="td1"><label>项目类型：</label></td>
				<td class="td2"><input name="proxyNotarization" type="radio" value="1" ${ggzyBidPro.proxyNotarization?"checked":""} /> 一般 <input name="proxyNotarization" type="radio" value="0" ${ggzyBidPro.proxyNotarization?"":"checked"}> 大型</td>
			</tr>
			<tr>
				<td class="td1"><label>项目规模：</label></td>
				<td class="td2"><input type="text" name="basePro.proScal" class="input-medium validate[required,maxSize[32]] required" maxlength="32" value="${ggzyBidPro.basePro.proScal }" /></td>
				<td class="td1"><label>业主提供材料清单：</label></td>
				<td class="td2" colspan="3"><span style="float: left; line-height: 20px"> <c:choose>
							<c:when test="${empty ggzyBidPro.fileList }">
								<input name="fileList" type="checkbox" id="FILE_LIST" value="建设项目计划批文及附件"> A、建设项目计划批文及附件； <br>
								<input name="fileList" type="checkbox" id="FILE_LIST" value="招标计划批复"> B、招标计划批复； <br>
								<input name="fileList" type="checkbox" id="FILE_LIST" value="核备或批复的施工图预算"> C、核备或批复的施工图预算； <br>
								<input name="fileList" type="checkbox" id="FILE_LIST" value="建审查合格的施工图"> D、审查合格的施工图； <br>
					</c:when>
							<c:otherwise>
								<spring:eval expression="ggzyBidPro?.fileList?.replaceAll(',', '<br/>')" htmlEscape="false" />
							</c:otherwise>
						</c:choose>

				</span></td>
			</tr>
			<tr>
				<td class="td1"><label>招标人：</label></td>
				<td class="td2"><input name="tenderee.biddingSubjectId" type="hidden" value="${ggzyBidPro.tenderee.biddingSubjectId }" /> <input class="validate[required] required" name="tenderee.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyBidPro.tenderee.subjectName }" /> <a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList?search_LIKE_subjectType.code=T" lookupGroup="tenderee">查找带回</a></td>
				<td class="td1"><label>招标人联系人：</label></td>
				<td class="td2"><input type="text" name="basePro.contactPerson" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.basePro.contactPerson }" /></td>
				<td class="td1"><label>招标人联系方式：</label></td>
				<td class="td2"><input type="text" name="basePro.contactWay" class="input-medium validate[custom[phone],maxSize[32]]" maxlength="32" value="${ggzyBidPro.basePro.contactWay }" /></td>
			</tr>
		</table>
	</div>
</div>