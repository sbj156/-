package com.lmd.ggzy.domain;
import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

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

import com.lmd.ggzy.domain.data.DataClob;
import com.lmd.ggzy.domain.pk.GgzyRefTenderApplyPk;


/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BIDDING_CANDIDATE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBidPublicities", "applyTenderId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBiddingCandidate")
public class GgzyBiddingCandidate  {


    /**
	 * @uml.property  name="applyTender"
	 * @uml.associationEnd  
	 */
	@EmbeddedId
	private GgzyRefTenderApplyPk id = new GgzyRefTenderApplyPk();
	
	/**
	 * 中标人
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "APPLY_TENDER_ID", nullable = false, insertable = false, updatable = false)
    private GgzyApplyTender applyTender;
    
    /**
     * 
     */
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", nullable = false, insertable = false, updatable = false), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", nullable = false, insertable = false, updatable = false)
	})
	private GgzyNoticeTenders noticeTenders;
    
    /**
     * 中标公示内容
     */
    @OneToOne(fetch = FetchType.LAZY, cascade = {CascadeType.ALL})
    @JoinColumn(name = "PUBLICITY_CONTENT")
    private DataClob publicityContent;
    /**
	 * 评标价格
	 */
    @Column(name = "EVALUATION_PRICE", precision = 20, scale = 2)
    private BigDecimal evaluationPrice;
    
    /**
	 * 中标价格
	 */
    @Column(name = "BID_PRICE", precision = 20, scale = 2)
    private BigDecimal bidPrice;
    
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
		this.id.setApplyTenderId(applyTender.getApplyTenderId());
	}

	/**
	 * @return
	 * @uml.property  name="evaluationPrice"
	 */
	public BigDecimal getEvaluationPrice() {
        return evaluationPrice;
    }
    
    /**
	 * @param evaluationPrice
	 * @uml.property  name="evaluationPrice"
	 */
    public void setEvaluationPrice(BigDecimal evaluationPrice) {
        this.evaluationPrice = evaluationPrice;
    }
    

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property  name="bidPrice"
	 */
    public BigDecimal getBidPrice() {
        return bidPrice;
    }
    
    /**
	 * @param bidPrice
	 * @uml.property  name="bidPrice"
	 */
    public void setBidPrice(BigDecimal bidPrice) {
        this.bidPrice = bidPrice;
    }
    
    
    public GgzyRefTenderApplyPk getId() {
		return id;
	}

	public void setId(GgzyRefTenderApplyPk id) {
		this.id = id;
	}

	public DataClob getPublicityContent() {
		return publicityContent;
	}

	public void setPublicityContent(DataClob publicityContent) {
		this.publicityContent = publicityContent;
	}

	public String toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyBidPublicities", "applyTenderId").toString();
    }
    
}
