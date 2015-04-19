/**   
* @Title: ExcelUtil.java 
* @Package: com.lmd.util 
* @Description: TODO (用一句描述类的左右)
* @author: Wang Yanming   
* @date: 2014年6月30日 下午4:13:47 
* @version: V1.0   
*/
package com.lmd.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.excelutils.ExcelException;
import net.sf.excelutils.ExcelUtils;

import com.lmd.ggzy.domain.GgzyBusinessType;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.time.DateFormatUtils;

public class ExcelUtil {
	
	private GgzyBusinessType businessType;
	public void setBusinessType(GgzyBusinessType businessType){
		this.businessType = businessType;
	}
	/**
	 * 导出excel
	 * @param response
	 * @param template(excel表格的模板路径)
	 * @param data(保存excel表格所有数据的map)
	 * @param fileName(保存文件时的文件名)
	 * @throws ExcelException
	 * @throws IOException
	 */
	public void exportExcel(HttpServletResponse response, String template,
			Map<String, Object> data, String fileName) throws ExcelException,
			IOException {
		// response.setHeader("Content-disposition",
		// "attachment; filename="+new
		// String(fileName.getBytes("ISO-8859-1"),"utf-8")+".xls");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ java.net.URLEncoder.encode(fileName, "UTF-8") + ".xls");
		response.setContentType("application/*");
		if (null != data) {
			Iterator<String> it = data.keySet().iterator();
			while (it.hasNext()) {
				String key = it.next();
				ExcelUtils.addValue(key, data.get(key));
			}
		}
		InputStream input = this.businessType!=null?
				Thread.currentThread().getContextClassLoader().
				getResourceAsStream("excelModel/"+this.businessType.getCode().toLowerCase()+"/" + template):
					null;
		if(null == input){
			input = Thread.currentThread().getContextClassLoader().
					getResourceAsStream("excelModel/"+ template);
		}
        ExcelUtils.addService("dateUtil", new DateUtil_());


		ExcelUtils.export(input,
				ExcelUtils.getContext(), response.getOutputStream());
		input.close();
		response.getOutputStream().close();
	}
}

class DateUtil_{
    public String format(Date date, String formatStr){
        return DateFormatUtils.format(date, formatStr);
    }
    public String format(Calendar date, String formatStr){
        return DateFormatUtils.format(date, formatStr);
    }
}