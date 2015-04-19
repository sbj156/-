package com.ketayao.ketacustom.tag.dwz;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.collections.CollectionUtils;

import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.service.ModuleService;


public class MobileMenuAccordionTag extends MenuAccordionTag{

	private Long moduleId;
	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		ModuleService moduleService = getBean(ModuleService.class);
		Module m = moduleService.get(moduleId);
		
		Module root = getChild();
		if(root.getId().equals(1l))
			root = getChildModule(root, 1001l);
		List<Module> modules = calChildren(root);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < modules.size(); i++) {
			Module module = modules.get(i);
			if(i%2 == 0){
				sb.append("<table width='100%' border='0' cellspacing='0' cellpadding='0' class='onediv'><tr><td>&nbsp;</td><td width='148'><a href='");
				sb.append(buildUrl(module));
				sb.append("'><img style='width: 148px;height: 96px;' src='");
				sb.append(getUrlPrefix());
				sb.append("/styles/mobile/images/");
				sb.append(module.getSn());
				sb.append(".png' class='hand' /></a><br />");
				sb.append(module.getPdaName());
				sb.append("</td><td>&nbsp;</td>");
			}else{
				sb.append("<td width='148'><a href='");
				sb.append(buildUrl(module));
				sb.append("'><img style='width: 148px;height: 96px;' src='");
				sb.append(getUrlPrefix());
				sb.append("/styles/mobile/images/");
				sb.append(module.getSn());
				sb.append(".png' class='hand' /></a><br />");
				sb.append(module.getPdaName());
				sb.append("</td><td>&nbsp;</td>");
				sb.append("</tr></table>");
			}
		}
		if(modules.size()%2 == 1){
			sb.append("<td width='148'>");
			sb.append("</td><td>&nbsp;</td>");
			sb.append("</tr></table>");
		}
		
		getJspContext().getOut().print(sb.toString());
		
		
		/*getJspContext().getOut().write("<a href=\"");
		if(CollectionUtils.isNotEmpty(m.getChildren())){
			String url = buildUrl(m.getChildren().iterator().next());			
			getJspContext().getOut().write(url);
		}
		getJspContext().getOut().write("\">");
		getJspBody().invoke(null);
		getJspContext().getOut().write("</a>");*/
	}
	
	private Module getBusinessModule(Module module){
		if(CollectionUtils.isEmpty(module.getChildren()))
			return module;
		else
			return getBusinessModule(module.getChildren().iterator().next());
	}
	
	@Override
	protected String buildUrl(Module module) {
		// TODO Auto-generated method stub
		String url = "";
		if(module.isBusinessModule() && CollectionUtils.isNotEmpty(module.getChildren()))
			url= super.buildUrl(getBusinessModule(module));
		else if(CollectionUtils.isNotEmpty(module.getChildren()))
			url = "/management/index?moduleId=" + module.getId();
		else
			url = super.buildUrl(module);
		if (!(url.startsWith("http:") || url.startsWith("https:") || url.endsWith("#"))) {
			url = getUrlPrefix() + url ;
		}
		return url;
	}

	
	public Long getModuleId() {
		return moduleId;
	}
	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}
	
	private Module getChildModule(Module parent, Long id){
		if(parent != null && parent.getChildren() != null){
			for(Module m : parent.getChildren())
				if(id.equals(m.getId()))
					return m;
		}
		return null;
	}
	
	
	
	private List<Module> calChildren(Module root){
		List<Module> list = new ArrayList<Module>();
		if(root != null && root.getChildren() != null){
			for(Module m : root.getChildren()){
				/**
				 * 1.非业务节点,
				 */
					if((!m.isBusinessModule())&& CollectionUtils.isNotEmpty(m.getChildren()) && m.getChildren().size() == 1)
						list.addAll(calChildren(m));
					else 
						list.add(m);
			}
		}
		return list;
	}
}
