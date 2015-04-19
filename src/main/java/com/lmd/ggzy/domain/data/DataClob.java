package com.lmd.ggzy.domain.data;
import java.sql.Clob;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Lob;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class DataClob {
	/**
	 * @uml.property  name="content"
	 */
	@Basic(fetch=FetchType.LAZY)
    @Column(name = "CONTENT", columnDefinition="CLOB" )
    @Lob
    private Clob content;

	/**
	 * @return
	 * @uml.property  name="content"
	 */
	public Clob getContent() {
		return content;
	}

	/**
	 * @param content
	 * @uml.property  name="content"
	 */
	public void setContent(Clob content) {
		this.content = content;
	}
}
