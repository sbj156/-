package com.lmd.ggzy.servlet;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * servlet代理 把servlet作为普通Bean配置在Spring容器中,web.xml中配置servlet时 servlet-name
 * 为Spring 容器中servlet bean 的name(id) servlet-class为com.lmd.ggzy.servlet.DelegatingServletProxy
 * 
 * @author mh_cxp
 * 
 */
public class DelegatingServletProxy extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6056887640681802425L;

	private Servlet proxy;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		getServletBean();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		getServletBean();
		proxy.init(config);
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		proxy.service(req, res);
	}

	private void getServletBean() {
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
		this.proxy = (Servlet) wac.getBean(this.getServletName());
	}

}
