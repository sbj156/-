<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<div class="pageFormContent" layoutH="58">
		<p>
			<label><spring:message code="ggzybusinesstype_name"/> </label>
			<input type="text" name="name" value="${ ggzyBusinessType.name}" class="input-medium validate[required,maxSize[100]] required" maxlength="100"/>
		</p>
		<p>
			<label><spring:message code="ggzybusinesstype_code" />：</label>
			<input type="text" name="code" value="${ ggzyBusinessType.code}" class="input-medium validate[required,minSize[2],maxSize[4]] required" maxlength="100"/>
		</p>
		<p>
			<label>排序</label>
			<input type="text" name="sortIndex" class="input-medium validate[required,number] required" value="${ggzyBusinessType.sortIndex }" maxlength="100"/>
		</p>
		<p>
			<label>父类型</label>
			<form:select path="parent.businessTypeId" >
				<option value=''>请选择</option>
				<form:options items="${virtualTypes }" itemLabel="name" itemValue="businessTypeId"/>
			</form:select>
		</p>
		<p>
			<label>是否是虚类型</label>
			<input type="radio" name="virtualType" value="0" ${ggzyBusinessType.virtualType?"":"checked" }/>否
			<input type="radio" name="virtualType" value="1" ${ggzyBusinessType.virtualType?"checked":"" }/>是
		</p>
	</div>
			
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button type="submit">确定</button></div></div></li>
			<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
		</ul>
	</div>
