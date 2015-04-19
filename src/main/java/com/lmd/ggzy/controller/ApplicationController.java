package com.lmd.ggzy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lmd.spring.task.SyncNoticeTask;
import com.lmd.spring.task.TaskChain;

@Controller
@RequestMapping("/app/")
public class ApplicationController {

	/**
	 * 获取系统时间
	 * @return
	 */
	@RequestMapping("/sysdate")
	public @ResponseBody String systemDate(@RequestParam(required=false, defaultValue="yyyy-MM-dd HH:mm:ss") String fmt){
		//方便测试,当前时间+30天作为当前时间
		return new SimpleDateFormat(fmt).format(DateUtils.addDays(new Date(), 30));
	}
	
	@Autowired
	private TaskChain taskChain;
	
//	@Autowired
//	private SyncNoticeTask noticeTask;
	@RequestMapping("/test")
	public @ResponseBody String test(){
		
		taskChain.execute();
		return "ok";
	}
}
