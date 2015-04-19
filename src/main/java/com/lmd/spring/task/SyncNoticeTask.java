package com.lmd.spring.task;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lmd.util.CollectionUtil;
import com.lmd.util.SpelHelper;
import freemarker.template.Template;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.repository.GgzyNoticeRepository;
import com.lmd.spring.converter.ConvertUtil;
/**
 * 同步公告至JCMS
 * 1.查询待同步公告列表,条件审核通过,非邀请招标,未同步
 * 2.根据业务类型获取模板
 * 3.同步jcms(需要栏目ID)
 * 4.同步成功保存同步结果
 */
public class SyncNoticeTask extends JcmsSyncTask<Map<String, Object>> implements Serializable{
	private static final Logger log = LoggerFactory.getLogger(SyncNoticeTask.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = 3078952847644237537L;

	@Autowired
	private GgzyNoticeRepository noticeService;

    @Autowired
    private FormattingConversionServiceFactoryBean conversionService;

	private List<String> majorTypes;

    @Override
	@Transactional
	public void syncInfo(Map<String, Object> info){
        String noticeId = info.get("notice_id").toString();
		GgzyNotice notice = noticeService.findOne(noticeId);

        String businessTypeCode = notice.getBidPro().getBusinessType().getCode();
        SyncJsmsTempleate templeate = getTemplate(notice);
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
		root.put("notice", notice);
		if(notice.getNoticeContent() != null)
			root.put("content", ConvertUtil.convertClob2String(notice.getNoticeContent().getContent()));
		String noticeContent = null;
		try {
			noticeContent = builder.buildInfo(root, templateSuffix);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		if(noticeContent == null) return;

        boolean result = false;
        if(templeate == null || CollectionUtil.isEmpty(templeate.getCustomFields())){//多信息栏目
            result = syncToJcms(notice.getNoticeName(), columnId, noticeContent, noticeId, SyncNoticeTask.serialVersionUID);
        }else{//自定义栏目,需根据自定义字段拼出同步xml
            StringBuffer sb = new StringBuffer("<?xml version='1.0' encoding='UTF-8'?><main><edition>1" +
                    ".0</edition><copyright>大汉网络</copyright><article>");
            StringBuffer fieldSb = new StringBuffer();
            for(Map.Entry<String, String> entry: templeate.getCustomFields().entrySet()){
                sb.append("<" + entry.getKey() +"><![CDATA[");
                if(entry.getKey().indexOf("正文") > -1){
                    sb.append(noticeContent);
                }else
                    sb.append(SpelHelper.parseExpression(entry.getValue(), notice, String.class, conversionService.getObject()));
                sb.append("]]></" + entry.getKey() +">");
                fieldSb.append(entry.getKey() + "|");
            }
            sb.append("<webid>1</webid><colid>"+ columnId
                    +"</colid><messid></messid><status>0</status><identifier></identifier><fields>");
            sb.append(StringUtils.substring(fieldSb.toString(), 0 , fieldSb.toString().lastIndexOf("|")));
            sb.append("</fields></article></main>");
            result = syncToJcm(sb.toString(), noticeId, SyncNoticeTask.serialVersionUID, columnId);
        }

		if(result){
            saveSyncInfo(notice.getBidPro().getProCode(), noticeContent);
        }
	}

    @Override
    public String getSyncType() {
        return "bid_notice";
    }

    @Override
	public List<Map<String, Object>> queryNotSyncInfo(){
		String sql = "select n.notice_id from ggzy_notice n join ggzy_bid_pro bp on n.bid_pro_id=bp.bid_pro_id join ggzy_business_way bw on bp.business_way_id=bw.business_way_id join ggzy_business_type bt on bt.business_type_id=bp.business_type_id where n.audit_status=2 and bw.code<>'Y' and not exists(select 1 from ggzy_sync_info i where i.sync_serial_versionuid=:ssvid and i.pk=n.notice_id) and bt.code in (:codes)";
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ssvid", SyncNoticeTask.serialVersionUID);
		params.put("codes", this.syncBusinessTypes);
		return reportDao.queryForMap(sql, params);
	}
}
