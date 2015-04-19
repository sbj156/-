<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>

<div class="pageFormContent" layoutH="58">
	<input type="hidden" name="id" value="${pro.id}" />

	<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
			<caption>改变交易方式项目记录表</caption>
			<caption style="height: 10px"></caption>
			
			<tr>
				<td class="td1"><label>项目名称：</label></td>
				<td class="td2"><input type="text" name="projectName" value="${pro.projectName }" class="input-medium validate[required,maxSize[100]] required" maxlength="100" /></td>
				<td class="td1"><label>标段名称：</label></td>
				</td>
				<td class="td2"><input type="text" name="tenderName" class="input-medium validate[required,maxSize[100]] required" maxlength="100" value="${pro.tenderName }" /></td>
			</tr>
			<tr>
				<td class="td1"><label>交易编号：</label></td>
				<td class="td2"><input type="text" name="projectCode" value="${pro.projectCode }" class="input-medium validate[required,maxSize[100]] required" maxlength="100" /></td>
				<td class="td1"><label>招标人：</label></td>
				<td class="td2"><input type="text" name="tendereeName" value="${pro.tendereeName }" class="input-medium validate[required,mmaxSize[100]] required" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label>原交易方式：</label></td>
				<td class="td2"><input type="text" name="oldBusinessWay" value="${pro.oldBusinessWay }" class="input-medium validate[required,maxSize[100]] required" maxlength="100" /></td>
				<td class="td1"><label>原交易时间：</label></td>
				<td class="td2"><input type="text" name="oldBidTime" value="<spring:eval expression="pro?.oldBidTime"/>" class="input-medium validate[maxSize[100],custom[date], required] required date" maxlength="100" onclick="WdatePicker()"/></td>
			</tr>
			<tr>
				<td class="td1"><label>最终交易方式：</label></td>
				<td class="td2"><input type="text" name="businessWay" value="${pro.businessWay }" class="input-medium validate[maxSize[100], required] required" maxlength="100" /></td>
				<td class="td1"><label>最终交易时间：</label></td>
				<td class="td2"><input type="text" name="bidTime" value="<spring:eval expression="pro?.bidTime"/>" class="input-medium validate[maxSize[100],required,custom[date]] required date" onclick="WdatePicker()" maxlength="100" /></td>
			</tr>
			<tr>
				<td class="td1"><label>中标人：</label></td>
				<td class="td2"><input type="text" name="bidder" value="${pro.bidder }" class="input-medium validate[maxSize[100],required] required" maxlength="100" /></td>
				<td class="td1"><label>中标价：</label></td>
				<td class="td2"><input type="text" name="bidPrice" value="${pro.bidPrice }" class="input-medium validate[maxSize[100],required,custom[number]] required" maxlength="100" /></td>
			</tr>
			
		</table>
	</div>
</div>