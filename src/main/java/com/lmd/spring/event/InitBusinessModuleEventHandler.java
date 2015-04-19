package com.lmd.spring.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.entity.main.Module;
import com.ketayao.ketacustom.entity.main.Permission;
import com.ketayao.ketacustom.service.ModuleService;
import com.ketayao.ketacustom.service.PermissionService;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
/**;
 * 初始化业务节点,添加业务节点业务类型权限
 * @author mh_cxp
 *
 */
@Component
public class InitBusinessModuleEventHandler implements SystemStartEventHandler {

	@Autowired
	private ModuleService moduleService;
	
	@Autowired
	private GgzyBusinessTypeService businessTypeService;
	
	@Autowired
	private PermissionService permissionService;
	
	@Override
	public void handle(ContextRefreshedEvent event) {
		initBusinessModules();
	}
	
	/**
	 */
	@Transactional
	public void initBusinessModules(){
		List<Module> modules = moduleService.findByBusinessModule(true);
		List<GgzyBusinessType> businessTypes = businessTypeService.findByExample(new GgzyBusinessType.VirtualSpecification(false));
	
		for(Module module : modules){
			initBusinessModule(module, businessTypes);
		}
	}
	
	/**
	 * 删除不存在的业务类型权限
	 * 在删除业务类型后
	 * 
	 */
	private void deleteUnExistsBusinessPermission(){
		
	}
	
	/**
	 * 判断module权限中是否有业务类型权限,如果没有则添加
	 * @param module
	 * @param businessTypes
	 */
	private void initBusinessModule(Module module, List<GgzyBusinessType> businessTypes){
		List<Permission> permissions = module.getPermissions();
		for(GgzyBusinessType businessType : businessTypes){
			if(checkPermission(permissions, businessType))
				continue;
			Permission p = new Permission();
			p.setModule(module);
			p.setName(businessType.getName());
			p.setSn(businessType.getCode().toLowerCase());
			permissionService.saveOrUpdate(p);
		}
		
	}
	private boolean checkPermission(List<Permission> permissions, GgzyBusinessType businessType){
		for(Permission permission : permissions){
			if(permission.getSn().equalsIgnoreCase(businessType.getCode()))
				return true;
		}
		return false;
	}
}
