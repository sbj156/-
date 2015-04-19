package com.lmd.ggzy.domain;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;

@RooJavaBean
@RooToString
@RooJpaEntity
@Table(name = "GGZY_OTHER_PROJECT_RESULT")
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.OtherProjectResult")
public class OtherProjectResult {

    /**
     * 项目名称
     */
	@Column
    private String projectName;

    /**
     * 招标人
     */
	@Column
    private String tendereeName;

    /**
     * 项目编号
     */
	@Column
    private String projectCode;

    /**
     * 原交易方式
     */
	@Column
    private String oldBusinessWay;

    /**
     * 交易时间
     */
	@Column
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date bidTime;

    /**
     * 交易方式
     */
	@Column
    private String businessWay;

    /**
     * 原交易时间
     */
	@Column
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date oldBidTime;

    /**
     * 标段名称
     */
	@Column
    private String tenderName;

    /**
     * 中标人
     */
	@Column
    private String bidder;

    /**
     * 中标价
     */
	@Column
    private BigDecimal bidPrice;
}
