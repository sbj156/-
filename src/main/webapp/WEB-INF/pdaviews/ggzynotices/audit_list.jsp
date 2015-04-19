<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/WEB-INF/pdaviews/head.jsp" %>
<title>审核公告</title>
</head>
<body>
<c:set value="${contextPath }/${business_ctx}/${module_path }" var="listUrl_" />
	<div class="twotit"><a href="${contextPath }/management/index" class="floL hand backbt"></a>审核公告</div>
	<div class="titall">
		<div class="brief">
			<div class="sele">
				<dwz:paginationForm action="${contextPath }/${business_ctx}/ggzynotices" page="${page }">
				名称:<input type="text" name="search_LIKE_bidPro.basePro.proName" value="${param[" search_LIKE_bidPro.basePro.proName"] }" />
				状态:<select name="search_EQ_auditStatus">
						<option value="">--全部--</option>
						<option value="0" ${param.search_EQ_auditStatus eq '0'? 'selected':'' }>未审核</option>
						<option value="1" ${param.search_EQ_auditStatus eq '1'? 'selected':'' }>审核未通过</option>
						<option value="2" ${param.search_EQ_auditStatus eq '2'? 'selected':'' }>审核通过</option>
					</select>
					<input type="hidden" name="nv_" value="${param['nv_'] }" />
					<input type="submit" value="查询" style="width: 50px" />
				</dwz:paginationForm>
			</div>
			<div class="wor marT10">
				<c:forEach var="item" items="${list}">
					<div class="wor marT10">
						<a href="${contextPath}/${business_ctx }/ggzynotices/${item.noticeId}?form&nv_=ggzynotices/${item.auditStatus eq '0'? "audit":"auditshow" }&businessTypeId=${item.bidPro.businessType.businessTypeId}">
							<div class="wortit">${item.bidPro.proCode}</div>
							<div class="worww">
								${item.bidPro.bidProName}<br /> ${item.noticeName}<br />
								<spring:eval expression="item.makeTime" />
								<br />${item.bidPro.tenderee.subjectName},${item.bidPro.agency.subjectName} <br /> <font color="blue">${mh:auditStatus(item.auditStatus) }</font>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
