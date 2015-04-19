package com.lmd.ggzy.domain;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
/**
 * 投标文件,企业每投一个标段,制作一个投标文件, 与GgzyApplyTender的关系为一对一
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BID_DOC")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "applyTenderId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBidDoc")
public class GgzyBidDoc {
	/**
	 * @uml.property  name="applyTender"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_TENDER_ID", referencedColumnName = "APPLY_TENDER_ID")
	private GgzyApplyTender applyTender;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * 报价1
	 */
	@Column(name = "PRICE1", precision = 20, scale = 2)
	private BigDecimal price1;
	
	
	/**
	 * 报价2
	 */
	@Column(name = "PRICE", precision = 20, scale = 2)
	private BigDecimal price;

	/**
	 * 费率
	 */
	@Column(name = "RATE")
	private BigDecimal rate;

	/**
	 * 密封情况
	 */
	@Column(name="seal")
	private String seal;
	/**
	 * 保证金
	 */
	@Column(name="bond")
	private String bond;
	
	
	
	
	public String getSeal() {
		return seal;
	}

	public void setSeal(String seal) {
		this.seal = seal;
	}

	public String getBond() {
		return bond;
	}

	public void setBond(String bond) {
		this.bond = bond;
	}

	/**
	 * @uml.property  name="priceCurrency"
	 */
	@Column(name = "PRICE_CURRENCY", length = 3)
	private String priceCurrency;

	/**
	 * @uml.property  name="priceUnit"
	 */
	@Column(name = "PRICE_UNIT")
	private Character priceUnit;

	/**
	 * @uml.property  name="projectDuration"
	 */
	@Column(name = "PROJECT_DURATION", precision = 4)
	private BigDecimal projectDuration;

	/**
	 * @uml.property  name="bidBondWay"
	 */
	@Column(name = "BID_BOND_WAY", length = 100)
	private String bidBondWay;

	/**
	 * @uml.property  name="bidBond"
	 */
	@Column(name = "BID_BOND", precision = 10, scale = 2)
	private BigDecimal bidBond;

	/**
	 * @uml.property  name="bidBondCurrency"
	 */
	@Column(name = "BID_BOND_CURRENCY", length = 3)
	private String bidBondCurrency;

	/**
	 * @uml.property  name="bidBondUnit"
	 */
	@Column(name = "BID_BOND_UNIT")
	private Character bidBondUnit;

	/**
	 * @uml.property  name="projectLeader"
	 */
	@Column(name = "PROJECT_LEADER", length = 50)
	private String projectLeader;

	/**
	 * @uml.property  name="bidValidity"
	 */
	@Column(name = "BID_VALIDITY", precision = 3)
	private BigDecimal bidValidity;

	/**
	 * @uml.property  name="bidOrder"
	 */
	@Column(name = "BID_ORDER", precision = 3)
	private BigDecimal bidOrder;

	/**
	 * 质量承诺
	 * @uml.property  name="quality"
	 */
	@Column(length=20)
	private String quality;

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
	 * @uml.property  name="attachmentIds"
	 */
	public String getAttachmentIds() {
		return attachmentIds;
	}

	/**
	 * @param attachmentIds
	 * @uml.property  name="attachmentIds"
	 */
	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	/**
	 * @return
	 * @uml.property  name="price"
	 */
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * @param price
	 * @uml.property  name="price"
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * @return
	 * @uml.property  name="priceCurrency"
	 */
	public String getPriceCurrency() {
		return priceCurrency;
	}

	/**
	 * @param priceCurrency
	 * @uml.property  name="priceCurrency"
	 */
	public void setPriceCurrency(String priceCurrency) {
		this.priceCurrency = priceCurrency;
	}

	/**
	 * @return
	 * @uml.property  name="priceUnit"
	 */
	public Character getPriceUnit() {
		return priceUnit;
	}

	/**
	 * @param priceUnit
	 * @uml.property  name="priceUnit"
	 */
	public void setPriceUnit(Character priceUnit) {
		this.priceUnit = priceUnit;
	}

	/**
	 * @return
	 * @uml.property  name="projectDuration"
	 */
	public BigDecimal getProjectDuration() {
		return projectDuration;
	}

	/**
	 * @param projectDuration
	 * @uml.property  name="projectDuration"
	 */
	public void setProjectDuration(BigDecimal projectDuration) {
		this.projectDuration = projectDuration;
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
	 * @uml.property  name="projectLeader"
	 */
	public String getProjectLeader() {
		return projectLeader;
	}

	/**
	 * @param projectLeader
	 * @uml.property  name="projectLeader"
	 */
	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}

	/**
	 * @return
	 * @uml.property  name="bidValidity"
	 */
	public BigDecimal getBidValidity() {
		return bidValidity;
	}

	/**
	 * @param bidValidity
	 * @uml.property  name="bidValidity"
	 */
	public void setBidValidity(BigDecimal bidValidity) {
		this.bidValidity = bidValidity;
	}

	/**
	 * @return
	 * @uml.property  name="bidOrder"
	 */
	public BigDecimal getBidOrder() {
		return bidOrder;
	}

	/**
	 * @param bidOrder
	 * @uml.property  name="bidOrder"
	 */
	public void setBidOrder(BigDecimal bidOrder) {
		this.bidOrder = bidOrder;
	}

	/**
	 * @return
	 * @uml.property  name="quality"
	 */
	public String getQuality() {
		return quality;
	}

	/**
	 * @param quality
	 * @uml.property  name="quality"
	 */
	public void setQuality(String quality) {
		this.quality = quality;
	}

	
	public BigDecimal getPrice1() {
		return price1;
	}

	public void setPrice1(BigDecimal price1) {
		this.price1 = price1;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"applyTenderId").toString();
	}
}
