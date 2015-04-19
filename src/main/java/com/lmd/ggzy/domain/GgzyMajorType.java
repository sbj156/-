package com.lmd.ggzy.domain;
import java.io.Serializable;

import javax.persistence.Column;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(versionField = "", table = "GGZY_MAJOR_TYPE")
@RooDbManaged(automaticallyDelete = true)
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyMajorType")
public class GgzyMajorType  {
	 
    /**
	 * 
	 */
	private static final long serialVersionUID = -6894586253617865419L;

	/**类型名称
	 * @uml.property  name="name"
	 */
	@Column(name = "NAME", length = 20)
    private String name;
    
    /**
	 * @uml.property  name="code"
	 */
    @Column(name = "CODE", length = 2)
    private String code;
    
    /**
	 * @return
	 * @uml.property  name="name"
	 */
    public String getName() {
        return name;
    }
    
    /**
	 * @param name
	 * @uml.property  name="name"
	 */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
	 * @return
	 * @uml.property  name="code"
	 */
    public String getCode() {
        return code;
    }
    
    /**
	 * @param code
	 * @uml.property  name="code"
	 */
    public void setCode(String code) {
        this.code = code;
    }
    
    public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
    
}
