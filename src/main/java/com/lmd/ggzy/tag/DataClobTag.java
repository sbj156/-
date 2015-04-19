package com.lmd.ggzy.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.lmd.ggzy.domain.data.DataClob;
import com.lmd.spring.converter.Clob2StringConverter;

public class DataClobTag extends SimpleTagSupport {
	Clob2StringConverter clob2StringConverter = new Clob2StringConverter();

	private DataClob dataClob;

	private String name;

	private Integer cols;

	private Integer rows;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCols() {
		return cols;
	}

	public void setCols(int cols) {
		this.cols = cols;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public DataClob getDataClob() {
		return dataClob;
	}

	public void setDataClob(DataClob dataClob) {
		this.dataClob = dataClob;
	}

	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub

		String html = "<input type='hidden' name='%s.id' value='%s'/><textarea class='editor' name='%s.content' rows='%s' cols='%s'>%s</textarea>";
		html = String.format(html, name, dataClob == null ? "" : dataClob.getId(), name, rows == null ? 12 : rows, cols == null ? 90 : cols, dataClob == null ? "" : clob2StringConverter.convert(dataClob.getContent()));
		getJspContext().getOut().write(html);
		super.doTag();
	}

}
