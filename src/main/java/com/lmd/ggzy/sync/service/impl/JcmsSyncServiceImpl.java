package com.lmd.ggzy.sync.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Date;

import com.lmd.ggzy.sync.service.JcmsSyncService;
public class JcmsSyncServiceImpl implements JcmsSyncService {


    /**
     * 多信息同步url
     */
	private String generalUrl;

    /**
     * 自定义信息同步url
     */
    private String customUrl;

	public boolean excuteTB(String xml, String strHttpUrl) {


		String strReturn = "";
		try {
			// 组织接口的URL
			// 一般在URL 后面加个id参数，其值需不同(可取一个随机值)，主要用于并发
			// 建立一个URL 实例
			java.net.URL url = new java.net.URL(strHttpUrl);
			// 获取一个HttpURLConnection 链接对象
			java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url
					.openConnection();
			// 用post 方式传递数据
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			java.io.OutputStream out = conn.getOutputStream();
			// 写内容到接口文件，此处自定义信息编码为GBK，多信息可以是GBK 或UTF-8
			// 只需要和访问url 后面的编码一致
			out.write(xml.getBytes("GBK"));
			out.flush();
			out.close();
			java.io.InputStream ins2 = conn.getInputStream();
			strReturn = convertStreamToString(ins2);
			ins2.close();
		} catch (Exception e) {
			System.out.println("接收的URL" + strHttpUrl + "不正确, 发送失败!");
			e.printStackTrace();
		}
		if (strReturn.indexOf("ok") >= 0)
			return true;
		return false;
	}
	/**
	 * 把流InputStream 内的内容转换为String
	 * 
	 * @param ins
	 * @return String
	 */
	protected String convertStreamToString(InputStream ins) {
		String strRet = "";
		try {
			StringBuffer sbuf = new StringBuffer();
			InputStreamReader reader = new InputStreamReader(ins, "UTF-8");
			Reader buf = new BufferedReader(reader);
			int ch;
			while ((ch = buf.read()) > -1) {
				sbuf.append((char) ch);
			}
			buf.close();
			strRet = sbuf.toString();
			sbuf.delete(0, sbuf.length());
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return strRet;
	}
	public String getGeneralUrl() {
		return generalUrl;
	}
	public void setGeneralUrl(String generalUrl) {
		this.generalUrl = generalUrl;
	}

    public String getCustomUrl() {
        return customUrl;
    }

    public void setCustomUrl(String customUrl) {
        this.customUrl = customUrl;
    }

    @Override
    public boolean excuteTBGeneral(String title, String columnId, String text) {
        String strContent = "<?xml version='1.0' encoding='UTF-8'?>" + "<main>"
                + "<edition>1.0</edition>" + "<copyright>大汉网络</copyright>"
                + "<article>" + "<title>"
                + title
                + "</title>"
                + "<caption></caption>"
                + "<leadtitle></leadtitle>"
                + "<linktitle></linktitle>"
                + "<author>信息员</author>"
                + "<source></source>"
                + "<keyword></keyword>"
                + "<brief></brief>"
                + "<describe></describe>"
                + "<datetime>"
                + com.lmd.util.DateUtils.getDate(new Date(), "yyyy-MM-dd HH:mm:ss")
                + "</datetime>"
                + "<text><![CDATA["
                + text
                + "]]></text>"
                + "<webgroupid>1</webgroupid>"
                + "<webgroup>济南公共资源交易网</webgroup>"
                + "<webid>1</webid>"
                + "<columnid>"
                + columnId
                + "</columnid>"
                + "<type></type><url></url>"
                + "<infoimage><name></name><data></data></infoimage>"
                + "<infoattach><name></name><data></data></infoattach>"
                + "<objects><object><type></type>"
                + "<name></name><data></data></object></objects></article></main>";
        return this.excuteTB(strContent, generalUrl);
    }

    @Override
    public boolean excuteTBCustom(String text, String clmId) {
        return this.excuteTB(text, customUrl + "&colid=" + clmId);
    }
}
