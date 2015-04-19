<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<c:set value="${contextPath }/${business_ctx}/analysis/report/yearreport" var="listUrl_" />
<dwz:paginationForm action="${listUrl_ }" page="${page }" onsubmit="return navTabSearch(this)">
	<div class="pageHeader">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>业务类型：</label>
				<select  name="search_EQ_tenders.bidPro.businessType.businessTypeId">
					<option value="">---全部---</option>
					<c:forEach items="${businessTypes }" var="item">
					<option value="${item.businessTypeId }" ${param['search_EQ_tenders.bidPro.businessType.businessTypeId'] eq item.businessTypeId ? 'selected':'' }>${item.name }</option>
					</c:forEach>
				</select>
				</li>
				<li><label><spring:message code="ggzytenders_bidtime" />：</label> <input type="text" name="bidTime" value="${param['bidTime'] }" onfocus="WdatePicker()" /></li>

				<input type="hidden" name="nv_" value="${param['nv_'] }" />
				<input type="hidden" name="search_EMPTY_biddingCandidates" value="${param['search_EMPTY_biddingCandidates'] }" />
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="button">
							<div class="buttonContent">
								<button type="submit">
									<spring:message code="searchbtn" />
								</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</dwz:paginationForm>
<div class="pageContent " selector="h1" layoutH="42">
	<div class="panel " >
	<h1></h1>
		<div>
			<table class="table" id="openning" layoutH="200" width="100%">
		<thead>
			<tr>
			<th width="30">序号</th>
			<th width="100" ><spring:message code="ggzytenders_bidtime" /></th>
			<th width="100">交易类别</th>
			<th width="100">招标人、采购人</th>
			<th width="100">招标内容、采购内容</th>
			<th width="100"><spring:message code="ggzybidpro_procode" /></th>
			<th width="100">代理机构</th>
			<th width="100">中标金额(元)</th>
			<th width="200">中标人</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}" varStatus="status">
				<tr target="slt_uid" rel="<spring:eval expression="item.id"/>">
			<td>${status.index + 1}</td>
			<td><fmt:formatDate value="${item.bidTime.time }" pattern="MM-dd"/>(<fmt:formatDate value="${item.bidTime.time }" pattern="EEEE"/>)</td>
			<td>${item.tenders.bidPro.businessType.name}</td>
			<td>${item.tenders.bidPro.tenderee.subjectName}</td>
			<td>${item.tenders.proName}</td>
			<td>${item.tenders.bidPro.proCode}</td>
			<td>${item.tenders.bidPro.agency.subjectName}</td>
			<td>${item.biddingCandidate.applyTender.ggzyBidDocs.price}</td>
			<td>${item.biddingCandidate.applyTender.apply.biddingSubject.subjectName}</td>
			</tr>
			</c:forEach>
			<tr>
			<td>合计</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>${total}</td>
			<td></td>
			</tr>
		</tbody>
	</table>
		</div>
	</div>
	
	<div class="panel collapse" defH="150">
		<h1></h1>
		<div>
			<p>${dateStr },公共资源交易中心进场交易标段${list.size()}个,交易额${total }元
			<c:if test="${businessTypeReports.size() gt 0 }">,其中
				<c:forEach items="${businessTypeReports }" var="item" varStatus="status">
				${item.businessType.name }${item.count }项,交易成交额${item.price }元;
				</c:forEach>
			</c:if>
			</p>
			<br/>
		</div>
	</div>
<br/><br/>
</div>
