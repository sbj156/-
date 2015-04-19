<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:if test="${empty ggzyNotice }">
<c:set var="ggzyNotice" value="${ggzyApply.notice }"/>
</c:if>
<c:if test="${empty ggzyBidPro}">
<c:set var="ggzyBidPro" value="${ggzyNotice.bidPro }"/>
</c:if>
<script type="text/javascript">
<!--
$().ready(function(){
	$("#num").blur(function(){
		$("#others").loadUrl('${contextPath }/${business_ctx}/ggzyapplys?nv_=ggzyapplys/combolist',{
			businessTypeId:'${param.businessTypeId}',
			num:this.value
		});
		
		
		
	});
	
	$("[name='isMain']").change(function(){
		if(this.value==1){
			console.info($("#all"))
			$("#all").css("display","block")
		}else{
			console.info($("#all"))
			$("#all").css("display","none")
		}
	})
	//console.info($("[name='isMain']:checked").val());
})
//-->
</script>
<div class="pageFormContent" layoutH="58">
	<div class="panel" defH="55">
		<h1>项目基本信息</h1>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tble_masge">
				<tr>
					<td height=40 style="width: 15%"><spring:message code="ggzybidpro_procode"/> ：</td>
					<td style="width: 35%">${ggzyNotice.bidPro.proCode }</td>
					<td style="width: 15%"><spring:message code="ggzybasepro_proname"/>：</td>
					<td>${ggzyNotice.bidPro.bidProName}</td>
				</tr>
				<tr>
					<td><spring:message code="ggzybidpro_tenderee"/>：</td>
					<td>${ggzyNotice.bidPro.tenderee.subjectName }</td>
					<td><spring:message code="ggzybidpro_agency"/>：</td>
					<td>${ggzyNotice.bidPro.agency.subjectName }</td>
				</tr>
			</table>

		</div>
</div>
	<input type="hidden" name="bidPro.bidProId" value="${ggzyBidPro.bidProId}" />
	<input type="hidden" name="notice.noticeId" value="${ggzyNotice.noticeId}" />
	
	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="tble_xmlb">
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_main"/></label></td>
				<td class="td2" colspan="3"><label><input type='radio' value='1' name='isMain' ${ggzyApply.isMain?"checked":"" } />是<input type='radio' value='0' name='isMain'  ${ggzyApply.isMain?"":"checked" } />否</label></td>
			</tr>			
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_biddingsubject"/>：</label></td>
				<td class="td2" colspan="3"><input name="biddingSubject.biddingSubjectId" type="hidden" value="${ggzyApply.biddingSubject.biddingSubjectId }"/>
					<input class="validate[required] required" name="biddingSubject.subjectName" type="text" readonly="readonly" style="width: 140px;" value="${ggzyApply.biddingSubject.subjectName }"/> 
					<a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/lookUpList?search_LIKE_subjectType.code=B&search_EQ_biddingSubjectId=${ggzyApply.biddingSubject.biddingSubjectId }" lookupGroup="biddingSubject">查找带回</a>
					<a class="btnLook" href="${contextPath }/business/ggzybiddingsubjects/${ggzyApply.biddingSubject.biddingSubjectId }" style="display:none" lookupGroup="biddingSubject" title="查看详细">查看详细</a>
					</td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_contact"/>：</label></td>
				<td class="td2"><input name="contact" type="text"
					class="input-medium validate[required,maxSize[100],custom[chinese]] required"
					maxlength="100" value="${ggzyApply.contact }"></td>
				<td class="td1"><label><spring:message code="ggzyapply_tel"/>：</label></td>
				<td class="td2"><input name="tel" type="text"
					class="input-medium validate[required,maxSize[100],custom[phone]] required"
					maxlength="100" value="${ggzyApply.tel }"></td>
			</tr>
			<tr>
				<td class="td1"><label><spring:message code="ggzyapply_operator"/>：</label></td>
				<td class="td2"><input name="operator" type="text"
					class="input-medium validate[required,maxSize[100],custom[chinese]] required"
					maxlength="100" value="${ggzyApply.operator }"></td>
				<td class="td1"><label><spring:message code="ggzyapply_applytime"/>：</label></td>
				<td class="td2"><input name="applyTime" type="text" readonly="readonly"
					class="input-medium validate[required] required date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" maxlength="100" value="<spring:eval expression="ggzyApply?.applyTime" />"></td>
			</tr>
		</table>
	</div>
	<div id='all' style="${ggzyApply.comboCompany.size()>0?'':'display:none' }">
	<div class="panel">
		<h1>联合体其他企业信息</h1>
		<div><table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr><td class="td1" width=100px><label>联合体其他企业数量：</label></td>
			<td class="td2"><input class="validate[number,required] required" type="text" style="width: 140px;" id="num" name='num' value="${ggzyApply.comboCompany.size() }" /></td></tr>
			</table></div>
	</div>
	<div id="others" class="div_xmtj" style="">
		<c:forEach var="item" items="${ggzyApply.comboCompany }">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tble_xmlb">
					<tr>
						<td class="td1"><label><spring:message code="ggzyapply_biddingsubject"/>：</label></td>
						<td class="td2" colspan="3">${ item.biddingSubject.subjectName }</td>
					</tr>
					<tr>
						<td class="td1"><label><spring:message code="ggzyapply_contact"/>：</label></td>
						<td class="td2">${ item.contact }</td>
						<td class="td1"><label><spring:message code="ggzyapply_tel"/>：</label></td>
						<td class="td2">${ item.tel }</td>
					</tr>
			</table>
			<BR>
			</c:forEach>
	</div>
	</div>
</div>


