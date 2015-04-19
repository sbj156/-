<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%--
确定招标项目编号 
1.listOfPro 创建时 param.bidPro.bidProId
2.list 创建时  空
3.查看修改 ggzyTenders.bidPro.bidProId
  --%>
<c:set var="bidProId" value="${empty param['bidPro.bidProId']?ggzyTenders.bidPro.bidProId: param['bidPro.bidProId']}" />
<script type="text/javascript">
	$().ready(function() {
		if ('${bidProId}'.length > 0) {
			$("select[name='bidPro.bidProId']").val('${bidProId}');
			$("select[name='bidPro.bidProId']").attr("readonly", "true");
		}
	});
</script>
<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="tendersId" value="${ggzyTenders.tendersId }" />
	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<%-- <tr>
				<td class="td1"><label><spring:message code="ggzybidpro"/>：</label></td>
				<td class="td2" colspan="5">
					<select name="bidPro.bidProId" class="combox required">
						<c:forEach items="${ggzybidproes }" var="item">
						<option value="${item.bidProId}">${item.bidProName }</option>
						</c:forEach>
					</select>
				</td>
				
			</tr> --%>
			<input type="hidden" name="bidPro.bidProId" value="${bidProId}" />
			<tr>
				<td class="td1"><label><spring:message code="ggzytenders_tenderscode" />：</label></td>
				<td class="td2"><input type="text" name="tendersCode" readonly="readonly" value="${ggzyTenders.tendersCode }" class="input-medium validate[maxSize[100]]" maxlength="100" /></td>
				<td class="td1"><label><spring:message code="ggzytenders_tendersname" />：</label></td>
				<td class="td2"><input type="text" name="tendersName" value="${ggzyTenders.tendersName }" class="input-medium required validate[required]" maxlength="100" /></td>
			</tr>
		 	<tr>
				<td class="td1"><label><spring:message code="ggzytenders_classifycode" />：</label></td>
				<td class="td2">
				<input type="hidden" name="classifyCode.id" value="${ggzyTenders.classifyCode.id}" /> <input class="validate[required] required" name="classifyCode.name" type="text" readonly="readonly" value="${ggzyTenders.classifyCode.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/17?rootId=17" lookupGroup="classifyCode" mask="true" title="请选择<spring:message code="ggzytenders_classifycode" />" width="400">查找带回</a>
				</td>
				<td class="td1"><label><spring:message code="ggzytenders_computevalue" />：</label></td>
				<td class="td2"><input type="text" name="computeValue" value="${ggzyTenders.computeValue }" class="input-medium required validate[required,custom[number]] " maxlength="100" /></td>
			</tr> 
		 	<tr>

				<td class="td1"><label><spring:message code="ggzytenders_computecurrency" />：</label></td>
				<td class="td2"><input type="hidden" name="computeCurrency.id" value="${empty ggzyTenders.computeCurrency.id?"12416":ggzyTenders.computeCurrency.id}" /> <input class="validate[required] required" name="computeCurrency.name" type="text" readonly="readonly" value="${empty ggzyTenders.computeCurrency.name?"人民币": ggzyTenders.computeCurrency.name}" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/7?rootId=7" lookupGroup="computeCurrency" mask="true" title="请选择<spring:message code="ggzytenders_computecurrency" />" width="400">查找带回</a></td>
				<td class="td1"><label><spring:message code="ggzytenders_computeunit" />：</label></td>
				<td class="td2"><input type="hidden" name="computeUnit.id" value="${empty ggzyTenders.computeUnit.id?"12425":ggzyTenders.computeUnit.id}" /> <input class="validate[required] required" name="computeUnit.name" type="text" readonly="readonly" value="${empty ggzyTenders.computeUnit.name?"元":ggzyTenders.computeUnit.name }" style="width: 140px;" /> <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/7?rootId=8" lookupGroup="computeUnit" mask="true" title="请选择<spring:message code="ggzytenders_computeunit" />" width="400">查找带回</a></td>
			</tr> 
		<%-- 	<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_proname"/>：</label></td>
				<td class="td2" colspan="3"><input name="proName" value="${ggzyTenders.proName}" class="required validate[required,maxsize[200]]" size="80"/></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_bidrange"/>：</label></td>
				<td class="td2" colspan="3"><input name="bidRange" value="${ggzyTenders.bidRange}" class="required validate[required]" size="80"/></td>
			</tr> --%>
		<%-- 	<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_area"/>：</label></td>
				<td class="td2"><input name="area" value="${ggzyTenders.area}" class="validate[custom[number],required] required"/>平方米</td>
				<td class="td1"><label><spring:message code="ggzybidpublicity_scale"/>：</label></td>
				<td class="td2"><input name="scale" calss="validate[required,max[50]] required" value="${ggzyTenders.scale}"/></td>
			</tr> --%>
	<%-- 		<tr>
				<td class="td1"><label><spring:message code="ggzybidpublicity_structuretype"/>：</label></td>
				<td class="td2" colspan="3"><input name="structureType" value="${ggzyTenders.structureType}" calss="validate[required,max[50]] required"/></td>
			</tr> --%>
			
			<tr>
				<td class="td1"><spring:message code="ggzytenders_tenderscontent" /></td>
				<td class="td2" colspan="3"><textarea class="editor" name="tendersContent.content" rows="12" cols="90">${mh:clob2String(ggzyTenders.tendersContent.content) }</textarea></td>
			</tr>
			<tr>
				<td class="td1"><spring:message code="ggzytenders_bidderqualification" /></td>
				<td class="td2" colspan="3"><textarea class="editor" name="bidderQualification.content" rows="12" cols="90">${mh:clob2String(ggzyTenders.bidderQualification.content)}</textarea></td>
			</tr>
		</table>
	</div>
</div>