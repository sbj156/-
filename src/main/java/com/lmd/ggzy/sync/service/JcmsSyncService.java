package com.lmd.ggzy.sync.service;
/**
 * 同步大汉JCMS
 * @author mh_cxp
 *
 */
public interface JcmsSyncService {

	/**
	 * 同步多信息栏目
	 * @param title 信息标题
	 * @param columnId 栏目Id
	 * @param text 信息内容
	 * @return
	 */
	public boolean excuteTBGeneral(String title, String columnId, String text);

    /**
     * 同步自定义栏目
     * @param text
     * @return
     */
    public boolean excuteTBCustom(String text, String clmId);
}
