package com.lmd.spring.task;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import com.lmd.ggzy.domain.GgzyBidPublicity;
import com.lmd.ggzy.service.GgzyBidPublicityService;
import com.lmd.spring.converter.ConvertUtil;

public class SyncBidPublicityTask extends JcmsSyncTask<Map<String, Object>> implements Task, Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4804883959691869664L;

	private static final Logger log = LoggerFactory.getLogger(SyncBidPublicityTask.class);

	@Autowired
	private GgzyBidPublicityService publicityService;
	
	@Transactional
	public void syncInfo(Map<String, Object> info){
		String publicityId = info.get("bid_publicity_id").toString();
		GgzyBidPublicity publicity = publicityService.findGgzyBidPublicity(publicityId);
        String businessTypeCode = publicity.getNoticeTenders().getTenders().getBidPro().getBusinessType().getCode();
        SyncJsmsTempleate templeate = getTemplate(publicity);
        String templateSuffix;
        String columnId;
        /**
         * 如果存在模板配置
         */
        if(templeate != null){
            columnId = templeate.getClmId();
            templateSuffix = templeate.getTemplateSuffix();
        }else{
            columnId = getColumnId(businessTypeCode);
            templateSuffix = businessTypeCode;
        }

		Map<String, Object> root = new HashMap<String, Object>();
		root.put("publicity", publicity);
		if(publicity.getPublicityContent() != null)
			root.put("content", ConvertUtil.convertClob2String(publicity.getPublicityContent().getContent()));

		String noticeContent = null;
		try {
			noticeContent = builder.buildInfo(root, templateSuffix.toLowerCase());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
			return;
		}

		;

        if(syncToJcms(publicity.getNoticeTenders().getTenders().getBidPro().getBasePro().getProName() + "中标公示", columnId, noticeContent, publicityId, SyncBidPublicityTask.serialVersionUID)) {
            saveSyncInfo(publicity.getNoticeTenders().getTenders().getBidPro().getProCode(), noticeContent);
        }
	}

    @Override
    public String getSyncType() {
        return "res_notice";
    }

    public List<Map<String, Object>> queryNotSyncInfo(){
		if(this.syncBusinessTypes == null)
			return null;
		
		String sql = "select bid_publicity_id from ggzy_bid_publicity bp join ggzy_notice n on n.notice_id=bp.notice_id join ggzy_bid_pro bidp on bidp.bid_pro_id=n.bid_pro_id join ggzy_business_type bt on bt.business_type_id=bidp.business_type_id where bp.audit_status=2 and not exists(select 1 from ggzy_sync_info i where i.pk=bp.bid_publicity_id) and bt.code in (:codes)";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ssvid", SyncBidPublicityTask.serialVersionUID);
		params.put("codes", this.syncBusinessTypes);
		return reportDao.queryForMap(sql, params);
	}
}
