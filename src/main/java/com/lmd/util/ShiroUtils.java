package com.lmd.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * shiro工具类
 * @author mh_cxp
 *
 */
public class ShiroUtils {
	
	private static Subject getSubject() {
        return SecurityUtils.getSubject();
    }
	
	/**
	 * 判断用户是否有角色权限
	 * @param roleNames
	 * @return
	 */
	public static boolean hasRole(String roleNames){
		Subject subject = getSubject();
		if (subject != null) {
            for (String role : roleNames.split(",")) {
                if (subject.hasRole(role.trim())) {
                    return true;
                }
            }
        }
		return false;
	}
}
