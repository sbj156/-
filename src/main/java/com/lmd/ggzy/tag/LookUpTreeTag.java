package com.lmd.ggzy.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.lmd.ggzy.domain.GgzyTreeLib;

public class LookUpTreeTag extends SimpleTagSupport {

	private GgzyTreeLib value;

	private String group;
	
	private String defaultId = "";
	
	private String defaultName = "";
	
	private int rootId;
	
	private String title = "";
	/**
	 * <a class="btnLook" href="${contextPath}/business/treelib/lookupParent/7?rootId=7" lookupGroup="computeCurrency" mask="true" title="请选择<spring:message code="ggzytenders_computecurrency" />" width="400">查找带回</a>
	 */
	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		/**id Field start */
		sb.append("<input type=\"hidden\" name=\"");
		sb.append(this.group);
		sb.append(".id\" value=\"");
		sb.append(value == null? defaultId: value.getId());
		sb.append("\" />");
		/**id Field end */
		
		/**name Field start */
		sb.append("<input class=\"validate[required] required\" type=\"text\" style=\"width: 140px;\" readonly=\"readonly\" name=\"");
		sb.append(this.group);
		sb.append(".name\" value=\"");
		sb.append(value == null? defaultName: value.getName());
		sb.append("\" />");
		/**name Field end */
		
		/**but start*/
		sb.append("<a class=\"btnLook\" href=\"");
		sb.append(((PageContext)this.getJspContext()).getServletContext().getContextPath());
		sb.append("/business/treelib/lookupParent/");
		sb.append(rootId);
		sb.append("?rootId=");
		sb.append(rootId);
		sb.append("\" lookupGroup=\"");
		sb.append(group);
		sb.append("\" mask=\"true\"");
		sb.append("title=\"请选择");
		sb.append(this.title);
		sb.append("\" width=\"400\">查找带回</a>");
		this.getJspContext().getOut().write(sb.toString());
		super.doTag();
	}
	public GgzyTreeLib getValue() {
		return value;
	}
	public void setValue(GgzyTreeLib value) {
		this.value = value;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getDefaultId() {
		return defaultId;
	}
	public void setDefaultId(String defaultId) {
		this.defaultId = defaultId;
	}
	public String getDefaultName() {
		return defaultName;
	}
	public void setDefaultName(String defaultName) {
		this.defaultName = defaultName;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

}
