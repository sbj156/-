package com.lmd.ggzy.servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.config.Configuration;
import net.sf.ehcache.config.ConfigurationFactory;

import org.apache.commons.lang3.math.NumberUtils;
import org.patchca.service.Captcha;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.utils.encoder.EncoderHelper;
import org.patchca.word.RandomWordFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import com.ketayao.ketacustom.entity.main.User;
import com.ketayao.ketacustom.service.UserService;
import com.ketayao.ketacustom.shiro.PatchcaServlet;
import com.ketayao.utils.Exceptions;
import com.lmd.ggzy.sms.SmsService;

/**
 * 发生手机验证码Servlet
 * 
 * @author mh_cxp
 * 
 */
public class MobileCaptchaServlet extends PatchcaServlet {

	private static final long serialVersionUID = -656795564528376490L;

	private static final Logger LOGGER = LoggerFactory.getLogger(PatchcaServlet.class);

	private static int WIDTH = 110;
	private static int HEIGHT = 50;
	private static int MAX_LENGTH = 4;
	private static int MIN_LENGTH = 4;

	private static String CACHE_NAME = "_pcatcha_";
	private static String CACHE_FILE = "ehcache/ehcache-pcaptcha.xml";

	private static Cache cache;
	private static ConfigurableCaptchaService cs;

	@Autowired
	private UserService userService;

	@Autowired
	private SmsService smsService;

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		String CACHE_FILE = config.getInitParameter("cache_file");
		if (CACHE_FILE == null || CACHE_FILE.trim().length() == 0) {
			CACHE_FILE = MobileCaptchaServlet.CACHE_FILE;
		}
		cs = new ConfigurableCaptchaService();

		int width = NumberUtils.toInt(this.getInitParameter("width"), WIDTH);
		int height = NumberUtils.toInt(this.getInitParameter("height"), HEIGHT);
		cs.setWidth(width);
		cs.setHeight(height);

		int maxLength = NumberUtils.toInt(this.getInitParameter("maxLength"), MAX_LENGTH);
		int minLength = NumberUtils.toInt(this.getInitParameter("minLength"), MIN_LENGTH);
		RandomWordFactory wf = new RandomWordFactory();
		wf.setMaxLength(maxLength);
		wf.setMinLength(minLength);

		cs.setWordFactory(wf);

		ResourcePatternResolver rpr = new PathMatchingResourcePatternResolver();
		Resource resource = rpr.getResource("classpath:" + CACHE_FILE);

		try {
			CacheManager cacheManager = CacheManager.create(resource.getInputStream());

			cache = cacheManager.getCache(CACHE_NAME);
			if (cache == null) {
				Configuration configuration = ConfigurationFactory.parseConfiguration(resource.getInputStream());

				cache = new Cache(configuration.getCacheConfigurations().get(CACHE_NAME));
				if (cache == null) {
					cache = cacheManager.getCache(Cache.DEFAULT_CACHE_NAME);
				} else {
					cacheManager.addCache(cache);
				}
			}
		} catch (CacheException e) {
			LOGGER.error("创建缓存[" + CACHE_NAME + "]出错，请检查配置参数:" + Exceptions.getStackTraceAsString(e));
		} catch (IOException e) {
			LOGGER.error("缓存配置文件[" + CACHE_FILE + "]读取出错:" + Exceptions.getStackTraceAsString(e));
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest
	 * , javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 清除缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0L);
		String username = request.getParameter("username");
		User u = userService.getByUsername(username);
		Captcha captcha = cs.getCaptcha();
		String patchca = captcha.getChallenge();
		if (!smsService.sendCaptcha(u.getPhone(), patchca)) {
			throw new RuntimeException("短信服务异常");
		}

		// 显示类型
		response.setContentType("image/png");

		OutputStream os = response.getOutputStream();
		EncoderHelper.getChallangeAndWriteImage(cs, "png", os);
		ImageIO.write(captcha.getImage(), "png", os);
		System.out.println(patchca);
		// 放入缓存
		Element element = new Element(request.getSession().getId(), patchca);
		cache.put(element);

		os.flush();
		os.close();
	}
}
