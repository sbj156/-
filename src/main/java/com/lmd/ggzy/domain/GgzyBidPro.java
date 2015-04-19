package com.lmd.ggzy.domain;

import java.util.Calendar;
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

import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BID_PRO")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyApplies", "ggzyNotices", "ggzyTenderss",
		"baseProId" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBidPro", include="non-lazy")
public class GgzyBidPro  {

	public static final String PPASUES_STATUS = "paused";
	
	public static final String RUNNING_STATUS = "running";
	/**
	 * 
	 */
	private static final long serialVersionUID = 7776314904658628573L;
	/**
	 * 业务类型
	 * @uml.property  name="businessType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_type_id", referencedColumnName = "business_type_id", updatable = false)
	private GgzyBusinessType businessType;
	/**
	 * 专业类型
	 * @uml.property  name="majorType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "major_type_id", referencedColumnName = "major_type_id", updatable = false)
	private GgzyMajorType majorType;

	/**
	 * 招标方式
	 * @uml.property  name="businessWay"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_way_id", referencedColumnName = "business_way_id", updatable = false)
	private GgzyBusinessWay businessWay;

	/*
	@OneToMany(mappedBy = "bidPro", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch=FetchType.LAZY)
	private Set<GgzyApply> ggzyApplies;*/

	/**
	 * @uml.property  name="ggzyNotices"
	 */
	@OneToMany(mappedBy = "bidPro", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch=FetchType.LAZY)
	@OrderBy("tendererDocGainTime")
	private Set<GgzyNotice> ggzyNotices;

	/**
	 * @uml.property  name="ggzyTenderss"
	 */
	@OneToMany(mappedBy = "bidPro", cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, fetch=FetchType.LAZY)
	@OrderBy("tendersId")
	private Set<GgzyTenders> ggzyTenderss;

	/**
	 * @uml.property  name="basePro"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "BASE_PRO_ID", referencedColumnName = "BASE_PRO_ID", updatable = false)
	private GgzyBasePro basePro;

	/**
	 * 公告创建状态
	 * @uml.property  name="noticeMaked"
	 *//*
	@Formula("decode(sign((select count(1) from ggzy_notice n where n.bid_pro_id=bid_pro_id)),1,1,0)")
	private boolean noticeMaked;
*/
	/**
	 * 代理机构
	 * @uml.property  name="agency"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "AGENCY_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject agency;

	/**
	 * 招标人
	 * @uml.property  name="tenderee"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "TENDEREE_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject tenderee;

	
	/**
	 * 项目状态,默认为运行状态
	 */
	@Column(length = 20, nullable = false, columnDefinition = "varchar2(20) default 'running'")
	private String status = RUNNING_STATUS;
	
	/**
	 * 济南公共资源编号,格式如2014JSSG02Z0001,年份(4)业务类型(2)专业类型(2)区域(2)招标方式(1)顺序号(1)
	 * @uml.property  name="proCode"
	 */
	@Column(name = "PRO_CODE", length = 15, updatable = false)
	private String proCode;
	/**
	 * 委托公证
	 * @uml.property  name="proxyNotarization"
	 */
	@Column(name = "proxyNotarization", columnDefinition = "number(1) default 0")
	private boolean proxyNotarization;
	/**
	 * 计划批文
	 * @uml.property  name="approval"
	 */
	@Column(name = "approval", length = 100)
	private String approval;

	/**
	 * 建设工程规划许可证
	 * @uml.property  name="planLicence"
	 */
	@Column(name = "plan_licence", length = 100)
	private String planLicence;

	/**
	 * 业主提供材料清单
	 * @uml.property  name="fileList"
	 */
	@Column(name = "file_list", length = 500)
	private String fileList;

	/**
	 * 代理机构联系人
	 * @uml.property  name="agencyContacts"
	 */
	@Column(name = "AGENCY_CONTACTS", length = 50)
	private String agencyContacts;

	/**
	 * 代理机构联系方式
	 * @uml.property  name="agencyTel"
	 */
	@Column(name = "AGENCY_TEL", length = 20)
	private String agencyTel;

	/**
	 * @uml.property  name="bidProCode"
	 */
	@Column(name = "BID_PRO_CODE", length = 20, updatable = false)
	private String bidProCode;

	/**
	 * @uml.property  name="bidProName"
	 */
	@Column(name = "BID_PRO_NAME", length = 100)
	private String bidProName;

	/**
	 * @uml.property  name="bidDesc"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="BID_DESC")
	private DataClob bidDesc;

	/**
	 * @uml.property  name="bidForm"
	 */
	@Column(name = "BID_FORM")
	private Character bidForm;

