package com.lmd.ggzy.controller;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.ResolvableType;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.lmd.ggzy.domain.BaseDomain;
import com.lmd.ggzy.service.impl.BaseServiceTemplateImpl;
import com.lmd.util.BeanUtil;

public abstract class ControllerTemplate<E extends BaseDomain<K>, K extends Serializable> {

	@Autowired
	protected BaseServiceTemplateImpl<E, K> service;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid E entity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		AjaxObject status = null;
		if (bindingResult.hasErrors()) {
			status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
		} else {
			uiModel.asMap().clear();
			getService().save(entity);
			status = AjaxObject.newOk(ControllerConst.ADD_SUCCESS, true);
		}
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel) {
		populateEditForm(uiModel, (E) BeanUtil.instantiate(ResolvableType.forClass(getClass()).getSuperType().getGeneric(0).resolve()));
		return getViewBasePath() + "/create";
	}

	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") K id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		populateEditForm(uiModel, getService().find(id));
		uiModel.addAttribute("itemId", id);
		return getViewBasePath() + "/show";
	}

	@RequestMapping(produces = "text/html")
	public String list(ServletRequest request, Page page, Model map) {
		this.list_(request, page, map);
		return getViewBasePath() + "/list";
	}

	public void list_(ServletRequest request, Page page, Model map) {
		@SuppressWarnings("unchecked")
		Specification<E> specification = DynamicSpecifications.bySearchFilter(request, BeanUtil.getGenericType(this, 0));
		map.addAttribute("page", page);
		List<E> list = getService().findByExample(specification, page);
		map.addAttribute("list", list);
	}

	@RequestMapping(method = RequestMethod.PUT)
	public String update(@Valid E entity, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		AjaxObject status = null;
		if (bindingResult.hasErrors()) {
			status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
		} else {
			uiModel.asMap().clear();
			getService().update(entity);
			status = AjaxObject.newOk(ControllerConst.UPDATE_SUCCESS, true);
		}
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	public String updateForm(@PathVariable("id") K id, Model uiModel) {
		populateEditForm(uiModel, getService().find(id));
		return getViewBasePath() + "/update";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") K id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		E entity = getService().find(id);
		getService().delete(entity);
		uiModel.asMap().clear();
		uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
		uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
		return "redirect:/" + getViewBasePath();
	}

	void addDateTimeFormatPatterns(Model uiModel) {
		uiModel.addAttribute("entity_verifytime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
	}

	void populateEditForm(Model uiModel, E entity) {
		uiModel.addAttribute("entity", entity);
		addDateTimeFormatPatterns(uiModel);
	}

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
		String enc = httpServletRequest.getCharacterEncoding();
		if (enc == null) {
			enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
		}
		try {
			pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
		} catch (UnsupportedEncodingException uee) {
		}
		return pathSegment;
	}

	@RequestMapping(value = "/delete")
	public String deleteManey(@RequestParam("ids") K[] ids, Model uiModel) {
		for (K id : ids) {
			E entity = getService().find(id);
			getService().delete(entity);
		}
		AjaxObject status = AjaxObject.newOk(ControllerConst.DELETE_SUCCESS, true).setCallbackType("");
		uiModel.addAttribute(ControllerConst.STATUS, status);
		return ControllerConst.JSON_STATUS_VIEW;
	}

	/**
	 * controller视图根路径
	 * 
	 * @return
	 */
	protected abstract String getViewBasePath();

	public BaseServiceTemplateImpl<E, K> getService() {
		return this.service;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody
	String test(String st) {
		System.out.println(this.service.countAll());
		return "ok";
	}

	protected String viewName(String view) {
		return this.getViewBasePath() + "/" + view;
	}
}
