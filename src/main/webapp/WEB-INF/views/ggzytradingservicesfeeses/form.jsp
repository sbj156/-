<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set var="bidProId" value="${empty param['bidPro.bidProId']?ggzyTenders.bidPro.bidProId: param['bidPro.bidProId']}" />
<script type="text/javascript">
	$().ready(function() {
		if ('${bidProId}'.length > 0) {
			$("select[name='bidPro.bidProId']").val('${bidProId}');
			$("select[name='bidPro.bidProId']").attr("readonly", "true");
		}
		var $pagerForm = $(".div_xmtj", $.pdialog.getCurrent());
		$("td",$pagerForm).addClass("td2");
	});
</script>
<style>
<!--
table td{font-size: 14px}
.tnt { width: 50px; word-wrap: break-word; letter-spacing: 15px; text-align: center;font-size: 14px;line-height: 20px} 
-->
</style>
<c:set var="tenders" value="${noticeTenders.tenders }"/>
<c:set var="cadidate" value="${noticeTenders.biddingCandidate }"/>
<c:if test="${not empty fee }">
<c:set value="${fee.tenders.biddingCandidates }" var="cadidate"/>
</c:if>
<div class="pageFormContent" layoutH="58">
<input type="hidden" name="id" value='<spring:eval expression="noticeTenders.id"/>'>
	<div class="div_xmtj">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<caption style="line-height: 40px">济南市建筑工程施工手续办理通知单</caption>
			<tr>
				<td class="td2" colspan="2" width="200">
						工程名称
					</td>
				<td colspan="7">${tenders.proName }</td>
				<td >
						招标单位
					</td>
				<td >${tenders.bidPro.tenderee.subjectName}</td>
				<td >
						联系人
					</td>
				<td >${tenders.bidPro.basePro.contactPerson}</td>
				<td >
						电话
					</td>
				<td >${tenders.bidPro.basePro.contactWay}</td>
			</tr>
			 <tr>
				<td colspan="2">建设地址</td>
				<td colspan="7">${tenders.bidPro.basePro.proAddress }</td>
				<td>
						 中标单位 
					</td>
				<td>${cadidate.applyTender.apply.biddingSubject.subjectName}</td>
				<td>
						 联系人 
					</td>
				<td>${cadidate.applyTender.apply.contact} </td>
				<td>
						 电话 
					</td>
				<td>${cadidate.applyTender.apply.tel}</td>
			</tr>
			<tr>
				<td colspan="2">投资性质</td>
				<td width="100">${tenders.bidPro.basePro.capticalSource}</td>
				<td width="100">
						结构形式
					</td>
				<td width="100">${tenders.structureType }</td>
				<td width="70">
						建筑面积
					</td>
				<td width="70">${tenders.area }</td>
				<td width="70">
				<td width="80"></td>
				<td width="100">
						 监理单位 
					</td>
				<td width="200"></td>
				<td width="50">
						联系人 
					</td>
				<td width="70">
				</td>
				<td width="50">
						 电话 
					</td>
				<td width="100"></td>
			</tr>
			<tr>
				<td rowspan="2" align="center" >
				<div class="tnt" align="center">济南市城乡建设委员会</div>
				</td>
				<td colspan="4" >办理单位</td>
				<td colspan="2" >办理事项</td>
				<td >收费基数</td>
				<td >收费标准</td>
				<td >应缴金额(元)</td>
				<td >部门审核</td>
				<td colspan="3" >办理事项依据</td>
				<td >备注</td>
			</tr>
			<tr>
				<td colspan="4">济南建设工程交易中心</td>
				<td colspan="2">交易服务费</td>
				<td align="center">${cadidate.applyTender.ggzyBidDocs.price }(元)</td>
				<td align="center" ><input type="hidden" name="feeScale.id" value="${tenders.fee.feeScale.id }"/>
			<input class="validate[required] required" name="feeScale.name" type="text" readonly="readonly" value="${tenders.fee.feeScale.name }" style="width: 40px;"/>
			<a class="btnLook" href="${contextPath}/business/treelib/lookupParent/16?rootId=16" lookupGroup="feeScale" mask="true" title="" width="400">选择收费标准</a></td>
				<td align="center"><input type="text" name="fee" class="input" size="6" value="${tenders.fee.fee }"/></td>
				<td></td>
				<td colspan="3"></td>
				<td></td>
			</tr>
			<tr>
				<td width="100" colspan="3">
						说明
					</td>
				<td colspan="12">
				此报表办理完毕后，到审批中心建委窗口审领施工许可证（电话：86561860）服务大厅电话：66605831
				</td>
			</tr>
		</table>
	</div>
</div>