	/**
	 * @uml.property  name="createTime"
	 */
	@Column(name = "CREATE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "M-", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar createTime;

	/**
	 * 主管部门
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "WATCHDOG_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject watchdog;

	/**
	 * @uml.property  name="auditDeptCode"
	 */
	@Column(name = "AUDIT_DEPT_CODE", length = 9)
	private String auditDeptCode;

	/**
	 * @uml.property  name="auditDeptName"
	 */
	@Column(name = "AUDIT_DEPT_NAME", length = 100)
	private String auditDeptName;

	/**
	 * @uml.property  name="platformCode"
	 */
	@Column(name = "PLATFORM_CODE", length = 10)
	private String platformCode;

	/**
	 * @uml.property  name="declareResponsible"
	 */
	@Column(name = "DECLARE_RESPONSIBLE", length = 100)
	private String declareResponsible;

	/**
	 * @uml.property  name="attachmentIds"
	 */
	@Column(name = "ATTACHMENT_IDS", length = 1000)
	private String attachmentIds;

	/**
	 * 
	 */
	@Column(name="OLD_PROJECT", length=50)
	private String oldProject;
	
	@Column(name="PLANCODE")
	private String plancode;
	
	@Column(name="PERSON")
	private String person;
	
	
	@Column(name="CONTRACT")
	private String contract;
	
	@Column(name="CONTRACT_TEL")
	private String contractTel;
	
	public GgzyBiddingSubject getWatchdog() {
		return watchdog;
	}
	public void setWatchdog(GgzyBiddingSubject watchdog) {
		this.watchdog = watchdog;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPlancode() {
		return plancode;
	}
	public void setPlancode(String plancode) {
		this.plancode = plancode;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getContractTel() {
		return contractTel;
	}
	public void setContractTel(String contractTel) {
		this.contractTel = contractTel;
	}
	public String getOldProject() {
		return oldProject;
	}
	public void setOldProject(String oldProject) {
		this.oldProject = oldProject;
	}

	/**
	 * @return
	 * @uml.property  name="majorType"
	 */
	public GgzyMajorType getMajorType() {
		return majorType;
	}

	/**
	 * @param majorType
	 * @uml.property  name="majorType"
	 */
	public void setMajorType(GgzyMajorType majorType) {
		this.majorType = majorType;
	}

	/**
	 * @return
	 * @uml.property  name="businessWay"
	 */
	public GgzyBusinessWay getBusinessWay() {
		return businessWay;
	}

	/**
	 * @param businessWay
	 * @uml.property  name="businessWay"
	 */
	public void setBusinessWay(GgzyBusinessWay businessWay) {
		this.businessWay = businessWay;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyNotices"
	 */
	public Set<GgzyNotice> getGgzyNotices() {
		return ggzyNotices;
	}

	/**
	 * @param ggzyNotices
	 * @uml.property  name="ggzyNotices"
	 */
	public void setGgzyNotices(Set<GgzyNotice> ggzyNotices) {
		this.ggzyNotices = ggzyNotices;
	}

	/**
	 * @return
	 * @uml.property  name="ggzyTenderss"
	 */
	public Set<GgzyTenders> getGgzyTenderss() {
		return ggzyTenderss;
	}

	/**
	 * @param ggzyTenderss
	 * @uml.property  name="ggzyTenderss"
	 */
	public void setGgzyTenderss(Set<GgzyTenders> ggzyTenderss) {
		this.ggzyTenderss = ggzyTenderss;
	}

	/**
	 * @return
	 * @uml.property  name="basePro"
	 */
	public GgzyBasePro getBasePro() {
		return basePro;
	}

	/**
	 * @param basePro
	 * @uml.property  name="basePro"
	 */
	public void setBasePro(GgzyBasePro basePro) {
		this.basePro = basePro;
	}

	/**
	 * @return
	 * @uml.property  name="bidProCode"
	 */
	public String getBidProCode() {
		return bidProCode;
	}

	/**
	 * @param bidProCode
	 * @uml.property  name="bidProCode"
	 */
	public void setBidProCode(String bidProCode) {
		this.bidProCode = bidProCode;
	}

	/**
	 * @return
	 * @uml.property  name="bidProName"
	 */
	public String getBidProName() {
		if(this.basePro != null)
			return this.basePro.getProName();
		return this.bidProName;
	}

	/**
	 * @param bidProName
	 * @uml.property  name="bidProName"
	 */
	public void setBidProName(String bidProName) {
		this.bidProName = bidProName;
	}

	/**
	 * @return
	 * @uml.property  name="bidDesc"
	 */
	public DataClob getBidDesc() {
		return bidDesc;
	}

	/**
	 * @param bidDesc
	 * @uml.property  name="bidDesc"
	 */
	public void setBidDesc(DataClob bidDesc) {
		this.bidDesc = bidDesc;
	}


	/**
	 * @return
	 * @uml.property  name="bidForm"
	 */
	public Character getBidForm() {
		return bidForm;
	}

	/**
	 * @param bidForm
	 * @uml.property  name="bidForm"
	 */
	public void setBidForm(Character bidForm) {
		this.bidForm = bidForm;
	}

	/**
	 * @return
	 * @uml.property  name="createTime"
	 */
	public Calendar getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 * @uml.property  name="createTime"
	 */
	public void setCreateTime(Calendar createTime) {
		this.createTime = createTime;
	}


	/**
	 * @return
	 * @uml.property  name="auditDeptCode"
	 */
	public String getAuditDeptCode() {
		return auditDeptCode;
	}

	/**
	 * @param auditDeptCode
	 * @uml.property  name="auditDeptCode"
	 */
	public void setAuditDeptCode(String auditDeptCode) {
		this.auditDeptCode = auditDeptCode;
	}

	/**
	 * @return
	 * @uml.property  name="auditDeptName"
	 */
	public String getAuditDeptName() {
		return auditDeptName;
	}

	/**
	 * @param auditDeptName
	 * @uml.property  name="auditDeptName"
	 */
	public void setAuditDeptName(String auditDeptName) {
		this.auditDeptName = auditDeptName;
	}

	/**
	 * @return
	 * @uml.property  name="platformCode"
	 */
	public String getPlatformCode() {
		return platformCode;
	}

	/**
	 * @param platformCode
	 * @uml.property  name="platformCode"
	 */
	public void setPlatformCode(String platformCode) {
		this.platformCode = platformCode;
	}

	/**
	 * @return
	 * @uml.property  name="declareResponsible"
	 */
	public String getDeclareResponsible() {
		return declareResponsible;
	}

	/**
	 * @param declareResponsible
	 * @uml.property  name="declareResponsible"
	 */
	public void setDeclareResponsible(String declareResponsible) {
		this.declareResponsible = declareResponsible;
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
	 * @uml.property  name="proCode"
	 */
	public String getProCode() {
		return proCode;
	}

	/**
	 * @param proCode
	 * @uml.property  name="proCode"
	 */
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	/**
	 * @return
	 * @uml.property  name="proxyNotarization"
	 */
	public boolean isProxyNotarization() {
		return proxyNotarization;
	}

	/**
	 * @param proxyNotarization
	 * @uml.property  name="proxyNotarization"
	 */
	public void setProxyNotarization(boolean proxyNotarization) {
		this.proxyNotarization = proxyNotarization;
	}

	/**
	 * @return
	 * @uml.property  name="approval"
	 */
	public String getApproval() {
		return approval;
	}

	/**
	 * @param approval
	 * @uml.property  name="approval"
	 */
	public void setApproval(String approval) {
		this.approval = approval;
	}

	/**
	 * @return
	 * @uml.property  name="planLicence"
	 */
	public String getPlanLicence() {
		return planLicence;
	}

	/**
	 * @param planLicence
	 * @uml.property  name="planLicence"
	 */
	public void setPlanLicence(String planLicence) {
		this.planLicence = planLicence;
	}

	/**
	 * @return
	 * @uml.property  name="fileList"
	 */
	public String getFileList() {
		return fileList;
	}

	/**
	 * @param fileList
	 * @uml.property  name="fileList"
	 */
	public void setFileList(String fileList) {
		this.fileList = fileList;
	}

	/**
	 * @return
	 * @uml.property  name="businessType"
	 */
	public GgzyBusinessType getBusinessType() {
		return businessType;
	}

	/**
	 * @param businessType
	 * @uml.property  name="businessType"
	 */
	public void setBusinessType(GgzyBusinessType businessType) {
		this.businessType = businessType;
	}

	/**
	 * @return
	 * @uml.property  name="agency"
	 */
	public GgzyBiddingSubject getAgency() {
		return agency;
	}

	/**
	 * @param agency
	 * @uml.property  name="agency"
	 */
	public void setAgency(GgzyBiddingSubject agency) {
		this.agency = agency;
	}

	/**
	 * @return
	 * @uml.property  name="agencyContacts"
	 */
	public String getAgencyContacts() {
		return agencyContacts;
	}

	/**
	 * @param agencyContacts
	 * @uml.property  name="agencyContacts"
	 */
	public void setAgencyContacts(String agencyContacts) {
		this.agencyContacts = agencyContacts;
	}

	/**
	 * @return
	 * @uml.property  name="agencyTel"
	 */
	public String getAgencyTel() {
		return agencyTel;
	}

	/**
	 * @param agencyTel
	 * @uml.property  name="agencyTel"
	 */
	public void setAgencyTel(String agencyTel) {
		this.agencyTel = agencyTel;
	}

	/**
	 * @return
	 * @uml.property  name="tenderee"
	 */
	public GgzyBiddingSubject getTenderee() {
		return tenderee;
	}

	/**
	 * @param tenderee
	 * @uml.property  name="tenderee"
	 */
	public void setTenderee(GgzyBiddingSubject tenderee) {
		this.tenderee = tenderee;
	}

	/**
	 * @return
	 * @uml.property  name="noticeMaked"
	 *//*
	public boolean isNoticeMaked() {
		return noticeMaked;
	}

	*//**
	 * @param noticeMaked
	 * @uml.property  name="noticeMaked"
	 *//*
	public void setNoticeMaked(boolean noticeMaked) {
		this.noticeMaked = noticeMaked;
	}*/

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyNotices", "ggzyTenderss", "baseProId")
				.toString();
	}

}
