<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<td><input name="ids" value="<spring:eval expression="item.id"/>" type="checkbox"></td>
<td>${item.tenders.bidPro.proCode}</td>
<td>${item.tenders.bidPro.bidProName}</td>
<td>${item.tenders.tendersName}</td>
<td><spring:eval expression="item.notice.noticeName" /></td>
<td><spring:eval expression="item.bidTime" /></td>
<td>${empty item.ggzyBidOpenings? "未开标":"已开标" }&nbsp&nbsp${not empty item.exceptionalCase && item.exceptionalCase.step ne 'eval'? "废标":""}</td>