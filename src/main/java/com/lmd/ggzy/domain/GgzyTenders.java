package com.lmd.ggzy.domain;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.util.CollectionUtils;

import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_TENDERS")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyApplyTenders", "ggzyBidInvitations",
		"ggzyBidOpenings", "ggzyEvaluationReports", "ggzyExceptionalCases",
		"ggzyObjections", "ggzyProspectNotices", "ggzyProQuaApplyDocs",
		"ggzyProQuaDocs", "ggzyProQuaResults", "ggzyTenderDocs", "bidProId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyTenders", include="non-lazy")
public class GgzyTenders  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4479802462550581533L;

	/**
	 * 投标邀请函
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyBidInvitation> ggzyBidInvitations;


	/**
	 * 废标情况
	 *//*
	@OneToOne(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)*/
	/*private GgzyExceptionalCase exceptionalCase;*/
	/**
	 * 交易服务费
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.REMOVE}, mappedBy = "tenders")
	private Set<GgzyTradingServicesFees> fee;
	/**
	 * 异议与投诉
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyObjection> ggzyObjections;

	/**
	 * @uml.property  name="ggzyProspectNotices"
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyProspectNotice> ggzyProspectNotices;

	/**
	 * @uml.property  name="ggzyProQuaApplyDocs"
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyProQuaApplyDoc> ggzyProQuaApplyDocs;

	/**
	 * @uml.property  name="ggzyProQuaDocs"
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyProQuaDoc> ggzyProQuaDocs;

	/**
	 * @uml.property  name="ggzyProQuaResults"
	 */
	/*@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyProQuaResult> ggzyProQuaResults;*/

	/**
	 * @uml.property  name="ggzyTenderDocs"
	 */
	@OneToMany(mappedBy = "tenders", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyTenderDoc> ggzyTenderDocs;

	/**
	 * 中标候选人
	 * 
	 * 由于济南只发中标公示不发中标候选人公示,这里只能选一个中标人
	 *//*
	@OneToOne(mappedBy = "tenders", cascade = {CascadeType.REMOVE}, fetch = FetchType.LAZY)
	private GgzyBiddingCandidate biddingCandidates;
	*/
	/**
	 * 发布该标段的所有公告
	 */
	/*@ManyToMany(fetch = FetchType.LAZY, mappedBy = "tenderss")
	private Set<GgzyNotice> notices;*/
	/**
	 * 与公告关联关系
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tenders", cascade = CascadeType.REMOVE)
	private Set<GgzyNoticeTenders> noticeTenderses;
	
	/**
	 * 中标通知书,系统中只打印中标通知书,这里对应集合中只存中标通知书
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tenders", cascade = CascadeType.REMOVE)
	private Set<GgzyBiddingResNotice> biddingResNotices;
	/**
	 * 
	 * 最近一次发布的公告
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_ID")
	private GgzyNotice notice;
	
	/**
	 * @uml.property  name="bidPro"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BID_PRO_ID", referencedColumnName = "BID_PRO_ID")
	private GgzyBidPro bidPro;

	/**
	 * 招标范围
	 */
	@Column(length = 1000)
	private String bidRange;

	/**
	 * 工程名称
	 */
	@Column(length = 200)
	private String proName;

	/**
	 * 规模
	 */
	@Column(length = 50)
	private String scale;

	/**
	 * 结构类型
	 */
	@Column(length = 50)
	private String structureType;
	/**
	 * 面积
	 */
	@Column(precision = 20, scale = 2)
	private BigDecimal area;

	/**
	 * 建设地点
	 */
	@Column(length = 200)
	private String address;
	
	/**
	 * 评估值
	 */
	@Column(name = "assessment_value",precision=20,scale=2 )
	private BigDecimal assessmentValue;
	
	/**
	 * 评估部门
	 */
	@Column(name = "assessment_dept",length=200)
	private String assessmentDept;
	
	/**
	 * @uml.property  name="tendersCode"
	 */
	@Column(name = "TENDERS_CODE", length = 23)
	private String tendersCode;

	/**
	 * @uml.property  name="tendersName"
	 */
	@Column(name = "TENDERS_NAME", length = 200)
	private String tendersName;

	/**
	 * @uml.property  name="classifyCode"
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CLASSIFY_CODE")
	private GgzyTreeLib classifyCode;

	/**
	 * 合同估算价
	 * @uml.property  name="computeValue"
	 */
	@Column(name = "COMPUTE_VALUE", precision = 20, scale = 2)
	private BigDecimal computeValue;
	public BigDecimal getAssessmentValue() {
		return assessmentValue;
	}


	public void setAssessmentValue(BigDecimal assessmentValue) {
		this.assessmentValue = assessmentValue;
	}


	public String getAssessmentDept() {
		return assessmentDept;
	}


	public void setAssessmentDept(String assessmentDept) {
		this.assessmentDept = assessmentDept;
	}


	/**
	 * 合同估算价币种
	 * @uml.property  name="computeCurrency"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMPUTE_CURRENCY", referencedColumnName = "ID")
	private GgzyTreeLib computeCurrency;

	/**
	 * 合同估算价单位
	 * @uml.property  name="computeUnit"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMPUTE_UNIT", referencedColumnName = "ID")
	private GgzyTreeLib computeUnit;
	/**
	 * @uml.property  name="tendersContent"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "TENDERS_CONTENT")
	private DataClob tendersContent;

	/**
	 * @uml.property  name="bidderQualification"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = { CascadeType.ALL })
	@JoinColumn(name = "BIDDER_QUALIFICATION")
	private DataClob bidderQualification;
	
	
	
	/**
	 * 当前状态,0异常(废标),1正常
	 */
	@Column(columnDefinition="number(2) default 1")
	private Integer status;
	
	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * @return
	 * @uml.property  name="notice"
	 */
	public GgzyNotice getNotice() {
		return notice;
	}

	/**
	 * @param notice
	 * @uml.property  name="notice"
	 */
	public void setNotice(GgzyNotice notice) {
		this.notice = notice;
	}

	/**
	 * @return
	 * @uml.property  name="bidPro"
	 */
	public GgzyBidPro getBidPro() {
		return bidPro;
	}

	/**
	 * @param bidPro
	 * @uml.property  name="bidPro"
	 */
	public void setBidPro(GgzyBidPro bidPro) {
		this.bidPro = bidPro;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyBidInvitations"
	 */
	public Set<GgzyBidInvitation> getGgzyBidInvitations() {
		return ggzyBidInvitations;
	}

	/**
	 * @param ggzyBidInvitations
	 * @uml.property  name="ggzyBidInvitations"
	 */
	public void setGgzyBidInvitations(Set<GgzyBidInvitation> ggzyBidInvitations) {
		this.ggzyBidInvitations = ggzyBidInvitations;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyObjections"
	 */
	public Set<GgzyObjection> getGgzyObjections() {
		return ggzyObjections;
	}

	/**
	 * @param ggzyObjections
	 * @uml.property  name="ggzyObjections"
	 */
	public void setGgzyObjections(Set<GgzyObjection> ggzyObjections) {
		this.ggzyObjections = ggzyObjections;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyProspectNotices"
	 */
	public Set<GgzyProspectNotice> getGgzyProspectNotices() {
		return ggzyProspectNotices;
	}

	/**
	 * @param ggzyProspectNotices
	 * @uml.property  name="ggzyProspectNotices"
	 */
	public void setGgzyProspectNotices(
			Set<GgzyProspectNotice> ggzyProspectNotices) {
		this.ggzyProspectNotices = ggzyProspectNotices;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyProQuaApplyDocs"
	 */
	public Set<GgzyProQuaApplyDoc> getGgzyProQuaApplyDocs() {
		return ggzyProQuaApplyDocs;
	}

	/**
	 * @param ggzyProQuaApplyDocs
	 * @uml.property  name="ggzyProQuaApplyDocs"
	 */
	public void setGgzyProQuaApplyDocs(
			Set<GgzyProQuaApplyDoc> ggzyProQuaApplyDocs) {
		this.ggzyProQuaApplyDocs = ggzyProQuaApplyDocs;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyProQuaDocs"
	 */
	public Set<GgzyProQuaDoc> getGgzyProQuaDocs() {
		return ggzyProQuaDocs;
	}

	/**
	 * @param ggzyProQuaDocs
	 * @uml.property  name="ggzyProQuaDocs"
	 */
	public void setGgzyProQuaDocs(Set<GgzyProQuaDoc> ggzyProQuaDocs) {
		this.ggzyProQuaDocs = ggzyProQuaDocs;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyTenderDocs"
	 */
	public Set<GgzyTenderDoc> getGgzyTenderDocs() {
		return ggzyTenderDocs;
	}

	/**
	 * @param ggzyTenderDocs
	 * @uml.property  name="ggzyTenderDocs"
	 */
	public void setGgzyTenderDocs(Set<GgzyTenderDoc> ggzyTenderDocs) {
		this.ggzyTenderDocs = ggzyTenderDocs;
	}

	/**
	 * @return
	 * @uml.property  name="tendersCode"
	 */
	public String getTendersCode() {
		return tendersCode;
	}

	/**
	 * @param tendersCode
	 * @uml.property  name="tendersCode"
	 */
	public void setTendersCode(String tendersCode) {
		this.tendersCode = tendersCode;
	}

	/**
	 * @return
	 * @uml.property  name="tendersName"
	 */
	public String getTendersName() {
		return tendersName;
	}

	/**
	 * @param tendersName
	 * @uml.property  name="tendersName"
	 */
	public void setTendersName(String tendersName) {
		this.tendersName = tendersName;
	}

	/**
	 * @return
	 * @uml.property  name="tendersContent"
	 */
	public DataClob getTendersContent() {
		return tendersContent;
	}

	/**
	 * @param tendersContent
	 * @uml.property  name="tendersContent"
	 */
	public void setTendersContent(DataClob tendersContent) {
		this.tendersContent = tendersContent;
	}

	/**
	 * @param bidderQualification
	 * @uml.property  name="bidderQualification"
	 */
	public void setBidderQualification(DataClob bidderQualification) {
		this.bidderQualification = bidderQualification;
	}


	public GgzyTreeLib getClassifyCode() {
		return classifyCode;
	}

	public void setClassifyCode(GgzyTreeLib classifyCode) {
		this.classifyCode = classifyCode;
	}

	/**
	 * @return
	 * @uml.property  name="computeValue"
	 */
	public BigDecimal getComputeValue() {
		return computeValue;
	}

	/**
	 * @param computeValue
	 * @uml.property  name="computeValue"
	 */
	public void setComputeValue(BigDecimal computeValue) {
		this.computeValue = computeValue;
	}

	/**
	 * @return
	 * @uml.property  name="computeCurrency"
	 */
	public GgzyTreeLib getComputeCurrency() {
		return computeCurrency;
	}

	/**
	 * @param computeCurrency
	 * @uml.property  name="computeCurrency"
	 */
	public void setComputeCurrency(GgzyTreeLib computeCurrency) {
		this.computeCurrency = computeCurrency;
	}

	/**
	 * @return
	 * @uml.property  name="computeUnit"
	 */
	public GgzyTreeLib getComputeUnit() {
		return computeUnit;
	}

	/**
	 * @param computeUnit
	 * @uml.property  name="computeUnit"
	 */
	public void setComputeUnit(GgzyTreeLib computeUnit) {
		this.computeUnit = computeUnit;
	}

	/**
	 * @return
	 * @uml.property  name="bidderQualification"
	 */
	public DataClob getBidderQualification() {
		return bidderQualification;
	}
	
	

	public String getBidRange() {
		return bidRange;
	}

	public void setBidRange(String bidRange) {
		this.bidRange = bidRange;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getStructureType() {
		return structureType;
	}

	public void setStructureType(String structureType) {
		this.structureType = structureType;
	}

	public BigDecimal getArea() {
		return area;
	}

	public void setArea(BigDecimal area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public GgzyTradingServicesFees getFee() {
		if(CollectionUtils.isEmpty(fee))
			return null;
		return fee.iterator().next();
	}


	public Set<GgzyNoticeTenders> getNoticeTenderses() {
		return noticeTenderses;
	}


	public GgzyBiddingResNotice getBiddingResNotice() {
		if(!CollectionUtils.isEmpty(biddingResNotices))
			return biddingResNotices.iterator().next();
		return null;
	}


	@Override
	public String toString() {
		return "GgzyTenders [ggzyBidInvitations=" + ggzyBidInvitations
				+ ", ggzyObjections=" + ggzyObjections
				+ ", ggzyProspectNotices=" + ggzyProspectNotices
				+ ", ggzyProQuaApplyDocs=" + ggzyProQuaApplyDocs
				+ ", ggzyProQuaDocs=" + ggzyProQuaDocs + ", ggzyTenderDocs=" + ggzyTenderDocs
				+ ", bidPro=" + bidPro + ", tendersCode=" + tendersCode
				+ ", tendersName=" + tendersName + ", tendersContent="
				+ tendersContent + ", classifyCode=" + classifyCode
				+ ", computeValue=" + computeValue + ", computeCurrency="
				+ computeCurrency + ", computeUnit=" + computeUnit
				+ ", bidderQualification=" + bidderQualification + "]";
	}

}
