package com.lmd.spring.task;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.lmd.ggzy.domain.GgzyWebNotice;
import com.lmd.ggzy.repository.GgzyWebNoticeRepository;
import com.lmd.util.CollectionUtil;
import com.lmd.util.SpelHelper;
import net.sf.ehcache.concurrent.Sync;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.lmd.ggzy.domain.SyncInfo;
import com.lmd.ggzy.jdbc.template.ReportDao;
import com.lmd.ggzy.repository.SyncInfoRepository;
import com.lmd.ggzy.sync.service.JcmsSyncService;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.common.ExpressionUtils;
import org.springframework.expression.spel.standard.SpelExpression;
import org.springframework.util.ObjectUtils;

/**
 * JCMS同步任务
 * 
 * @author mh_cxp
 * 
 * @param <T>
 *            同步对象的类型
 */
public abstract class JcmsSyncTask<T> implements Task, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1693723296834745905L;

	private static final Logger log = LoggerFactory.getLogger(JcmsSyncTask.class);

    @Autowired
    protected GgzyWebNoticeRepository webNoticeRepository;

	@Autowired
	protected SyncInfoRepository syncInfoService;

	@Autowired
	protected JcmsSyncService jcmsSyncService;
	/**
	 * NamedParameterJdbcDaoSupport子类
	 */
	@Autowired
	protected ReportDao reportDao;

	/**
	 * 公告同步默认栏目
	 */
	protected String defaultClmId;

	/**
	 * 同步栏目配置
	 */
	protected Map<String, String> clms;

	/**
	 * 启用同步的业务类型
	 */
	protected List<String> syncBusinessTypes;

	protected JcmsInfoBuilder<T> builder;

    /**
     * 扩展同一业务类型,需根据专业类型不同或其他条件同步至不通栏目
     * 同步模板配置,如果有多个模板符合条件,讲取第一个,配置时请注意顺序
     */
    protected List<SyncJsmsTempleate> syncJsmsTempleates;

	@Override
	public void execute() {
		log.info("sync info to jcms...");
		List<T> infos = this.queryNotSyncInfo();
		if (infos == null)
			return;
		for (T info : infos) {
			syncInfo(info);
		}
	}

	/**
	 * 查询未同步信息列表
	 * 
	 * @return
	 */
	public abstract List<T> queryNotSyncInfo();

	public abstract void syncInfo(T info);


    /**
     * 同步多信息栏目
     * @param title
     * @param columnId
     * @param content
     * @param syncInfoPk
     * @param syncFlag
     * @return
     */
	public boolean syncToJcms(String title, String columnId, String content, String syncInfoPk, Long syncFlag) {
        boolean result = jcmsSyncService.excuteTBGeneral(title, columnId, content);
        if (result) {
            saveSyncInfo(syncInfoPk, syncFlag);
        }
        return result;
	}

    private void saveSyncInfo(String syncInfoPk, Long syncFlag){
        SyncInfo syncInfo = new SyncInfo();
        syncInfo.setPk(syncInfoPk);
        syncInfo.setSyncSerialVersionUID(syncFlag);
        syncInfoService.save(syncInfo);
    }
    public boolean syncToJcm(String content, String syncInfoPk, Long syncFlag, String clmId){
        boolean result = jcmsSyncService.excuteTBCustom(content, clmId);
        if (result) {
            saveSyncInfo(syncInfoPk, syncFlag);
        }
        return result;
    }

    /**
     * 保存同步信息
     */
    public void saveSyncInfo(String projectCode, String content) {

        GgzyWebNotice webNotice = new GgzyWebNotice();
        webNotice.setCreateDate(new Date());
        webNotice.setHtmlContent(content);
        webNotice.setNoticeType(getSyncType());
        webNotice.setProjectCode(projectCode);


        webNoticeRepository.save(webNotice);

    }

    /**
     * 同步类型
     * @return
     */
    public abstract String getSyncType();

	public String getColumnId(String businessTypeCode) {
		String columnId = clms.get(businessTypeCode);
		if (columnId == null)
			columnId = defaultClmId;
		return columnId;
	}

    public SyncJsmsTempleate getTemplate(Object info){

        if(!CollectionUtil.isEmpty(syncJsmsTempleates)){
            for(SyncJsmsTempleate templeate : syncJsmsTempleates){
                if(ObjectUtils.nullSafeEquals(SpelHelper.parseExpression(templeate.getExpression(), info, String.class),
                        templeate
                        .getExpressionValue()))
                    return templeate;
            }
        }
        return null;
    }

	public String getDefaultClmId() {
		return defaultClmId;
	}

	public void setDefaultClmId(String defaultClmId) {
		this.defaultClmId = defaultClmId;
	}

	public Map<String, String> getClms() {
		return clms;
	}

	public void setClms(Map<String, String> clms) {
		this.clms = clms;
	}

	public void setBuilder(JcmsInfoBuilder<T> builder) {
		this.builder = builder;
	}

	public void setJcmsSyncService(JcmsSyncService jcmsSyncService) {
		this.jcmsSyncService = jcmsSyncService;
	}

	public void setSyncBusinessTypes(List<String> syncBusinessTypes) {
		this.syncBusinessTypes = syncBusinessTypes;
	}

    public List<SyncJsmsTempleate> getSyncJsmsTempleates() {
        return syncJsmsTempleates;
    }

    public void setSyncJsmsTempleates(List<SyncJsmsTempleate> syncJsmsTempleates) {
        this.syncJsmsTempleates = syncJsmsTempleates;
    }
}

