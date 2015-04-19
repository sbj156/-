<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
	<c:set value="${noticeTenders.biddingCandidate }" var="cadidate" />

<c:set value="${noticeTenders.tenders }" var="tenders"/>
<c:set var="bidProId" value="${empty param['bidPro.bidProId']?ggzyTenders.bidPro.bidProId: param['bidPro.bidProId']}" />
<script type="text/javascript">
	/* $().ready(function() {
		if ('${bidProId}'.length > 0) {
			$("select[name='bidPro.bidProId']").val('${bidProId}');
			$("select[name='bidPro.bidProId']").attr("readonly", "true");
		}
		var $pagerForm = $(".div_xmtj", $.pdialog.getCurrent());
		$("td", $pagerForm).addClass("td2");
		var h_ = $("#rightTab").height() + 11;
		$("#leftTab").height(h_);
		$("#rightTab").height(h_);
		
		if('${empty tenders.biddingResNotice}' == 'true'){
			var jsonObj = {
		        	id:{
		        		tendersId:'${noticeTenders.id.tendersId}',
		        		noticeId:'${noticeTenders.id.noticeId}',
		        		applyTenderId:'${cadidate.applyTender.applyTenderId}'
		        	}
		        };
			console.info(jsonObj);
			jQuery.ajax({
		        type: 'POST',
		        dataType: "json",contentType:"application/json" ,
		        url: '${contextPath }/${business_ctx}/ggzybiddingresnotices/json',
		        data:JSON.stringify(jsonObj),
		        error: function() { 
		        },
		        success: function(data) { 
		        	$('#zbbh',$.pdialog.getCurrent()).html(data);
				}		
		    });
		}
	}); */
</script>
<style>
<!--
td,th {
	color: #000000;
	font-size: 12px;
	height: 20px;
}
-->
</style>

