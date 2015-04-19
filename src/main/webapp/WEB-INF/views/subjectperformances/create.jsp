<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<script type="text/javascript">
<!--
	$().ready(function() {
		$.ajax({
			url:'<%=request.getContextPath()%>/business/ggzybusinesstypes/json/F785D42A3F81B399E040007F0100159F',
			success:function(data){
				$.each(data.ggzyBusinessTypeMajors, function(i, item){
					$('#majorType').append("<option value='"+ item.majorType.majorTypeId +"'>"+item.majorType.name+"</option>");
				});
				$.each(data.ggzyBusinessTypeWays, function(i, item){
					$('#businessWay').append("<option value='"+ item.businessWay.businessWayId +"'>"+item.businessWay.name+"</option>");
				});
				
			}
		});
	})
//-->
</script>
<div class="pageContent">
	<form method="post"
		action="${contextPath }/${business_ctx}/ggzybidproes/create"
		class="required-validate pageForm"
		onsubmit="return validateCallback(this, dialogReloadNavTab);">
		<div class="pageFormContent" layoutH="58">
			<!-- 业务类型 -->
			<input type="hidden" name="businessType.businessTypeId"
				value="${param.business_type }" />
			<p>
				<label>专业类型：</label> <select name="majorType.majorTypeId"
					id="majorType">
					<%-- <c:forEach var="item" items="${majorTypes}">
						<option value="${item.majorType.majorTypeId }">${item.majorType.name
							}</option>
					</c:forEach> --%>
				</select>
			</p>
			<p>
				<label>区域：</label> <input name="basePro.area.id" value=""
					type="hidden" /> <input class="validate[required] required"
					name="basePro.area.name" type="text" readonly="readonly" value=""
					style="width: 140px;" /> <a class="btnLook"
					href="${contextPath}/business/treelib/lookupParent/2?rootId=2"
					lookupGroup="basePro.area" mask="true" title="寻找区域" width="400">查找带回</a>
			</p>
			<p>
				<label>招标方式：</label> <select name="businessWay.businessWayId"
					id="businessWay">
					<%-- <c:forEach var="item" items="${businessWays}">
						<option value="${item.businessWay.businessWayId }">${item.businessWay.name
							}</option>
					</c:forEach> --%>
				</select>
			</p>
			<p>
				<label>项目名称：</label> <input type="text" name="bidProName"
					class="input-medium validate[required,maxSize[100]] required"
					maxlength="100" />
			</p>
			<p>
				<label>项目地址：</label> <input type="text" name="basePro.proAddress"
					class="input-medium validate[required,maxSize[100]] required"
					maxlength="100" />
			</p>
			<p>
				<label>委托公证：</label> <input name="proxyNotarization" type="radio"
					value="1"> 是 <input name="proxyNotarization" type="radio"
					value="0" checked=""> 否
			</p>
			<p>
				<label>计划批文：</label> <input name="approval" type="text"
					class="input">
			</p>
			<p>
				<label>建设工程规划许可证：</label> <input name="planLicence" type="text"
					class="input">
			</p>
			<p>
				<label>法定代表人：</label> <input type="text" name="basePro.legalPerson"
					class="input-medium validate[required,maxSize[50]] required"
					maxlength="128" />
			</p>
			<p>
				<label>资金来源：</label> <input type="text"
					name="basePro.capticalSource"
					class="input-medium validate[required,maxSize[32]] required"
					maxlength="32" />
			</p>
			<p>
				<label>联系人：</label> <input type="text" name="basePro.contactPerson"
					class="input-medium validate[required,maxSize[100]] required"
					maxlength="100" />
			</p>
			<p>
				<label>联系方式：</label> <input type="text" name="basePro.contactWay"
					class="input-medium validate[custom[phone],maxSize[32]]"
					maxlength="32" />
			</p>

			<p>
				<label>项目规模：</label> <input type="text" name="basePro.proScal"
					class="input-medium validate[required,maxSize[32]] required"
					maxlength="32" />
			</p>
			<div>
				<label>业主提供材料清单：</label><span style="float:left"> <input name="fileList" type="checkbox"
					id="FILE_LIST" value="建设项目计划批文及附件（济南市建设项目招标方案核准意见）">
				A、建设项目计划批文及附件（济南市建设项目招标方案核准意见）； <br> <input name="fileList"
					type="checkbox" id="FILE_LIST" value="建设工程规划许可证">
				B、建设工程规划许可证； <br> <input name="fileList" type="checkbox"
					id="FILE_LIST" value="初步设计概算批准文件（国有投资项目）">
				C、初步设计概算批准文件（国有投资项目）； <br> <input name="fileList"
					type="checkbox" id="FILE_LIST" value="建设工程施工图设计文件审查备案书">
				D、建设工程施工图设计文件审查备案书； <br> <input name="fileList" type="checkbox"
					id="FILE_LIST" value="经市建设主管部门备案的《招标代理合同》">
				E、经市建设主管部门备案的《招标代理合同》。</span>
			</div>
			<!--  <table class="table" width="100%">
				<tbody>
					<tr>
						<td>1</td>
						<td>山东新昌隆建设咨询有限公司</td>
						<td>查看</td>
						<td>签到</td>
						<td><input name="fileList" type="checkbox"
					id="FILE_LIST" value="建设项目计划批文及附件（济南市建设项目招标方案核准意见）">
				A、建设项目计划批文及附件（济南市建设项目招标方案核准意见）； <br> <input name="fileList"
					type="checkbox" id="FILE_LIST" value="建设工程规划许可证">
				B、建设工程规划许可证； <br> <input name="fileList" type="checkbox"
					id="FILE_LIST" value="初步设计概算批准文件（国有投资项目）">
				C、初步设计概算批准文件（国有投资项目）； <br> <input name="fileList"
					type="checkbox" id="FILE_LIST" value="建设工程施工图设计文件审查备案书">
				D、建设工程施工图设计文件审查备案书； <br> <input name="fileList" type="checkbox"
					id="FILE_LIST" value="经市建设主管部门备案的《招标代理合同》">
				E、经市建设主管部门备案的《招标代理合同》。</td>
					</tr>
				</tbody>
			</table>  -->
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">确定</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">关闭</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>