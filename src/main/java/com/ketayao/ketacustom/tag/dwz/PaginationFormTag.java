package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.util.StringUtils;

import com.ketayao.ketacustom.util.dwz.Page;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月15日 上午11:27:43 
 */
public class PaginationFormTag extends SimpleTagSupport {

	private Page page;
	private String action;
	private String onsubmit;

	private String buildInput(String name, String type , String value){
		return String.format("<input type=\"%s\" name=\"%s\" value=\"%s\"/>\n", type, name, value);
	}
	private String buildInput(ServletRequest request, String name, String type){
		String value = request.getParameter(name);
		if(value != null)
			return buildInput(name, type , value);
		else 
			return "";
	}
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	@Override
	public void doTag() throws JspException, IOException {
		StringBuilder builder = new StringBuilder();
		if (onsubmit != null) {
			builder.append("<form id=\"pagerForm\" method=\"get\" action=\"" + action + "\" onsubmit=\"" + onsubmit + "\">\n");
		} else {
			builder.append("<form id=\"pagerForm\" method=\"get\" action=\"" + action + "\">\n");
		}
		builder.append("<input type=\"hidden\" name=\"pageNum\" value=\"" + page.getPageNum() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"numPerPage\" value=\"" + page.getNumPerPage() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"orderField\" value=\"" + page.getOrderField() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"orderDirection\" value=\"" + page.getOrderDirection() + "\"/>\n");
		builder.append("<input type=\"hidden\" name=\"totalCount\" value=\"" + page.getTotalCount() + "\"/>\n");
		PageContext pageContext = (PageContext) this.getJspContext();
		String[] taskIds = pageContext.getRequest().getParameterValues("taskId");
		if(taskIds != null)
		for(String taskId: taskIds)
			builder.append("<input type=\"hidden\" name=\"taskId\" value=\""+ taskId +"\"/>");
		builder.append(buildInput(pageContext.getRequest(), "businessTypeId", "hidden"));
		getJspContext().getOut().write(builder.toString());
		
		getJspBody().invoke(null);
		
		getJspContext().getOut().write("</form>\n");
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(Page page) {
		if(page == null)
			page = new Page();
		this.page = page;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @param onsubmit the onsubmit to set
	 */
	public void setOnsubmit(String onsubmit) {
		this.onsubmit = onsubmit;
	}
}
