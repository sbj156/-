package com.lmd.ggzy.domain;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
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

import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_NOTICE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "bidProId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyNotice", include = "non-lazy")
public class GgzyNotice {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5435085519341712215L;

	/**
	 * 公告发布标段
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "notice", cascade = {CascadeType.REFRESH, CascadeType.REMOVE})
	@OrderBy("id.tendersId")
	private Set<GgzyNoticeTenders> noticeTenderses;

	/**
	 * 报名信息
	 */
	@OneToMany(mappedBy = "notice", cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@OrderBy("applyTime")
	private Set<GgzyApply> ggzyApplies;
	
	
	/**
	 * 招标项目
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BID_PRO_ID", referencedColumnName = "BID_PRO_ID")
	private GgzyBidPro bidPro;

	/**
	 * 公告性质(正常公告,更正公告)
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_NATURE")
	private GgzyTreeLib noticeNature;

	/**
	 * 公告类型(招标公告,资格预审公告)
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_TYPE")
	private GgzyTreeLib noticeType;
	
	/**
	 * 公告名称
	 */
	@Column(name = "NOTICE_NAME", length = 100)
	private String noticeName;

	/**
	 * 标书获取开始时间(报名开始)
	 */
	@Column(name = "TENDERER_DOC_GAIN_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar tendererDocGainTime;

	/**
	 * 标书获取截止时间(报名结束)
	 */
	@Column(name = "TENDERER_DOC_GAIN_END_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar tendererDocGainEndTime;

	/**
	 * 标书获取方式
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "TENDERER_DOC_GAIN_WAY")
	private DataClob tendererDocGainWay;

	/**
	 * 标书递交截止时间
	 */
	@Column(name = "BID_DOC_SUB_ENDTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar bidDocSubEndtime;
	
	/**
	 * 资格预审时间
	 */
	@Column(name = "QUA_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar quaTime;

	/**
	 * 标书递交方式
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "BID_DOC_SUB_WAY")
	private DataClob bidDocSubWay;

	/**
	 * 公告内容
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "NOTICE_CONTENT")
	private DataClob noticeContent;

	/**
	 * 发布时间
	 */
	@Column(name = "PUB_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar pubTime;

	/**
	 * 公告结束时间
	 */
	@Column(name = "NOTICE_ENDTIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar noticeEndtime;

	
	/**
	 * 发布责任人
	 */
	@Column(name = "PUB_RESPONSIBLE", length = 50)
	private String pubResponsible;

	/**
	 * 交易平台验证责任人
	 */
	@Column(name = "PLATFORM_VAL_RESPONSIBLE", length = 50)
	private String platformValResponsible;

	/**
	 * 发布媒体
	 */
	@Column(name = "PUB_MEDIA", length = 1000)
	private String pubMedia;

	/**
	 * @uml.property name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * 公告制作时间
	 * 
	 * @uml.property name="makeTime"
	 */
	@Column(name = "MAKE_TIME", columnDefinition = "TIMESTAMP DEFAULT SYSTIMESTAMP")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar makeTime;
	/**
	 * 公告审核时间
	 * 
	 * @uml.property name="auditTime"
	 */
	@Column(name = "AUDIT_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar auditTime;

	/**
	 * 公告审核状态
	 * 
	 * @uml.property name="auditStatus"
	 */
	@Column
	private int auditStatus;

	/**
	 * 场所预约信息
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE, mappedBy = "notice")
	private Set<GgzyBidSite> bidSites;
	/**
	 * 资格预审结果
	 */
	@OneToMany(mappedBy = "notice", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private Set<GgzyProQuaResult> proQuaResult;
	
	/**
	 * 获取资格预审场所安排
	 * @return
	 */
	public GgzyBidSite getQuaBidSite(){
		if(bidSites != null )
			for(GgzyBidSite bidSite : bidSites){
				if(bidSite.isQua())
					return bidSite;
			}
		return null;
	}
	
	/**
	 * 获取正式开标场所
	 * @return
	 */
	public GgzyBidSite getBidSite(){
		if(bidSites != null)
			for(GgzyBidSite bidSite : bidSites){
				if(!bidSite.isQua())
					return bidSite;
			}
		return null;
	}
	
	public Set<GgzyBidSite> getBidSites() {
		return bidSites;
	}

	public void setBidSites(Set<GgzyBidSite> bidSites) {
		this.bidSites = bidSites;
	}

	public Set<GgzyApply> getGgzyApplies() {
		return ggzyApplies;
	}

	public void setGgzyApplies(Set<GgzyApply> ggzyApplies) {
		this.ggzyApplies = ggzyApplies;
	}

	
	/**
	 * @return
	 * @uml.property name="bidPro"
	 */
	public GgzyBidPro getBidPro() {
		return bidPro;
	}

	/**
	 * 是否是资格预审项目
	 * @return
	 */
	public boolean isQua(){
		if(noticeType == null)
			return false;
		return "2".equals(noticeType.getCode());
	}
	
	/**
	 * 是否能报名
	 */
	public boolean isApply() {
		if (tendererDocGainTime == null || tendererDocGainEndTime == null)
			return false;
		Calendar c = Calendar.getInstance();
		if (c.after(tendererDocGainTime) && c.before(tendererDocGainEndTime))
			return true;
		return false;
	}


	public Calendar getQuaTime() {
		return quaTime;
	}

	public void setQuaTime(Calendar quaTime) {
		this.quaTime = quaTime;
	}

	public GgzyProQuaResult getProQuaResult() {
		if(CollectionUtils.isEmpty(proQuaResult))
			return null;
		return proQuaResult.iterator().next();
	}

	public Set<GgzyProQuaResult> getProQuaResults(){
		return proQuaResult;
	}
	
	public Set<GgzyNoticeTenders> getNoticeTenderses() {
		return noticeTenderses;
	}

	public void setNoticeTenderses(Set<GgzyNoticeTenders> noticeTenderses) {
		this.noticeTenderses = noticeTenderses;
	}

	public int getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(int auditStatus) {
		this.auditStatus = auditStatus;
	}

	/**
	 * @param bidPro
	 * @uml.property name="bidPro"
	 */
	public void setBidPro(GgzyBidPro bidPro) {
		this.bidPro = bidPro;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public GgzyTreeLib getNoticeNature() {
		return noticeNature;
	}

	public void setNoticeNature(GgzyTreeLib noticeNature) {
		this.noticeNature = noticeNature;
	}

	public GgzyTreeLib getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(GgzyTreeLib noticeType) {
		this.noticeType = noticeType;
	}

	/**
	 * @return
	 * @uml.property name="tendererDocGainTime"
	 */
	public Calendar getTendererDocGainTime() {
		return tendererDocGainTime;
	}

	/**
	 * @param tendererDocGainTime
	 * @uml.property name="tendererDocGainTime"
	 */
	public void setTendererDocGainTime(Calendar tendererDocGainTime) {
		this.tendererDocGainTime = tendererDocGainTime;
	}

	/**
	 * @return
	 * @uml.property name="bidDocSubEndtime"
	 */
	public Calendar getBidDocSubEndtime() {
		return bidDocSubEndtime;
	}

	/**
	 * @param bidDocSubEndtime
	 * @uml.property name="bidDocSubEndtime"
	 */
	public void setBidDocSubEndtime(Calendar bidDocSubEndtime) {
		this.bidDocSubEndtime = bidDocSubEndtime;
	}

	/**
	 * @return
	 * @uml.property name="pubTime"
	 */
	public Calendar getPubTime() {
		return pubTime;
	}

	/**
	 * @return
	 * @uml.property name="tendererDocGainWay"
	 */
	public DataClob getTendererDocGainWay() {
		return tendererDocGainWay;
	}

	/**
	 * @param tendererDocGainWay
	 * @uml.property name="tendererDocGainWay"
	 */
	public void setTendererDocGainWay(DataClob tendererDocGainWay) {
		this.tendererDocGainWay = tendererDocGainWay;
	}

	/**
	 * @return
	 * @uml.property name="bidDocSubWay"
	 */
	public DataClob getBidDocSubWay() {
		return bidDocSubWay;
	}

	/**
	 * @param bidDocSubWay
	 * @uml.property name="bidDocSubWay"
	 */
	public void setBidDocSubWay(DataClob bidDocSubWay) {
		this.bidDocSubWay = bidDocSubWay;
	}

	/**
	 * @return
	 * @uml.property name="noticeContent"
	 */
	public DataClob getNoticeContent() {
		return noticeContent;
	}

	/**
	 * @param noticeContent
	 * @uml.property name="noticeContent"
	 */
	public void setNoticeContent(DataClob noticeContent) {
		this.noticeContent = noticeContent;
	}

	/**
	 * @param pubTime
	 * @uml.property name="pubTime"
	 */
	public void setPubTime(Calendar pubTime) {
		this.pubTime = pubTime;
	}

	/**
	 * @return
	 * @uml.property name="noticeEndtime"
	 */
	public Calendar getNoticeEndtime() {
		return noticeEndtime;
	}

	/**
	 * @param noticeEndtime
	 * @uml.property name="noticeEndtime"
	 */
	public void setNoticeEndtime(Calendar noticeEndtime) {
		this.noticeEndtime = noticeEndtime;
	}

	/**
	 * @return
	 * @uml.property name="pubResponsible"
	 */
	public String getPubResponsible() {
		return pubResponsible;
	}

	/**
	 * @param pubResponsible
	 * @uml.property name="pubResponsible"
	 */
	public void setPubResponsible(String pubResponsible) {
		this.pubResponsible = pubResponsible;
	}

	/**
	 * @return
	 * @uml.property name="platformValResponsible"
	 */
	public String getPlatformValResponsible() {
		return platformValResponsible;
	}

	/**
	 * @param platformValResponsible
	 * @uml.property name="platformValResponsible"
	 */
	public void setPlatformValResponsible(String platformValResponsible) {
		this.platformValResponsible = platformValResponsible;
	}

	/**
	 * @return
	 * @uml.property name="pubMedia"
	 */
	public String getPubMedia() {
		return pubMedia;
	}

	/**
	 * @param pubMedia
	 * @uml.property name="pubMedia"
	 */
	public void setPubMedia(String pubMedia) {
		this.pubMedia = pubMedia;
	}

	/**
	 * @return
	 * @uml.property name="attachmentIds"
	 */
	public String getAttachmentIds() {
		return attachmentIds;
	}

	/**
	 * @param attachmentIds
	 * @uml.property name="attachmentIds"
	 */
	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	/**
	 * @return
	 * @uml.property name="makeTime"
	 */
	public Calendar getMakeTime() {
		return makeTime;
	}

	/**
	 * @param makeTime
	 * @uml.property name="makeTime"
	 */
	public void setMakeTime(Calendar makeTime) {
		this.makeTime = makeTime;
	}

	/**
	 * @return
	 * @uml.property name="auditTime"
	 */
	public Calendar getAuditTime() {
		return auditTime;
	}

	/**
	 * @param auditTime
	 * @uml.property name="auditTime"
	 */
	public void setAuditTime(Calendar auditTime) {
		this.auditTime = auditTime;
	}

	/**
	 * @return
	 * @uml.property name="tendererDocGainEndTime"
	 */
	public Calendar getTendererDocGainEndTime() {
		return tendererDocGainEndTime;
	}

	/**
	 * @param tendererDocGainEndTime
	 * @uml.property name="tendererDocGainEndTime"
	 */
	public void setTendererDocGainEndTime(Calendar tendererDocGainEndTime) {
		this.tendererDocGainEndTime = tendererDocGainEndTime;
	}

	/**
	 * 获取资格预审通过名单(非资格预审项目默认是通过)
	 * @return
	 */
	public List<GgzyApply> getOfficialApply(){
		List<GgzyApply> list = new ArrayList<GgzyApply>();
		if(!CollectionUtils.isEmpty(ggzyApplies)){
			for(GgzyApply apply : ggzyApplies){
				if(apply.getOfficial())
					list.add(apply);
			}
		}
		return list;
	}
	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("bidProId").toString();
	}
}
