package com.lmd.spring.task;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import freemarker.template.Template;
import freemarker.template.TemplateException;

public class JcmsInfoFreeMarkerBuilder implements JcmsInfoBuilder<Map<String, Object>> {
	private static final Logger log = LoggerFactory.getLogger(JcmsInfoFreeMarkerBuilder.class);

	@Autowired
	private FreeMarkerConfig freeMarkerConfig;

	/**
	 * 模板前缀
	 */
	private String prefix;

	@Override
	public String buildInfo(Map<String, Object> info, String businessTypeCode) throws Exception {
		// TODO Auto-generated method stub
		Template t = null;
		t = findBusinessTypeTemplate(businessTypeCode);
		String noticeContent = null;
		noticeContent = processTemplate(info, t);
		return noticeContent;
	}

    /**
     *
     * @param templatesuffix 模板后缀
     * @return
     * @throws IOException
     */
	public Template findBusinessTypeTemplate(String templatesuffix) throws IOException {
		try {
			return findTemplate(prefix + "_" + templatesuffix);
		} catch (IOException e) {
			log.error(e.getMessage() + "for template with code " + templatesuffix);
		}
		return findTemplate(prefix);
	}

	public String processTemplate(Map<String, Object> root, Template template) throws TemplateException, IOException {
		StringWriter sw = new StringWriter();
		template.process(root, sw);
		return (sw.toString());
	}

	public Template findTemplate(String templateName) throws IOException {
		return freeMarkerConfig.getConfiguration().getTemplate(templateName);
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

}
