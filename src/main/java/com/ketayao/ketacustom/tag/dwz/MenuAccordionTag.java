package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.util.CollectionUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ketayao.ketacustom.entity.main.Module;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.util.UrlUtil;

/**
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since 2013年10月15日 上午11:42:36
 */
public class MenuAccordionTag extends SimpleTagSupport {

	private Module child;
	private String urlPrefix;

	
	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.jsp.tagext.SimpleTagSupport#doTag()
	 */
	private GgzyBusinessTypeService businessTypeService;

	protected <T> T getBean(Class<T> clazz) {
		PageContext pageContext = (PageContext) this.getJspContext();
		ServletContext servletContext = pageContext.getServletContext();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		return wac.getBean(clazz);
	}
	
	public GgzyBusinessTypeService getBusinessTypeService() {
		if (businessTypeService == null) {
			businessTypeService = getBean(GgzyBusinessTypeService.class);
		}
		return businessTypeService;
	}

	/**
	 * 初始化业务模块
	 */
	/*private List<Module> intitBusinessModule(Module parent){
		businessTypeService = getBusinessTypeService();
		List<Module> businessModules = new ArrayList<Module>();
		List<GgzyBusinessType> businessTypes = businessTypeService.findAllGgzyBusinessTypes();
		for(GgzyBusinessType businessType : businessTypes){
			Module m = new Module();
			m.setName(businessType.getName());
			m.setUrl(appendParams(parent.getUrl(), "businessTypeId=" + businessType.getBusinessTypeId()));
			m.setParameters(parent.getParameters());
			m.setJsonParam(parent.isJsonParam());
			m.setSn(parent.getSn() + "_" + businessType.getCode().toLowerCase());
			m.setId(businessTypes.hashCode() + 0l);
			m.setParent(parent);
			businessModules.add(m);
		}
		return businessModules;
	}*/
	
	@Override
	public void doTag() throws JspException, IOException {
		
		getJspContext().getOut().write(link(child));
		loop(child);
	}

	private void loop(Module module) throws IOException, JspException {
		List<Module> list = new ArrayList<Module>();
		
		list.addAll(module.getChildren());
		if (!CollectionUtils.isEmpty(list)) {
			getJspContext().getOut().write("<ul>\n");
			for (Module m : list) {
				getJspContext().getOut().write("<li>\n");

				getJspContext().getOut().write(link(m));
				loop(m);
				getJspContext().getOut().write("</li>\n");
			}
			getJspContext().getOut().write("</ul>\n");
		}
	}

	
	protected String buildUrl(Module module) {
		String url = module.getUrl();
		if(module.isBusinessModule() && CollectionUtils.isEmpty(module.getChildren())){
			url = "#";
		}
		String params = module.getParameters();
		
		Map<String, Object> jsonPara = new HashMap<String, Object>();
		if(module.getChildren().size() == 0){
			jsonPara.put("taskId", new String[]{module.getSn(), module.getParent().getSn()});
		}
		if (StringUtils.isNotEmpty(params)) {
			if (module.isJsonParam()) {
				try {
					jsonPara.putAll(new ObjectMapper().readValue(params, Map.class));
				} catch (JsonParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				url = UrlUtil.appendParams(url, params);
			}
		}
		for(Entry<String, Object> entry : jsonPara.entrySet()){
			Object v = entry.getValue();
			if(v instanceof String[]){
				for(String v_ : (String[])v){
					url = UrlUtil.appendParams(url, entry.getKey() + "=" + v_);
				}
			}else
				url = UrlUtil.appendParams(url, entry.getKey() + "=" + v);
		}
		return url;
	}
	

	@SuppressWarnings("unchecked")
	private String link(Module module) {
		StringBuilder builder = new StringBuilder();
		String menuName = module.getName();
		if (module.isShowParent())
			menuName = module.getParent().getName() + "-" + menuName;
		String url = buildUrl(module);
		builder.append("<a ");
		
		// 打开外部链接
		if (url.startsWith("http:") || url.startsWith("https:")) {
			builder.append("href=\"" + url + "\" target=\"navTab\" external=\"true\" rel=\"" + module.getSn() + "_" + module.getId() + "\">" + menuName + "</a>\n");
		} else if (url.startsWith("/") || url.startsWith("\\")) {
			// 打开内部链接
			builder.append("href=\"" + urlPrefix + url + "\" target=\"navTab\"  rel=\"" + module.getSn() + "_" + module.getId() + "\">" + menuName + "</a>\n");
		} else if (url.endsWith("#")) {
			// 当前链接
			builder.append("href=\"" + url + "\" target=\"navTab\"  rel=\"" + module.getSn() + "_" + module.getId() + "\">" + menuName + "</a>\n");
		} else {
			// 打开内部链接，自动补齐'/'
			builder.append("href=\"" + urlPrefix + "/" + url + "\" target=\"navTab\"  rel=\"" + module.getSn() + "_" + module.getId() + "\">" + menuName + "</a>\n");
		}

		return builder.toString();
	}

	/**
	 * @param child
	 *            the child to set
	 */
	public void setChild(Module child) {
		this.child = child;
	}

	/**
	 * @param urlPrefix
	 *            the urlPrefix to set
	 */
	public void setUrlPrefix(String urlPrefix) {
		this.urlPrefix = urlPrefix;
	}

	public Module getChild() {
		return child;
	}

	public String getUrlPrefix() {
		return urlPrefix;
	}
	
}
