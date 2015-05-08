package com.lmd.ggzy.shiro;

import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.subject.WebSubject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.com.jit.assp.dsign.DSign;

import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.shiro.IncorrectCaptchaException;
import com.ketayao.ketacustom.shiro.MobileCaptchaUsernamePasswordToken;
import com.ketayao.ketacustom.shiro.PatchcaServlet;
import com.ketayao.ketacustom.shiro.ShiroDbRealm;
import com.ketayao.ketacustom.shiro.ShiroUser;
import com.ketayao.utils.Encodes;
import com.lmd.util.HttpRequestDeviceUtils;
import com.lmd.util.IPUtil;

public class GgzyShiroDbRealm extends ShiroDbRealm {

	private static final String CA_PASSWORD = "111111";

    private static final String CA_NAME_KEY_NAME = "caName";
	/**
	 * 外网(包括手机)可以登陆用户角色
	 */
	private Set<String> webRoles;
	
	
	

	/**
	 * 认证回调函数, 登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		if (useCaptcha) {
			MobileCaptchaUsernamePasswordToken token = (MobileCaptchaUsernamePasswordToken) authcToken;
			if (token.isMobileLogin()) {
				String parm = token.getCaptcha();

				if (!PatchcaServlet.validate(SecurityUtils.getSubject().getSession().getId().toString(), parm.toLowerCase())) {// 忽略大小写。
					throw new IncorrectCaptchaException("验证码错误！");
				}
			}
		}
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String caName = request.getParameter(CA_NAME_KEY_NAME);

		
		if(StringUtils.isNotBlank(caName)){
			token.setUsername(caName);
			String signnedData = request.getParameter("SignnedData");
			//
			if(StringUtils.isBlank(signnedData) || new DSign().verifyAttachedSign(signnedData.getBytes()) < 0){
				throw new OtherAutnenticationException("证书信息不正确");
			}
		}
		User user = userService.getByUsername(token.getUsername());
		
		
		if (user != null) {
			if (user.getStatus().equals(User.STATUS_DISABLED)) {
				throw new DisabledAccountException();
			}
			ShiroUser shiroUser = new ShiroUser(user.getId(), user.getUsername());
            shiroUser.setUser(user);
			byte[] salt = Encodes.decodeHex(user.getSalt());
			if(StringUtils.isNotBlank(caName)){
				
				HashPassword hashPassword = ShiroDbRealm.encryptPassword(CA_PASSWORD);
				token.setPassword(CA_PASSWORD.toCharArray());
				return new SimpleAuthenticationInfo(shiroUser, hashPassword.password, ByteSource.Util.bytes(Encodes.decodeHex(hashPassword.salt)), getName());
			}
			
			// 这里可以缓存认证
			return new SimpleAuthenticationInfo(shiroUser, user.getPassword(), ByteSource.Util.bytes(salt), getName());
		} else {
			return null;
		}

	}

	@Override
	protected void assertCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) throws AuthenticationException {
		// TODO Auto-generated method stub
		super.assertCredentialsMatch(token, info);
		checkWWWLogin(token, info);
	}

	private void checkWWWLogin(AuthenticationToken token, AuthenticationInfo info) {
		HttpServletRequest request = (HttpServletRequest)(((WebSubject) SecurityUtils.getSubject()).getServletRequest
                ());
        /**
         * 如果是外网
         */
        if (IPUtil.isDomainReuest(request)) {
			if (!hasWebRole(token, info))
				throw new WebRoleAuthenticationException("用户不存在");
            /**
             * 如果是电脑端
             */
            /*if(!hasRole(info.getPrincipals(), "管理员") && StringUtils.isBlank(request.getParameter
                    (CA_NAME_KEY_NAME)) &&
                    !HttpRequestDeviceUtils
                    .isMobileDevice
                    ((HttpServletRequest) request))
                throw new OtherAutnenticationException("请使用CA证书登录");*/
		}
	}

	/**
	 * 如果是外网登陆,判断用户是否拥有允许外网登陆的角色
	 */
	private boolean hasWebRole(AuthenticationToken token, AuthenticationInfo info) {
		if (webRoles != null)
			for (String role : webRoles) {
				if (hasRole(info.getPrincipals(), role))
					return true;
			}
		return false;
	}

	public Set<String> getWebRoles() {
		return webRoles;
	}

	public void setWebRoles(Set<String> webRoles) {
		this.webRoles = webRoles;
	}

	
}
