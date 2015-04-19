<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<dwz:paginationForm
	action="${contextPath }/${business_ctx}/${module_path}" page="${page }"
	onsubmit="return navTabSearch(this)">

	<div class="pageHeader">    <!-- 一行三列 一个如下<ul> </ul>  -->
	<div class="searchBar">
			<ul    class="searchContent">
				<li><label><spring:message code="ggzybasepro_proname" />：</label>
					<input type="text" name="search_LIKE_proName"
					value="${param.search_LIKE_proName }" />
				</li>
				<li><label>项目编号：</label>
					<input type="text" name="search_LIKE_prono"
					value="${param.search_LIKE_proN0 }" />
				</li>
	          
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


<div class="pageContent">

	<div class="panelBar">
		<ul class="toolBar">
			<!--<li><a iconClass="application_form_magnify" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span><spring:message
							code="ggzybasepro_showbtn" /> </span></a></li>
			<li><a iconClass="application_add" target="dialog"
				rel="lookup2organization_add" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}?business_type=F785D42A3F81B399E040007F0100159F&form"><span><spring:message
							code="ggzybasepro_addbtn" /> </span></a></li>-->
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="330"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}?form"><span>签到情况</span></a></li>
			<li><a iconClass="application_edit" target="dialog"
				rel="lookup2organization_edit" mask="true" width="800" height="500"
				href="${contextPath }/${business_ctx}/${module_path}/{slt_uid}"><span>唱标记录</span></a></li>
			<!--<li><a iconClass="application_delete" target="selectedTodo"
				rel="ids"
				href="${contextPath }/${business_ctx}/${module_path}/delete"
				title="确认要删除?"><span><spring:message
							code="ggzybasepro_deletebtn" /> </span></a></li>-->
		</ul>
	</div>

	<table class="table" layoutH="137" width="100%">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids"
					class="checkboxCtrl"></th>
				
				<th width="100" align='center'><spring:message code="ggzybasepro_procode" /></th>
				<th width="300"><spring:message code="ggzybasepro_proname" /></th>
                <th width="150"align='center'>交易时间</th>
				<th width="150"align='center'>企业签到</th>
				<th width="150"align='center'>唱标记录</th>
			<!--<th width="100"><spring:message code="ggzybasepro_areacode" /></th>
				<th width="100"><spring:message code="ggzybasepro_proaddress" /></th>
				<th width="100"><spring:message
						code="ggzybasepro_contactperson" /></th>
				<th width="100"><spring:message code="ggzybasepro_contactway" /></th>  -->
			
			</tr>
		</thead>
		<tbody>
			<tr target="slt_uid" rel="1" >
				<td width="22"><input name="ids" value="1" type="checkbox"></td>
				
	    		<td width="100">2014JSSG01Z0039</td>
			<!--	<td width="300">${item.area.name}</td> -->
			   <td width="300">绿地新都会一期西河片区C-2地块项目施工</td>
				<td width="150">2014-05-28</td>
				<td width="150">4/签到</td>
				<td width="150">已唱标</td>
				
			</tr>

			<tr target="slt_uid" rel="1" >
				<td width="22"><input name="ids" value="1" type="checkbox"></td>
			
	    		<td width="100">2014JSSZ05Z0005</td>
			<!--	<td width="300">${item.area.name}</td> -->
			   <td width="300">济南市北湖片区历黄路（滨河南路—水屯北路段）市政道路工程施工</td>
				<td width="150">2014-05-29</td>
				<td width="150">8/签到</td>
				<td width="150">未唱标</td>
				
			</tr>
		</tbody>
	</table>
	<!-- 分页 -->
	<dwz:pagination page="${page }" />
</div>
