package com.lmd.ggzy.controller;

import com.ketayao.ketacustom.entity.main.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ketayao.ketacustom.service.UserService;

@Controller
public class UserPhoneController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/userp")
	@ResponseBody
	public String getUserPhone(@RequestParam String username){
        User user = userService.getByUsername(username);
        if(user == null){
            throw new RuntimeException("用户不存在，或未绑定手机号码");
        }
		String phone = user.getPhone();
		return phone.substring(0,3) + "*****" + phone.substring(8);
	}
}