<div layoutH="58" style="vertical-align: text-top; margin-top: 0">
	<table border=0 width="100%" align=center height="100%">
		<tbody>
			<tr>
				<td height="100%" width="49%" valign="top">
					<table id="leftTab" border=1 cellspacing=0 bordercolor=#000000 width="100%" height="700">
						<tbody>
							<tr>
								<td style="font-size: 12px" colspan=2><b>顺序号：<span id="zbbh">${tenders.biddingResNotice.num}</span></b></td>
							</tr>
							<tr>
								<td colspan="2">
									<table style="font-size: 12px" border=0 width="100%" height=480>
										<tr>
											<td style="font-size: 18px" colspan=2 align=center>济南公共资源交易项目</td>
										</tr>
										<tr>
											<td height=30 colspan=2>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size: 20px" colspan=2 align=center><b>中&nbsp;标&nbsp;通&nbsp;知&nbsp;书</b><br> <span style="font-size: 14px">(工程建设类)</span></td>
										</tr>
										<tr>
											<td height=18 colspan=2>&nbsp;</td>
										</tr>
										<tr>
											<td style="line-height: 8mm; font-size: 14px" colspan=2><b>&nbsp;&nbsp;&nbsp;&nbsp;为实现资源优化配置，保护国家，社会公共利益和当事人的合法权益，依据国家相关法律法规规定程序，该项目在济南公共资源交易中心进行交易。<br>&nbsp;&nbsp;&nbsp;&nbsp;中标公示期满，经招标人确定，同意该项目中标结果，特发此证。
											</b></td>
										</tr>
										<tr>
											<td height=250 colspan=2>&nbsp;</td>
										</tr>
										<tr>
											<td style="font-size: 14px" height=69 width="50%">&nbsp;&nbsp;&nbsp;&nbsp;招标监督机构：--（盖章）</td>
											<td style="font-size: 14px" width="50%" align=right>审核人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(签字)</td>
										</tr>
										<tr>
											<td style="font-size: 14px" height=45 colspan=2 align=right>
												<div id=print_time>
													<fmt:formatDate value="${sysdate_}" pattern="yyyy-MM-dd" />
												</div>
											</td>
										</tr>
									</table>


								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td width="2%">&nbsp;</td>
				<td width="49%" >
					<table border=1 id="rightTab" cellspacing=0 bordercolor=#000000 width="100%" height="700">
						<tbody>
							<tr>
								<td style="font-size: 12px" height=20 width="30%" align=center><b>项目名称</b></td>
								<td style="font-size: 12px" id=project_name width="70%" colspan=3>${tenders.bidPro.bidProName }</td>
							</tr>
							<tr>
								<td style="font-size: 12px" width="15%" align=center><b>项目标段</b></td>
								<td style="font-size: 12px" id=tenders_name width="35%">${tenders.tendersName }</td>
								<td style="font-size: 12px" width="15%" align=center><b>交易登记号</b></td>
								<td style="font-size: 12px" id=project_code width="35%">${tenders.bidPro.proCode }</td>
							</tr>
							<tr>
								<td style="font-size: 12px" colspan=4>
									<table style="font-size: 12px" border=0 width="100%" height=480>
										<tbody>
											<tr>
												<td style="line-height: 6mm" id=notice height=61 valign=bottom colspan=2>${noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName }：<br>&nbsp;&nbsp;&nbsp;&nbsp;${tenders.proName }<%--工程名称 --%>，于<spring:eval expression="tenders.fee.noticeTenders.bidTime" /> 在济南公共资源交易中心开标后，经评标委员会评审，招标人确定，招标监督机构核准，你单位被确定为中标人。<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">中标项目地点：</font>${tenders.bidPro.basePro.proAddress }<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">中标项目概况(规模)：</font>${tenders.area }平方米&nbsp;&nbsp;&nbsp;&nbsp;结构类型：${tenders.structureType }<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">招标范围：</font>${tenders.bidRange }<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">
												<c:choose>
					<c:when test="${noticeTenders.ggzyBidOpenings.openningType.id eq 3}">
					中标费率：</font>${tenders.fee.noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.rate }%
					</c:when>
					<c:otherwise>
					中标价(人民币)：</font>${tenders.fee.noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.price }元
					</c:otherwise>
				</c:choose>
												&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">中标工期:</font>${tenders.fee.noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.projectDuration }日历天<br>&nbsp;&nbsp;&nbsp;&nbsp;<font
													style="font-family: 黑体">质量要求：</font>${tenders.fee.noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.quality }&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-family: 黑体">项目负责人(项目经理)：</font>${noticeTenders.bidPublicitiy.PM }<br> <font style="font-family: 黑体">其他内容：</font> <span>
														<div id=text></div>
												</span></td>
											</tr>
											<tr>
												<td colspan=2 align="center">
													<div width="70%">
														<spring:eval expression="noticeTenders.bidPublicitiy.publicityContent" htmlEscape="false" />
													</div>
												</td>
											</tr>
											<tr>
											<tr>
												<td colspan=2>&nbsp; <script>
													var text = $('--').text();
													$("#text").append("&nbsp;&nbsp;&nbsp;&nbsp;" + text)
												</script>
												</td>
											</tr>
											<tr>
												<td colspan=2>
													<table>
														<tbody>
															<tr>
																<td style="font-size: 12px" width=100 align=right>&nbsp;&nbsp;&nbsp;&nbsp;招标人：</td>
																<td style="font-size: 12px">___________</td>
																<td style="font-size: 12px">（盖章）</td>
																<td style="font-size: 12px" align=right>&nbsp;&nbsp;&nbsp;&nbsp;招标代理人：</td>
																<td style="font-size: 12px">___________</td>
																<td style="font-size: 12px">（盖章）</td>
															</tr>
															<tr>
																<td style="font-size: 12px" align=right>&nbsp;&nbsp;&nbsp;&nbsp;法定代表人：</td>
																<td style="font-size: 12px">___________</td>
																<td style="font-size: 12px">（盖章）</td>
																<td style="font-size: 12px" align=right>&nbsp;&nbsp;&nbsp;&nbsp;法定代表人：</td>
																<td style="font-size: 12px">___________</td>
																<td style="font-size: 12px">（盖章）</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td height=43 align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________年____月____日</td>
												<td height=43 align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________年____月____日</td>
											</tr>
											<tr>
												<td height=46 colspan=2>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td style="font-size: 12px" height=80 align=center>说明</td>
								<td style="font-size: 12px" height=80 valign=middle colspan=3>&nbsp;1.本中标通知书壹式四份，招标人、代理机构、中标人、监管机构所各壹份。<br>&nbsp;2.此件涂改无效。<br>&nbsp;3.请据此办理有关手续。 <iframe style="width: 0px; display: block; height: 0px" src="中标通知书_jsp_files/print_tzs.htm" name=cs></iframe></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>