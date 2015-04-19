package com.lmd.ggzy.domain;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
import org.springframework.util.CollectionUtils;

/**
 * 报名标段,记录企业参投标段
 * @author mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_APPLY_TENDER")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBiddingCandidates", "ggzyBiddingResNotices", "ggzyBidDocs", "ggzyBondRecords", "ggzyProspectRecords", "applyId", "tendersId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyApplyTender")
public class GgzyApplyTender {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3498558638653242784L;
	
	/**
	 * 企业报名信息
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_ID", referencedColumnName = "APPLY_ID")
	private GgzyApply apply;

	/**
	 * 
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ 
		@JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID"), 
		@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID")
	})
	private GgzyNoticeTenders noticeTenders;

	/**
	 * 中标候选人
	 */
	@OneToMany(mappedBy = "applyTender", cascade = { CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBiddingCandidate> biddingCandidates;

	/**
	 * 中标公示
	 */
	@OneToMany(mappedBy = "applyTender", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBiddingResNotice> ggzyBiddingResNotices;

	/**
	 * 投标文件
	 */
	@OneToMany(mappedBy = "applyTender", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBidDoc> ggzyBidDocs;

	/**
	 * 保证金交纳记录
	 */
	@OneToMany(mappedBy = "applyTender", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBondRecord> bondRecords;

	/**
	 * 
	 */
	@OneToMany(mappedBy = "applyTender", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyProspectRecord> ggzyProspectRecords;

	/**
	 * 签到时间
	 */
	@Column(name = "SIGN_TIME", columnDefinition = "timestamp default systimestamp")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar signTime;

	/**
	 * @uml.property name="expertScores"
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "applyTender", cascade = { CascadeType.REMOVE })
	private Set<GgzyExpertScore> expertScores;

	/**
	 * @uml.property name="otherScores"
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "applyTender", cascade = { CascadeType.REMOVE })
	private Set<GgzyOtherScore> otherScores;

	/**
	 * 信誉分
	 */
	private BigDecimal reputation;
	/**
	 * 报价分
	 */
	private BigDecimal quotation;
	
	/**
	 * 最终得分
	 */
	@Column(precision = 4, scale = 2)
	private BigDecimal finalScore;

	public BigDecimal getReputation() {
		return reputation;
	}

	public void setReputation(BigDecimal reputation) {
		this.reputation = reputation;
	}

	public BigDecimal getQuotation() {
		return quotation;
	}

	public void setQuotation(BigDecimal quotation) {
		this.quotation = quotation;
	}

	/**
	 * 最终报价
	 */
	@Column
	private BigDecimal last;

	
	public BigDecimal getLast() {
		return last;
	}

	public void setLast(BigDecimal last) {
		this.last = last;
	}

	/**
	 * 是否通过
	 */
	@Column(columnDefinition = "number(1) default 0")
	private boolean review;
	
	/**
	 * 排名
	 */
	@Column(precision = 10)
	private Integer rank;


	public boolean isReview() {
		return review;
	}

	public void setReview(boolean review) {
		this.review = review;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public BigDecimal getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(BigDecimal finalScore) {
		this.finalScore = finalScore;
	}

	/**
	 * 根据评分类型取得评分
	 * 
	 * @return
	 */
	public GgzyOtherScore getOtherScore(Long scoreTypeId) {
		for (GgzyOtherScore otherScore : otherScores) {
			if (otherScore.getScoreType().getScoreType().getId().equals(scoreTypeId))
				return otherScore;
		}
		return null;
	}

	public GgzyExpertScore getExpertScore(String expertid) {
		for (GgzyExpertScore expertScore : expertScores) {
			if (expertScore.getExpert().getId().equals(expertid))
				return expertScore;
		}
		return null;
	}

	/**
	 * @return
	 * @uml.property name="expertScores"
	 */
	public Set<GgzyExpertScore> getExpertScores() {
		return expertScores;
	}

	/**
	 * @param expertScores
	 * @uml.property name="expertScores"
	 */
	public void setExpertScores(Set<GgzyExpertScore> expertScores) {
		this.expertScores = expertScores;
	}

	public GgzyBiddingCandidate getBiddingCandidate() {
		if(CollectionUtils.isEmpty(biddingCandidates))
			return null;
		return biddingCandidates.iterator().next();
	}

	/**
	 * @return
	 * @uml.property name="ggzyBiddingResNotices"
	 */
	public Set<GgzyBiddingResNotice> getGgzyBiddingResNotices() {
		return ggzyBiddingResNotices;
	}

	/**
	 * @param ggzyBiddingResNotices
	 * @uml.property name="ggzyBiddingResNotices"
	 */
	public void setGgzyBiddingResNotices(Set<GgzyBiddingResNotice> ggzyBiddingResNotices) {
		this.ggzyBiddingResNotices = ggzyBiddingResNotices;
	}

	/**
	 * @return
	 * @uml.property name="ggzyBidDocs"
	 */
	public GgzyBidDoc getGgzyBidDocs() {
		if(CollectionUtils.isEmpty(ggzyBidDocs))
			return null;
		return ggzyBidDocs.iterator().next();
	}

	public GgzyBondRecord getBondRecord() {
		if(CollectionUtils.isEmpty(bondRecords))
			return null;
		return bondRecords.iterator().next();
	}

	/**
	 * @return
	 * @uml.property name="ggzyProspectRecords"
	 */
	public Set<GgzyProspectRecord> getGgzyProspectRecords() {
		return ggzyProspectRecords;
	}

	/**
	 * @param ggzyProspectRecords
	 * @uml.property name="ggzyProspectRecords"
	 */
	public void setGgzyProspectRecords(Set<GgzyProspectRecord> ggzyProspectRecords) {
		this.ggzyProspectRecords = ggzyProspectRecords;
	}

	/**
	 * @return
	 * @uml.property name="apply"
	 */
	public GgzyApply getApply() {
		return apply;
	}

	/**
	 * @param apply
	 * @uml.property name="apply"
	 */
	public void setApply(GgzyApply apply) {
		this.apply = apply;
	}

	public GgzyNoticeTenders getNoticeTenders() {
		return noticeTenders;
	}

	public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
		this.noticeTenders = noticeTenders;
	}

	/**
	 * @return
	 * @uml.property name="signTime"
	 */
	public Calendar getSignTime() {
		return signTime;
	}

	/**
	 * @param signTime
	 * @uml.property name="signTime"
	 */
	public void setSignTime(Calendar signTime) {
		this.signTime = signTime;
	}

	/**
	 * @return
	 * @uml.property name="otherScores"
	 */
	public Set<GgzyOtherScore> getOtherScores() {
		return otherScores;
	}

	/**
	 * @param otherScores
	 * @uml.property name="otherScores"
	 */
	public void setOtherScores(Set<GgzyOtherScore> otherScores) {
		this.otherScores = otherScores;
	}

	/**
	 * @return
	 * @uml.property name="serialVersionUID"
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyBiddingCandidates", "ggzyBiddingResNotices", "ggzyBidDocs", "ggzyBondRecords", "ggzyProspectRecords", "applyId", "tendersId").toString();
	}

}
