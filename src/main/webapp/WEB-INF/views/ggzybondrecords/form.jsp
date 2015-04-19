<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/include.inc.jsp"%>
<%@include file="module.jsp"%>
<div class="div_xmtj">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tble_xmlb">
	<tbody>
		<tr>
			<td align="center" class="td1"><span >工程名称</span></td>
			<td align=left class="td2"><span>山东大学中心校区学生公寓一期建设工程施工</span>
				<div align=center></div></td>
			<td align="center" class="td1"><span >投标人</span></td>
			<td align=left class="td2"><span>山东鲁建工程集团有限公司</span>
				<div align=center></div></td>
		</tr>
		<tr>
			<td align=center class="td1"><span >开户单位</span></td>
			<td align=left class="td2">
				</td>
			<td align=center class="td1"><span >开户银行</span></td>
			<td align=left class="td2"></td>
		</tr>
		<tr>
			<td align=center class="td1"><span >帐号</span></td>
			<td align=left class="td2"></td>
			<td align=center class="td1"><span >银行地址</span></td>
			<td align=left class="td2"></td>
		</tr>
		<tr>
			<td align=center class="td1"><span ><font color="red">*</font>投标人开户银行</span></td>
			<td align=left class="td2"><input class="input required" info='投标人开户银行' id=khyh name=khyh value="--" />
				<div align=center></div></td>
			<td align="center" class="td1"><span class=style1><font color="red">*</font>开户账号</span></td>
			<td align=left class="td2"><input class="input required" info='开户账号' id=yhzh size=25 name=yhzh value="--" /></td>
		</tr>
		<tr>
			<td align="center" class="td1"><span><font color="red">*</font>开户行地址</span></td>
			<td align="left" class="td2"><input class="input required" info='开户行地址' id=khhdz name=khhdz value="--" /></td>
			<td align="center" class="td1"><span ><font color="red">*</font>投标人电话</span></td>
			<td align=left class="td2"><input class="input required" info='投标人电话' id=lxdh size=25 name=lxdh value="15966644460" /> <input type="hidden" name="apply_guid" value="465032" /> <input type="hidden" name="company_code" value="{fe32ade5-5fdd-960c-4e04-0007f01005cc}" /> <input type="hidden" name="action" value="update" /></td>
		</tr>
		<tr>
			<td align="center" class="td1"><span class=style1>投标保证金金额(元)</span></td>
			<td align=left class="td2" colspan="3">80万元&nbsp;&nbsp;40万元&nbsp;&nbsp;10万元&nbsp;&nbsp;5万元</td>
		</tr>
		<tr>
			<td align="center" class="td1"><span >缴纳</span></td>
			<td align="left" class="td2" colspan=3><br/><span>投标保证金 <input class="input required" info='保证金金额' name="bond" value="0" style="width: 70px"> 万元（ <select id=zfbf name=bond_type>
							<option value=1>现金</option>
							<option value=2>支票</option>
							<option value=3>银行汇票</option>
							<option value=4>电汇</option>
							<option value=5>银行本票</option>
							<option value=6>其他形式</option>
					</select>
				）于<input class="input" info='保证金缴纳时间' name="pay_time" onfocus="setday(this)" value="--" style="width: 120px"> 时缴纳。
			</span><br/>
				<div align="right">(签章)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div align="right">2014年07月15日&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
		</tr>
		 <tr>
			<td align=middle class="td1">
				<div align="center">
					<span class=style1>退还</span>
				</div>
			</td>
			<td align=left class="td2" colspan=3>
					<span><input type=radio value=1 name=back_reson> 1、中标的； <label></label> <br> <input type=radio value=2 name=back_reson> 2、未中标的；<br> <input type=radio value=3 name=back_reson> 3、投标人拒绝延长投标有效期的；<br> <input type=radio value=4 name=back_reson> 4、投标文件有重大偏差或其他原因经评标委员会评审，被依法作废标处理的；<br> <input type=radio value=5 name=back_reson> 5、投标人因被举报或者涉嫌其他违规行为而被调查或诉讼，未依法没收和抵押赔偿的。<br> <input type=radio value=6 name=back_reson> 6、违反招标文件规定，依据法律、法规的规定，投标保证金不予退付的；<br> <input type=radio value=7 name=back_reson> 7、法律法规规定的其他情况。 </span>
				<div align="right">(签章)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div align="right">2014年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</td>
		</tr>
		<tr >
			<td align='center' class="td1" class=style1>办理咨询电话</td>
			<td align='left' class="td2" colspan=3>建筑市场处(6号窗口)：66605828&nbsp;&nbsp;&nbsp;&nbsp;交易中心：66605831</td>
		</tr>
		<tr>
			<td align='center' class="td1" class=style1>招投标保证金缴退需知</td>
			<td align='left' class="td2" colspan=3>
				<div>一、收款资料：</div>
				<br>
				<blockquote style="margin-right: 0px" dir="ltr">
					<div>1、投标单位携带银行的受理证明（进账单、电汇凭证、现金交款单）在开标日之前至中心窗口开具收款收据并盖章确认；</div>
					<br>
					<div>2、投标保证金必须以投标单位的名称（或分公司）缴纳，退还时按原缴费单位退回。</div>
					<br>
				</blockquote>
				<div dir="ltr">二、退款资料</div>
				<br>
				<blockquote style="margin-right: 0px" dir="ltr">
					<div dir="ltr">投标单位携带缴退通知单、在公共资源交易中心6号窗口盖章后准备一下材料到17号窗口办理。</div>
					<br>
					<div>1、投标单位查询利息后开具收款收据（加盖企业财务章；收据金额包括本金及利息）；</div>
					<br>
					<div>2、经办人身份证原件及复印件（加盖企业公章）；</div>
					<br>
					<div>3、中标单位需携带已备案的合同及中标通知书；</div>
					<br>
					<div>4、投标单位银行的账户信息（保证金均以转账的方式退还）。</div>
				</blockquote>
			</td>
		</tr> 
	</tbody>
</table>
</div>
