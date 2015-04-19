<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--


$(document).ready(function(){


});

//-->
</script>

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
				
				<td class="td2" colspan=5><input type="text" name="basePro.proName" value="${ggzyBidPro.bidProName }" class="input-medium validate[required,maxSize[100]] required" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label>原项目编号：</label></td>
				<td class="td2"><input type="text" name="oldProject" class="input-medium validate[required,effe,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.oldProject }" /></td>
				<td class="td1"><label>计划编号：</label></td>
				<td class="td2" colspan=3><input type="text" name="plancode" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.plancode }" /></td>
				
			</tr>
			<tr>
				<td class="td1"><label>采购人：</label></td>
				<td class="td2"><input name="tenderee.biddingSubjectId" type="hidden" value="${ggzyBidPro.tenderee.biddingSubjectId }" /> <input class="validate[required] required" name="tenderee.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyBidPro.tenderee.subjectName }" /> <a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList?search_LIKE_subjectType.code=T" lookupGroup="tenderee">查找带回</a></td>
				<td class="td1"><label>本项目联系人：</label></td>
				<td class="td2"><input type="text" name="contract" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.contract }" /></td>
				<td class="td1"><label>本项目联系方式：</label></td>
				<td class="td2"><input type="text" name="contractTel" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.contractTel }" /></td>
			</tr>
			<tr>
			<td class="td1"><label>代理机构：</label></td>
				<td class="td2"><input name="agency.biddingSubjectId" type="hidden" value="${ggzyBidPro.agency.biddingSubjectId }" /> <input class="validate[required] required" name="agency.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyBidPro.agency.subjectName }" /> <a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList?search_LIKE_subjectType.code=A" lookupGroup="agency">查找带回</a></td>
				<td class="td1"><label>本项目联系人：</label></td>
				<td class="td2"><input type="text" name="agencyContacts" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.agencyContacts }" /></td>
				<td class="td1"><label>本项目联系方式：</label></td>
				<td class="td2"><input type="text" name="agencyTel" class="input-medium validate[custom[phone],maxSize[32]]" maxlength="32" value="${ggzyBidPro.agencyTel }" /></td>
				</tr>
			<%-- <tr>
				
				<td class="td1"><label>代理机构负责人：</label></td>
				<td class="td2"><input type="text" name="agencyContacts" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.agencyContacts }" /></td>
				<td class="td1"><label>代理机构联系电话：</label></td>
				<td class="td2"><input type="text" name="agencyTel" class="input-medium validate[custom[phone],maxSize[32]]" maxlength="32" value="${ggzyBidPro.agencyTel }" /></td>
				
			</tr> --%>
			<tr>
				<td class="td1"><label>受理人员：</label></td>
				<td class="td2"><input type="text" name="person" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${ggzyBidPro.person }" /></td>
				<td class="td1"><label>登记时间：</label></td>
				<td class="td2" colspan=3><input type="text" name="createTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 09:00:00', minDate:'%y-%M-%d'})" class="date validate[required] required"  value="<spring:eval expression="ggzyBidPro?.createTime"/>" /></td>
			</tr>
		</table>
	</div>
</div>