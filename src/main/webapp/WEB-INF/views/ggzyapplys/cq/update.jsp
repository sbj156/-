<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<style type="text/css">
	ul.rightTools {float:right; display:block;}
	ul.rightTools li{float:left; display:block; margin-left:5px}
</style>

<div class="pageContent">
	<form method="post"
		action="${contextPath }/${business_ctx}/${module_path}/update"
		class="required-validate pageForm"
		onsubmit="return validateCallback(this, dialogReloadNavTab);">
		<input type="hidden" name="baseProId" value="${ggzyBasePro.baseProId}" />
		<div class="pageFormContent" layoutH="58">
			<div class="pageContent">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tble_masge">
					<tr>
						<td class="td1" style="width: 10%">交易编号：</td>
						<td class="td2" style="width: 10%">2014JSSZ04Z0005</td>
						<td class="td1" style="width: 20%">项目名称：</td>
						<td class="td2" style="width: 70%">济南热电有限公司纬十二路、阳光南路南延供热管网安装工程</td>
					</tr>
					<tr>
						<td class="td1">招标人：</td>
						<td class="td2">济南热电有限公司</td>
						<td class="td1">代理机构：</td>
						<td class="td2">山东贝特建筑项目管理咨询有限公司</td>
					</tr>
				</table>
			</div>
			<div class="pageFormContent" layoutH="58">
				<table class="list" width="100%" class="table_border">
					<thead>
						<tr>
							<td width="50"><div align="center">序号</div></td>
							<td width="200"><div align="center">企业名称</div></td>
							<td width="170"><div align="center">资质等级</div></td>
							<td width="150"><div align="center">营业执照</div></td>
							<td width="110"><div align="center">报名时间</div></td>
							<td width="70"><div align="center">报名操作人</div></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="50"><div align="center">01</div></td>
							<td width="200"><div align="center">山东省肥城市安装工程有限公司</div></td>
							<td width="170"><div align="center">市政公用工程施工总承包贰级</div></td>
							<td width="150"><div align="center">370983228016161</div></td>
							<td width="110"><div align="center">2014-05-15 11:58</div></td>
							<td width="70"><div align="center">薛灵云</div></td>
						</tr>
						<tr>
							<td width="50"><div align="center">02</div></td>
							<td width="200"><div align="center">山东一箭建设有限公司</div></td>
							<td width="170"><div align="center">市政公用工程施工总承包贰级</div></td>
							<td width="150"><div align="center">370900228023565</div></td>
							<td width="110"><div align="center">2014-05-16 12:23</div></td>
							<td width="70"><div align="center">薛灵云</div></td>
						</tr>
						<tr>
							<td width="50"><div align="center">03</div></td>
							<td width="200"><div align="center">山东枣建建设集团有限公司</div></td>
							<td width="170"><div align="center">市政公用工程施工总承包贰级</div></td>
							<td width="150"><div align="center">370400018007749</div></td>
							<td width="110"><div align="center">2014-05-19 12:08</div></td>
							<td width="70"><div align="center">薛灵云</div></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="button">
						<div class="buttonContent">
							<button type="submit">导出Excel</button>
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
</div>