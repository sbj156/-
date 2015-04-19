package com.lmd.ggzy.controller;

import org.springframework.ui.Model;

public class ControllerConst {
	public static final String ADD_SUCCESS = "add_success";
	public static final String ADD_FAIL = "add_fail";
	public static final String UPDATE_SUCCESS = "update_success";
	public static final String UPDATE_FAIL = "update_fail";
	public static final String DELETE_SUCCESS = "delete_success";
	public static final String DELETE_FAIL = "delete_fail";
	public static final String AUDIT_SUCCESS = "audit_success";
	public static final String AUDIT_FAIL = "audit_fail";
	
	public static final String SAVE_SUCCESS = "save_success";
	public static final String SAVE_FAIL = "save_fial";
	public static final String STATUS = "status";
	
	
	public static final String JSON_STATUS_VIEW = "jsonstatus";
	
	public static Model addAttribute(Model uiModel, String attrName, Object value){
		return uiModel.addAttribute(attrName, value);
	}
}
