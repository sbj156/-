package com.lmd.ggzy.domain;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
/**
 * 唱标方式
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_BID_OPENNING_TYPE")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.BidOpenningType")
public class BidOpenningType {

    /**
	 * 
	 */
	private static final long serialVersionUID = 6916521073624040371L;

	/**
	 * 唱标方式名称
	 */
    private String name;

    /**
	 * 对应的视图名称,视图jsp要放在ggzybidopenings/目录下
	 */
    private String formView;

    /**
	 * 描述
	 */
    private String description;

}
