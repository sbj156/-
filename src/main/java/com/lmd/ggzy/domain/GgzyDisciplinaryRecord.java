package com.lmd.ggzy.domain;


import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_DISCIPLINARY_RECORD")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
public class GgzyDisciplinaryRecord {
	
	 
    @Column(name = "DISCIPLINARY_OBJECT_CODE", length = 18)
    private Character disciplinaryObjectCode;
    
    @Column(name = "DISCIPLINARY_OBJECT_TYPE")
    private Character disciplinaryObjectType;
    
    @Column(name = "DISCIPLINARY_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar disciplinaryTime;
    
    @Column(name = "DISCIPLINARY_CONENT")
    private String disciplinaryConent;
    
    @Column(name = "DISCIPLINARY_TYPE")
    private String disciplinaryType;

	public Character getDisciplinaryObjectCode() {
		return disciplinaryObjectCode;
	}

	public void setDisciplinaryObjectCode(Character disciplinaryObjectCode) {
		this.disciplinaryObjectCode = disciplinaryObjectCode;
	}

	public Character getDisciplinaryObjectType() {
		return disciplinaryObjectType;
	}

	public void setDisciplinaryObjectType(Character disciplinaryObjectType) {
		this.disciplinaryObjectType = disciplinaryObjectType;
	}

	public Calendar getDisciplinaryTime() {
		return disciplinaryTime;
	}

	public void setDisciplinaryTime(Calendar disciplinaryTime) {
		this.disciplinaryTime = disciplinaryTime;
	}

	public String getDisciplinaryConent() {
		return disciplinaryConent;
	}

	public void setDisciplinaryConent(String disciplinaryConent) {
		this.disciplinaryConent = disciplinaryConent;
	}

	public String getDisciplinaryType() {
		return disciplinaryType;
	}

	public void setDisciplinaryType(String disciplinaryType) {
		this.disciplinaryType = disciplinaryType;
	}
	
	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"tendersId").toString();
	}
}
