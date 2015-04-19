<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
$().ready(function(){
	var disabled_ = $("input[type='button']:disabled",$.pdialog.getCurrent());
	disabled_.attr("class","btn2");
	$("input[type='button']",$.pdialog.getCurrent()).css("cursor","pointer");
	$(".notice_").each(function(){
		if($(this).width() > 360){
			$(".notice_").width($(".notice_").width() + 70)
			return false;
		}
	})
	
});
	function ApplyStyle(s) {
		
		document.getElementsByName("mytab").className = s.innerText;
	}
//-->
</script>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<div class="panel" defH="55">
			<h1>项目基本信息</h1>
			<div>
				<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_masge">
					<tr>
						<td height=40 style="width: 15%"><spring:message code="ggzybidpro_procode" /> ：</td>
						<td style="width: 35%">${ggzyBidPro.proCode }</td>
						<td style="width: 15%"><spring:message code="ggzybasepro_proname" />：</td>
						<td>${ggzyBidPro.bidProName}</td>
					</tr>
					<tr>
						<td><spring:message code="ggzybidpro_tenderee" />：</td>
						<td>${ggzyBidPro.tenderee.subjectName }</td>
						<td><spring:message code="ggzybidpro_agency" />：</td>
						<td>${ggzyBidPro.agency.subjectName }</td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" name="bidProId" value="${ggzyBidPro.bidProId}" /> <input type="hidden" name="basePro.baseProId" value="${ggzyBidPro.basePro.baseProId}" />
		<table >
			<tr>
				<td style="width: 90px"><input type="button" target="dialog" value="进场登记" class="btn" rel="bidpro_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzybidproes/${ggzyBidPro.bidProId}?businessTypeId=${ggzyBidPro.businessType.businessTypeId}"> <img style="display: inline;" src="${contextPath }/images/arrows.gif"></td>
				<td>
					<!-- 公告信息 --> <c:forEach items="${ggzyBidPro.ggzyNotices }" var="notice">
					<hr>
						<table >
							<tr>
								<td class="notice_" style="min-width: 360px;line-height: 30px;" align="left">
								<input title="${notice.noticeName }<spring:eval expression="notice.tendererDocGainTime"/>" type="button" target="dialog" value="发布公告" class="btn" rel="notice_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/${notice.noticeId}?businessTypeId=${ggzyBidPro.businessType.businessTypeId}"> <img src="${contextPath }/images/arrows.gif" > <input type="button" target="dialog" value="接收报名" class="btn" rel="apply_list" mask="true" width="800" height="600" href="${contextPath }/${business_ctx}/ggzyapplys?nv_=ggzyapplys/applylist&search_EQ_notice.noticeId=${notice.noticeId}&orderField=applyTime&businessTypeId=${param.businessTypeId}"> <img src="${contextPath }/images/arrows.gif"> <input type="button" value="费用缴退" class="btn"> <img src="${contextPath }/images/arrows.gif"> <span><input title="<spring:eval expression="notice.bidDocSubEndtime"/>" type="button" target="dialog" value="场所安排" class="btn" ${empty notice.bidDocSubEndtime ?"disabled":""} rel="notice_edit" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynotices/${notice.noticeId}?form&businessTypeId=${ggzyBidPro.businessType.businessTypeId}"
									data='{"nv_":"ggzybidsites/show"}'> </span> <img src="${contextPath }/images/arrows.gif">
										<c:if test="${notice.noticeType.code eq '2' }">
											<!-- 资格预审项目 -->
											<input type="button" target="dialog" value="资格预审" class="btn" rel="apply_list" mask="true" width="800" height="600" href="${contextPath }/${business_ctx}/ggzynotices/${notice.noticeId}?form&businessTypeId=${ggzyBidPro.businessType.businessTypeId}" data='{"nv_":"ggzyproquaresults/show"}'><img src="${contextPath }/images/arrows.gif">
										</c:if>
										</td>
								<td >
								<c:forEach items="${notice.noticeTenderses }" var="noticeTenders" varStatus="status">
										<div style="text-align: left;line-height:30px; margin: 5px;">
										<a target="dialog" rel="tenders_show" minable='true' mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzytenderses/${noticeTenders.tenders.tendersId }?businessTypeId=${ggzyBidPro.businessType.businessTypeId}">${noticeTenders.tenders.tendersName }</a>
										<c:choose>
											<c:when test="${not empty noticeTenders.exceptionalCase && noticeTenders.exceptionalCase.step ne 'eval' && noticeTenders.exceptionalCase.dealWay.code ne '3'}">
											<input type="button" target="dialog" value="废标" class="btn" rel="bidopening_annulled" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzyexceptionalcases?form&tendersId=<spring:eval expression="noticeTenders.id"/>&step=openning&businessTypeId=${ggzyBidPro.businessType.businessTypeId}" >
											</c:when>
											<c:otherwise>
											<input ${empty noticeTenders.ggzyBidOpenings ?"disabled":"" } type="button" target="dialog" value="开标记录" class="btn" rel="bidopening_show" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzybidopenings?form&tendersId=<spring:eval expression="noticeTenders.id"/>&businessTypeId=${ggzyBidPro.businessType.businessTypeId}" data='{"nv_":"ggzybidopenings/show"}'>
											<img src="${contextPath }/images/arrows.gif"> 
										<input ${empty noticeTenders.expertApply? "disabled":"" } type="button" target="dialog" value="专家抽取" class="btn" rel="evaluation_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/<spring:eval expression="noticeTenders.id"/>&businessTypeId=${ggzyBidPro.businessType.businessTypeId}" data='{"nv_":"ggzyexpertapplys/showrecord"}'> <img src="${contextPath }/images/arrows.gif"> 
										<c:choose>
											<c:when test="${noticeTenders.exceptionalCase.step eq 'eval'}">
											<input type="button" target="dialog" value="废标" class="btn" rel="bidopening_annulled" mask="true" width="900" height="600" href="${contextPath }/${business_ctx}/ggzyexceptionalcases?form&tendersId=<spring:eval expression="noticeTenders.id"/>&step=openning&businessTypeId=${ggzyBidPro.businessType.businessTypeId}">
											</c:when>
											<c:otherwise>
											<input ${empty noticeTenders.evaluationReport?"disabled":"" } type="button" target="dialog" value="评标记录" class="btn" rel="evaluation_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzynoticetenderses/<spring:eval expression="noticeTenders.id"/>&businessTypeId=${ggzyBidPro.businessType.businessTypeId}" data='{"nv_":"ggzyevaluationreports/showcadidate"}'>
											<img src="${contextPath }/images/arrows.gif"> <input ${empty noticeTenders.bidPublicitiy?"disabled":"" } type="button" target="dialog" value="中标公示" class="btn" rel="publicity_show" minable='true' width="900" height="600" href="${contextPath }/${business_ctx}/ggzybidpublicitys/${noticeTenders.bidPublicitiy.bidPublicityId}?businessTypeId=${ggzyBidPro.businessType.businessTypeId}"> <img src="${contextPath }/images/arrows.gif"> <input ${empty noticeTenders.tenders.biddingResNotice?"disabled":"" } type="button" target="dialog" value="中标通知" class="btn" rel="tenders_show" mask="true" width="1000" height="600" href="${contextPath }/${business_ctx}/ggzybiddingresnotices?tendersId=<spring:eval expression="noticeTenders.id"/>&nv_=ggzybiddingresnotices/show&businessTypeId=${ggzyBidPro.businessType.businessTypeId}"> <img src="${contextPath }/images/arrows.gif"> <input type="button" value="签订合同" class="btn2" disabled>
											</c:otherwise>
										</c:choose>
											</c:otherwise>
										</c:choose>
										 
										</div>
										<c:if test="${status.index < notice.noticeTenderses.size() -1 }"><hr/></c:if>
									</c:forEach>
									
									</td>
							</tr>
						</table>
						<!-- 专家后信息 -->
					</c:forEach>
					<hr>
				</td>
			</tr>
		</table>
		<div style="line-height: 30px;margin-left: 100px"><input type="button" class="btn">蓝色为已处理步骤，点击可查看详细<br/>
		<input type="button" class="btn2">红色为未处理步骤</div>
		
	</div>
	<div class="formBar">
		<ul>
			<li><div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div></li>
		</ul>
	</div>
</div>