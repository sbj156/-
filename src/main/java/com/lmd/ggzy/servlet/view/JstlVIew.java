package com.lmd.ggzy.servlet.view;

import java.io.File;
import java.util.Locale;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.view.JstlView;


public class
        JstlVIew extends JstlView {

	@Override
	public boolean checkResource(Locale locale) throws Exception {
		// TODO Auto-generated method stub

		File file = new File(this.getServletContext().getRealPath(getUrl()));
		return file.exists();//判断该jsp页面是否存在
	}
}
