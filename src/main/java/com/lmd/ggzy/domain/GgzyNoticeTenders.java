package com.lmd.ggzy.domain;

import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.util.CollectionUtils;

import com.lmd.ggzy.domain.pk.GgzyNoticeTendersPk;

/**
 * 公告发布标段
 * 发布公告时可以选择多个标段,每选择一个标段会对应一个GgzyNoticeTenders
 * @author  mh_cxp
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyNoticeTenders")
@Entity
@Table(name = "GGZY_NOTICE_TENDERS")
public class GgzyNoticeTenders {
	
	@EmbeddedId
	private GgzyNoticeTendersPk id;
	/**
	 * 公告
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_ID", nullable = false, insertable = false, updatable = false)
	private GgzyNotice notice;
	
	/**
	 * 标段
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TENDERS_ID", nullable = false, insertable = false, updatable = false)
	private GgzyTenders tenders;

	/**
	 * 企业报名标段关系
	 */
	@OneToMany(mappedBy = "noticeTenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@OrderBy("signTime, applyTenderId")
	private Set<GgzyApplyTender> ggzyApplyTenders;

	@OneToMany(mappedBy = "noticeTenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBidSite> bidSites;
	/**
	 *开标记录 
	 */
	@OneToMany(mappedBy = "noticeTenders", cascade = { CascadeType.PERSIST,
			CascadeType.MERGE, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBidOpening> ggzyBidOpenings;
	
	/**
	 * 专家抽取过程
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyExpertApply> expertApplies;
	
	/**
	 * 统一打分类型
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	@OrderBy("sortIndex")
	private Set<GgzyTendersScoreType> scoreTypes;
	
	/**
	 * 评标记录
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyEvaluationReport> evaluationReports;
	
	/**
	 * 中标人
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyBiddingCandidate> biddingCandidates;
	
	/**
	 * 中标公示
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyBidPublicity> bidPublicitiy;
	
	/**
	 * 交易服务费
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyTradingServicesFees> fee;

	/**
	 * 废标情况
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "noticeTenders")
	private Set<GgzyExceptionalCase> exceptionalCases;
	
	/**
	 * 预留字段,默认情况下与notice中的bidDocSubEndtime相同
	 * 实际情况中出现在开标过程中流标(废标),监督签字择日重开的情况,但是在招标法中明确规定出现流标,所有招标程序作废,需要重新招标,所以这种情况暂时不考虑
	 * 
	 */
	@Column(name = "BID_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar bidTime;
	
	
	public GgzyTradingServicesFees getFee() {
		if(CollectionUtils.isEmpty(fee))
			return null;
		return fee.iterator().next();
	}

	public GgzyBidPublicity getBidPublicitiy() {
		if(CollectionUtils.isEmpty(bidPublicitiy))
			return null;
		return bidPublicitiy.iterator().next();
	}

	public GgzyBiddingCandidate getBiddingCandidate() {
		if(CollectionUtils.isEmpty(biddingCandidates))
			return null;
		return biddingCandidates.iterator().next();
	}
	
	public Set<GgzyBiddingCandidate> getBiddingCandidates(){
		if(CollectionUtils.isEmpty(biddingCandidates)){
			return null;
		}
		return biddingCandidates;
	}

	public GgzyBidOpening getGgzyBidOpenings() {
		if(ggzyBidOpenings != null && !ggzyBidOpenings.isEmpty())
			return ggzyBidOpenings.iterator().next();
		return null;
	}

	public GgzyExpertApply getExpertApply() {
		if(CollectionUtils.isEmpty(this.expertApplies))
			return null;
		return expertApplies.iterator().next();
	}

	public Set<GgzyApplyTender> getGgzyApplyTenders() {
		return ggzyApplyTenders;
	}

	public GgzyNotice getNotice() {
		return notice;
	}

	public void setNotice(GgzyNotice notice) {
		this.notice = notice;
	}

	public GgzyTenders getTenders() {
		return tenders;
	}

	public void setTenders(GgzyTenders tenders) {
		this.tenders = tenders;
	}

	public GgzyNoticeTendersPk getId() {
		return id;
	}

	public void setId(GgzyNoticeTendersPk id) {
		this.id = id;
	}

	public GgzyNoticeTenders() {
		super();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof GgzyNoticeTenders){
			return this.getId().equals(((GgzyNoticeTenders)obj).getId());
		}
		return super.equals(obj);
	}
	
	public Calendar getBidTime() {
		return this.bidTime == null? notice.getBidDocSubEndtime():this.bidTime;
	}

	public void setBidTime(Calendar bidTime) {
		this.bidTime = bidTime;
	}
	
	public Set<GgzyTendersScoreType> getScoreTypes() {
		return scoreTypes;
	}

	public void setScoreTypes(Set<GgzyTendersScoreType> scoreTypes) {
		this.scoreTypes = scoreTypes;
	}
	
	public GgzyEvaluationReport getEvaluationReport() {
		if(CollectionUtils.isEmpty(evaluationReports))
			return null;
		return evaluationReports.iterator().next();
	}

	public GgzyNoticeTenders(GgzyNoticeTendersPk id) {
		super();
		this.id = id;
	}
	public GgzyNoticeTenders(String tendersId, String noticeId) {
		super();
		this.id = new GgzyNoticeTendersPk(tendersId, noticeId);
	}

	public GgzyExceptionalCase getExceptionalCase() {
		if(CollectionUtils.isEmpty(exceptionalCases))
			return null;
		return exceptionalCases.iterator().next();
	}

	public Set<GgzyBidSite> getBidSites() {
		return bidSites;
	}

	public void setBidSites(Set<GgzyBidSite> bidSites) {
		this.bidSites = bidSites;
	}
}
