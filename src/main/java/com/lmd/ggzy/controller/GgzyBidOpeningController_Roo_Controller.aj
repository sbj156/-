// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.excelutils.ExcelException;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.lmd.ggzy.domain.GgzyApplyTender;
import com.lmd.ggzy.domain.GgzyBidOpening;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.GgzyTenders;
import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;
import com.lmd.ggzy.service.BidOpenningTypeService;
import com.lmd.ggzy.service.GgzyBidOpeningService;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyNoticeTendersService;
import com.lmd.ggzy.service.GgzyTendersService;
import com.lmd.util.ExcelUtil;

privileged aspect GgzyBidOpeningController_Roo_Controller {
    private static final String GgzyBidOpeningController.OPEN_SUCCESS= "open_success"; 
    @Autowired
    GgzyBidOpeningService GgzyBidOpeningController.ggzyBidOpeningService;
    
    @Autowired
    GgzyTendersService GgzyBidOpeningController.ggzyTendersService;
    
    @Autowired
    BidOpenningTypeService GgzyBidOpeningController.openningTypeService;
    
    @Autowired
    GgzyNoticeTendersService GgzyBidOpeningController.noticeTendersService;
    
    @Autowired
    GgzyBusinessTypeService GgzyBidOpeningController.businessTypeService;
    
    @Autowired
    ConversionService GgzyBidOpeningController.conversionService;
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GgzyBidOpeningController.create(@Valid GgzyBidOpening ggzyBidOpening, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	AjaxObject status = null;
        if (bindingResult.hasErrors()) {
        	status = AjaxObject.newError(bindingResult.getFieldError().getDefaultMessage());
        }else{
        	uiModel.asMap().clear();
        	ggzyBidOpeningService.saveGgzyBidOpening(ggzyBidOpening);
	        status = AjaxObject.newOk(OPEN_SUCCESS, true);
        }
        uiModel.addAttribute(ControllerConst.STATUS, status);
        return ControllerConst.JSON_STATUS_VIEW;
    }
    
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GgzyBidOpeningController.createForm(Model uiModel, @RequestParam("tendersId") String tendersId) {
    	GgzyNoticeTenders noticeTenders = noticeTendersService.findGgzyNoticeTenders(conversionService.convert(tendersId, GgzyNoticeTendersPk.class));
    	List openningTypes = new ArrayList();
    	for(GgzyBusinessTypeOpenningType type : noticeTenders.getNotice().getBidPro().getBusinessType().getOpenningTypes()){
    		openningTypes.add(type.getOpenningType());
    	}
    	uiModel.addAttribute("noticeTenders", noticeTenders);
    	uiModel.addAttribute("openningTypes", openningTypes);
        populateEditForm(uiModel, new GgzyBidOpening());
        return "ggzybidopenings/create";
    }
    
    @RequestMapping(value = "/{bidOpeningId}", produces = "text/html")
    public String GgzyBidOpeningController.show(@PathVariable("bidOpeningId") String bidOpeningId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ggzybidopening", ggzyBidOpeningService.findGgzyBidOpening(bidOpeningId));
        uiModel.addAttribute("itemId", bidOpeningId);
        return "ggzybidopenings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GgzyBidOpeningController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ggzybidopenings", ggzyBidOpeningService.findGgzyBidOpeningEntries(firstResult, sizeNo));
            float nrOfPages = (float) ggzyBidOpeningService.countAllGgzyBidOpenings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ggzybidopenings", ggzyBidOpeningService.findAllGgzyBidOpenings());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ggzybidopenings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GgzyBidOpeningController.update(@Valid GgzyBidOpening ggzyBidOpening, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, ggzyBidOpening);
            return "ggzybidopenings/update";
        }
        uiModel.asMap().clear();
        ggzyBidOpeningService.updateGgzyBidOpening(ggzyBidOpening);
        return "redirect:/ggzybidopenings/" + encodeUrlPathSegment(ggzyBidOpening.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{bidOpeningId}", params = "form", produces = "text/html")
    public String GgzyBidOpeningController.updateForm(@PathVariable("bidOpeningId") String bidOpeningId, Model uiModel) {
        populateEditForm(uiModel, ggzyBidOpeningService.findGgzyBidOpening(bidOpeningId));
        return "ggzybidopenings/update";
    }
    
    @RequestMapping(value = "/{bidOpeningId}", method = RequestMethod.DELETE, produces = "text/html")
    public String GgzyBidOpeningController.delete(@PathVariable("bidOpeningId") String bidOpeningId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        GgzyBidOpening ggzyBidOpening = ggzyBidOpeningService.findGgzyBidOpening(bidOpeningId);
        ggzyBidOpeningService.deleteGgzyBidOpening(ggzyBidOpening);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ggzybidopenings";
    }
    
    void GgzyBidOpeningController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("ggzyBidOpening_bidtime_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void GgzyBidOpeningController.populateEditForm(Model uiModel, GgzyBidOpening ggzyBidOpening) {
        uiModel.addAttribute("ggzyBidOpening", ggzyBidOpening);
        addDateTimeFormatPatterns(uiModel);
//        uiModel.addAttribute("ggzytenderses", ggzyTendersService.findAllGgzyTenderses());
    }
    
    String GgzyBidOpeningController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }

    /**
     * 
    * @Title: GgzyBidOpeningController.exportExcel 方法名
    * @Description: TODO(唱标记录导出到excel表格) 
    * @param: @param request
    * @param: @param response
    * @param: @param tendersId 
     * @throws ServletRequestBindingException 
    * @return：void   
    * @date: 2014年7月2日 下午4:34:16 
    * @throws：
     */
	@RequestMapping(value = "/exportExcel/{tendersId}")
	public void GgzyBidOpeningController.exportExcel(
			HttpServletRequest request, HttpServletResponse response,
			@PathVariable("tendersId") GgzyNoticeTendersPk tendersId) throws ServletRequestBindingException {
		ExcelUtil excelUtil = new ExcelUtil();
		GgzyNoticeTenders ggzyTender = noticeTendersService.findGgzyNoticeTenders(tendersId);
		SimpleDateFormat dateTimeformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 包含ggzyTender的map
		Map<String, Object> ggzyTenderMap = new HashMap<String, Object>();
		// 项目编号p
		String bidTimeStr = dateTimeformat.format(ggzyTender.getNotice().getBidDocSubEndtime().getTime());
		Map<String, Object> map = new HashMap<String, Object>();

		
		map.put("noticeTenders", ggzyTender);
		map.put("bidTIme", bidTimeStr);
		// map.put("ggzyTenderMap",ggzyTenderMap);
		try {
			String businessTypeId = ServletRequestUtils.getStringParameter(request, "businessTypeId");
			if(null != businessTypeId){
				GgzyBusinessType businessType = businessTypeService.findGgzyBusinessType(businessTypeId);
				excelUtil.setBusinessType(businessType);
			}
			excelUtil.exportExcel(response,"bidOpening.xls", map,
					ggzyTender.getNotice().getBidPro().getProCode() + "唱标记录表");
		} catch (ExcelException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
    
}