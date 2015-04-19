package com.lmd.ggzy.domain;
import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

import com.lmd.ggzy.domain.data.DataClob;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BID_INVITATION")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBidInvitation")
public class GgzyBidInvitation  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5053289725195422797L;

	/**
	 * @uml.property  name="tenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
    @JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
    private GgzyTenders tenders;
    
    /**
	 * @uml.property  name="bidQualification"
	 * @uml.associationEnd  
	 */
    @OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_QUALIFICATION")
    private DataClob bidQualification;
    
    /**
	 * @uml.property  name="tendererDocGainTime"
	 */
    @Column(name = "TENDERER_DOC_GAIN_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar tendererDocGainTime;
    
    /**
	 * @uml.property  name="tendererDocGainWay"
	 * @uml.associationEnd  
	 */
    @OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="TENDERER_DOC_GAIN_WAY")
    private DataClob tendererDocGainWay;
    
    /**
	 * @uml.property  name="bidDocSubEndtime"
	 */
    @Column(name = "BID_DOC_SUB_ENDTIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar bidDocSubEndtime;
    
    /**
	 * @uml.property  name="bidDocSubWay"
	 * @uml.associationEnd  
	 */
    @OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_DOC_SUB_WAY")
    private DataClob bidDocSubWay;
    
    /**
	 * @uml.property  name="replyEndtime"
	 */
    @Column(name = "REPLY_ENDTIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar replyEndtime;
    
    /**
	 * @uml.property  name="inviteTime"
	 */
    @Column(name = "INVITE_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar inviteTime;
    
    /**
	 * @uml.property  name="attachmentIds"
	 */
    @Column(name = "ATTACHMENT_IDS", length = 1000)
    private String attachmentIds;
    
    
    /**
	 * @return
	 * @uml.property  name="tenders"
	 */
    public GgzyTenders getTenders() {
		return tenders;
	}

	/**
	 * @param tenders
	 * @uml.property  name="tenders"
	 */
	public void setTenders(GgzyTenders tenders) {
		this.tenders = tenders;
	}

    /**
	 * @return
	 * @uml.property  name="tendererDocGainTime"
	 */
    public Calendar getTendererDocGainTime() {
        return tendererDocGainTime;
    }
    
    /**
	 * @param tendererDocGainTime
	 * @uml.property  name="tendererDocGainTime"
	 */
    public void setTendererDocGainTime(Calendar tendererDocGainTime) {
        this.tendererDocGainTime = tendererDocGainTime;
    }
    
    /**
	 * @return
	 * @uml.property  name="bidDocSubEndtime"
	 */
    public Calendar getBidDocSubEndtime() {
        return bidDocSubEndtime;
    }
    
    /**
	 * @param bidDocSubEndtime
	 * @uml.property  name="bidDocSubEndtime"
	 */
    public void setBidDocSubEndtime(Calendar bidDocSubEndtime) {
        this.bidDocSubEndtime = bidDocSubEndtime;
    }
    
    /**
	 * @return
	 * @uml.property  name="replyEndtime"
	 */
    public Calendar getReplyEndtime() {
        return replyEndtime;
    }
    
    /**
	 * @param replyEndtime
	 * @uml.property  name="replyEndtime"
	 */
    public void setReplyEndtime(Calendar replyEndtime) {
        this.replyEndtime = replyEndtime;
    }
    
    /**
	 * @return
	 * @uml.property  name="inviteTime"
	 */
    public Calendar getInviteTime() {
        return inviteTime;
    }
    
    /**
	 * @param inviteTime
	 * @uml.property  name="inviteTime"
	 */
    public void setInviteTime(Calendar inviteTime) {
        this.inviteTime = inviteTime;
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
	 * @uml.property  name="bidQualification"
	 */
    public DataClob getBidQualification() {
		return bidQualification;
	}

	/**
	 * @param bidQualification
	 * @uml.property  name="bidQualification"
	 */
	public void setBidQualification(DataClob bidQualification) {
		this.bidQualification = bidQualification;
	}

	/**
	 * @return
	 * @uml.property  name="tendererDocGainWay"
	 */
	public DataClob getTendererDocGainWay() {
		return tendererDocGainWay;
	}

	/**
	 * @param tendererDocGainWay
	 * @uml.property  name="tendererDocGainWay"
	 */
	public void setTendererDocGainWay(DataClob tendererDocGainWay) {
		this.tendererDocGainWay = tendererDocGainWay;
	}

	/**
	 * @return
	 * @uml.property  name="bidDocSubWay"
	 */
	public DataClob getBidDocSubWay() {
		return bidDocSubWay;
	}

	/**
	 * @param bidDocSubWay
	 * @uml.property  name="bidDocSubWay"
	 */
	public void setBidDocSubWay(DataClob bidDocSubWay) {
		this.bidDocSubWay = bidDocSubWay;
	}

	public String toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("tendersId").toString();
    }
    
}
