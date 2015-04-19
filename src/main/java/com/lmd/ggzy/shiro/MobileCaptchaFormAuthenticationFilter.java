package com.lmd.ggzy.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.lmd.util.IPUtil;
import org.apache.shiro.authc.AuthenticationToken;

import com.ketayao.ketacustom.shiro.CaptchaFormAuthenticationFilter;
import com.ketayao.ketacustom.shiro.MobileCaptchaUsernamePasswordToken;
import com.lmd.util.HttpRequestDeviceUtils;

public class MobileCaptchaFormAuthenticationFilter extends CaptchaFormAuthenticationFilter {

	protected boolean isMobileLogin(ServletRequest request) {
		return HttpRequestDeviceUtils.isMobileDevice((HttpServletRequest)request);
	}
	
	@Override
	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		// TODO Auto-generated method stub
		String username = getUsername(request);
		String password = getPassword(request);
		String captcha = getCaptcha(request);
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		return new MobileCaptchaUsernamePasswordToken(username, password, rememberMe,
				host, captcha, isMobileLogin(request));
	}

    @Override
    protected String getHost(ServletRequest request) {
        if(request instanceof HttpServletRequest){
            return IPUtil.getIpAddr((HttpServletRequest)request);
        }
        return super.getHost(request);
    }
}
