<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
	<c:set value="${noticeTenders.biddingCandidate }" var="cadidate" />

<c:set value="${noticeTenders.tenders }" var="tenders"/>
<c:set var="bidProId" value="${empty param['bidPro.bidProId']?ggzyTenders.bidPro.bidProId: param['bidPro.bidProId']}" />
<script type="text/javascript">
<!--
	$().ready(function() {
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
	});
//-->
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
											<td style="font-size: 20px" colspan=2 align=center><b>中&nbsp;标&nbsp;通&nbsp;知&nbsp;书</b><br> <span style="font-size: 14px">(政府采购类)</span></td>
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
								<td style="font-size: 12px" width="15%" align=center><b>项目标段(包)</b></td>
								<td style="font-size: 12px" id=tenders_name width="35%">${tenders.tendersName }</td>
								<td style="font-size: 12px" width="15%" align=center><b>交易登记号</b></td>
								<td style="font-size: 12px" id=project_code width="35%">${tenders.bidPro.proCode }</td>
							</tr>
							<tr>
								<td style="font-size: 12px" colspan=4 valign="top">
									<table style="font-size: 12px" border=0 width="100%" height=480>
										<tbody>
											<tr>
												<td style="line-height: 6mm" id=notice height=61 colspan=2>${noticeTenders.biddingCandidate.applyTender.apply.biddingSubject.subjectName}（中标人名称）：<br>&nbsp;&nbsp;&nbsp;&nbsp;你单位参加的投标(谈判)项目${tenders.bidPro.bidProName}<%--工程名称 --%>，经评标委员会（谈判小组）评定，被确定为中标（成交）供应商，中标（成交）内容：${tenders.bidPro.bidProName}，中标（成交）总金额${empty noticeTenders.biddingCandidate.applyTender.last?noticeTenders.biddingCandidate.applyTender.ggzyBidDocs.price:noticeTenders.biddingCandidate.applyTender.last }元。
												<br>&nbsp;&nbsp;&nbsp;&nbsp;请收到并确认本通知书后三十天内，按照采购文件确定的事项与采购人签订政府采购合同。<br>&nbsp;&nbsp;&nbsp;&nbsp;本通知书一经发出即产生法律效力，采购人改变中标（成交）结果或中标（成交）人放弃中标（成交）项目的，承担相应责任。
<BR><BR> <font style="font-family: 黑体">其他内容：</font> <span>
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