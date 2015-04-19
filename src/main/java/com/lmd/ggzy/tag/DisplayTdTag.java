package com.lmd.ggzy.tag;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.beanutils.BeanUtilsBean2;
import org.apache.commons.lang3.math.NumberUtils;

import com.lmd.ggzy.domain.assist.BusinessTypeReport;
import com.lmd.util.PropertyUtil;

/**
 * 以td 方式输出BusinessTypeReport中的属性
 * @author mh_cxp
 *
 */
public class DisplayTdTag extends SimpleTagSupport {

	private Collection list;
	
	/**
	 * 取BusinessTypeReport的对应属性
	 */
	private String displayField;
	/**
	 * 是否显示合计
	 */
	private boolean showTotal;
	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		super.doTag();
		StringBuffer sb = new StringBuffer();
		BigDecimal total = BigDecimal.ZERO;
		
		
		if(list != null){
			for(Object obj : list){
				sb.append("<td>");
				Object value = PropertyUtil.getProperty(obj, displayField);
				if(showTotal && NumberUtils.isNumber(value + "")){
					total = total.add(new BigDecimal(value + ""));
				}
				sb.append(value);
				sb.append("</td>");
			}
			if(showTotal){
				sb.append("<td>");
				sb.append(total);
				sb.append("</td>");
			}
		}
		getJspContext().getOut().write(sb.toString());
	}

	public Collection getList() {
		return list;
	}

	public void setList(Collection list) {
		this.list = list;
	}

	public String getDisplayField() {
		return displayField;
	}

	public void setDisplayField(String displayField) {
		this.displayField = displayField;
	}

	public boolean isShowTotal() {
		return showTotal;
	}

	public void setShowTotal(boolean showTotal) {
		this.showTotal = showTotal;
	}


}
