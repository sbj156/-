package com.lmd.ggzy.domain;
import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 保证金交纳记录
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BOND_RECORD")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "applyTenderId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBondRecord")
public class GgzyBondRecord  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6015079415335713135L;

	/**
	 * @uml.property  name="applyTender"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "APPLY_TENDER_ID", referencedColumnName = "APPLY_TENDER_ID")
    private GgzyApplyTender applyTender;
    
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_ID")
	private GgzyApply apply;
    /**
	 * 交纳方式
	 */
    @Column(name = "BID_BOND_WAY", length = 100)
    private String bidBondWay;
    
    /**
	 * 保证金金额
	 */
    @Column(name = "BID_BOND", precision = 10, scale = 2)
    private BigDecimal bidBond;
    
    /**
	 * 保证金币种
	 */
    @Column(name = "BID_BOND_CURRENCY", length = 3)
    private String bidBondCurrency;
    
    /**
	 * 保证金单位
	 */
    @Column(name = "BID_BOND_UNIT")
    private Character bidBondUnit;
    
    /**
	 * 保证金凭证接收时间
	 */
    @Column(name = "CERTIFICATE_RECEIVER_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
    private Calendar certificateReceiverTime;
    
    /**
	 * 保证金到账时间
	 */
    @Column(name = "BOND_RECEIVER_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
    private Calendar bondReceiverTime;
    
    /**
	 * 保证金退还时间
	 */
    @Column(name = "BOND_RETURN_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
    private Calendar bondReturnTime;
    
    
    public GgzyApply getApply() {
		return apply;
	}

	public void setApply(GgzyApply apply) {
		this.apply = apply;
	}

	/**
	 * @return
	 * @uml.property  name="applyTender"
	 */
    public GgzyApplyTender getApplyTender() {
		return applyTender;
	}

	/**
	 * @param applyTender
	 * @uml.property  name="applyTender"
	 */
	public void setApplyTender(GgzyApplyTender applyTender) {
		this.applyTender = applyTender;
	}

	/**
	 * @return
	 * @uml.property  name="bidBondWay"
	 */
	public String getBidBondWay() {
        return bidBondWay;
    }
    
    /**
	 * @param bidBondWay
	 * @uml.property  name="bidBondWay"
	 */
    public void setBidBondWay(String bidBondWay) {
        this.bidBondWay = bidBondWay;
    }
    
    /**
	 * @return
	 * @uml.property  name="bidBond"
	 */
    public BigDecimal getBidBond() {
        return bidBond;
    }
    
    /**
	 * @param bidBond
	 * @uml.property  name="bidBond"
	 */
    public void setBidBond(BigDecimal bidBond) {
        this.bidBond = bidBond;
    }
    
    /**
	 * @return
	 * @uml.property  name="bidBondCurrency"
	 */
    public String getBidBondCurrency() {
        return bidBondCurrency;
    }
    
    /**
	 * @param bidBondCurrency
	 * @uml.property  name="bidBondCurrency"
	 */
    public void setBidBondCurrency(String bidBondCurrency) {
        this.bidBondCurrency = bidBondCurrency;
    }
    
    /**
	 * @return
	 * @uml.property  name="bidBondUnit"
	 */
    public Character getBidBondUnit() {
        return bidBondUnit;
    }
    
    /**
	 * @param bidBondUnit
	 * @uml.property  name="bidBondUnit"
	 */
    public void setBidBondUnit(Character bidBondUnit) {
        this.bidBondUnit = bidBondUnit;
    }
    
    /**
	 * @return
	 * @uml.property  name="certificateReceiverTime"
	 */
    public Calendar getCertificateReceiverTime() {
        return certificateReceiverTime;
    }
    
    /**
	 * @param certificateReceiverTime
	 * @uml.property  name="certificateReceiverTime"
	 */
    public void setCertificateReceiverTime(Calendar certificateReceiverTime) {
        this.certificateReceiverTime = certificateReceiverTime;
    }
    
    /**
	 * @return
	 * @uml.property  name="bondReceiverTime"
	 */
    public Calendar getBondReceiverTime() {
        return bondReceiverTime;
    }
    
    /**
	 * @param bondReceiverTime
	 * @uml.property  name="bondReceiverTime"
	 */
    public void setBondReceiverTime(Calendar bondReceiverTime) {
        this.bondReceiverTime = bondReceiverTime;
    }
    
    /**
	 * @return
	 * @uml.property  name="bondReturnTime"
	 */
    public Calendar getBondReturnTime() {
        return bondReturnTime;
    }
    
    /**
	 * @param bondReturnTime
	 * @uml.property  name="bondReturnTime"
	 */
    public void setBondReturnTime(Calendar bondReturnTime) {
        this.bondReturnTime = bondReturnTime;
    }
    
    
    public String toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("applyTenderId").toString();
    }
    
    
}
