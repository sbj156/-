package com.lmd.ggzy.domain;

import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
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

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

/**
 * 报名信息表
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_APPLY")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyApplyTenders", "biddingSubjectId"})
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyApply", include="non-lazy")
public class GgzyApply {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2692933816789902527L;

	/**
	 * 报名标段关系
	 */
	@OneToMany(mappedBy = "apply", cascade = { CascadeType.PERSIST,
			CascadeType.REMOVE }, fetch = FetchType.LAZY)
	private Set<GgzyApplyTender> ggzyApplyTenders;

	
	
	/**
	 * 保证金交纳记录
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE }, mappedBy = "apply")
	private List<GgzyBondRecord> bondRecord;
	
	/**
	 * 联合体企业信息
	 */
	@OneToMany(fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE ,CascadeType.PERSIST}, mappedBy = "apply")
	private List<GgzyComboCompany> comboCompany;
	public List<GgzyComboCompany> getComboCompany() {
		return comboCompany;
	}

	public void setComboCompany(List<GgzyComboCompany> comboCompany) {
		this.comboCompany = comboCompany;
	}

	/**
	 * 报名企业 
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BIDDING_SUBJECT_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject biddingSubject;

	/**
	 * 
	 * 报名信息依据公告
	 * 
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID")
	private GgzyNotice notice;
	
	/**
	 * 报名时间
	 */
	@Column(name = "APPLY_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar applyTime;

	/**
	 * 签到时间
	 */
	@Column(name = "SIGN_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
	private Calendar signTime;

	/**
	 * 联系人
	 * @uml.property  name="contact"
	 */
	@Column
	private String contact;
	/**
	 * 联系电话
	 * @uml.property  name="tel"
	 */
	@Column
	private String tel;
	/**
	 * 报名操作人
	 * @uml.property  name="operator"
	 */
	@Column
	private String operator;

	/**
	 * 是否为联合体主体
	 */
	@Column(columnDefinition = "number(1) default 0")
	private Boolean isMain;
	
	public Boolean getIsMain() {
		return isMain;
	}

	public void setIsMain(Boolean isMain) {
		this.isMain = isMain;
	}

	/**
	 * 是否是正式投标人,默认是,资格预审项目报名时为false
	 */
	@Column(columnDefinition = "number(1) default 1")
	private Boolean official; 
	
	
	public Boolean getOfficial() {
		return official;
	}

	public void setOfficial(Boolean official) {
		this.official = official;
	}

	public GgzyBondRecord getBondRecord() {
		return CollectionUtils.isEmpty(bondRecord)? null: bondRecord.get(0) ;
	}

	public void setBondRecord(GgzyBondRecord bondRecord) {
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
	 * @uml.property  name="ggzyApplyTenders"
	 */
	public Set<GgzyApplyTender> getGgzyApplyTenders() {
		return ggzyApplyTenders;
	}

	/**
	 * @param ggzyApplyTenders
	 * @uml.property  name="ggzyApplyTenders"
	 */
	public void setGgzyApplyTenders(Set<GgzyApplyTender> ggzyApplyTenders) {
		this.ggzyApplyTenders = ggzyApplyTenders;
	}

	/**
	 * @return
	 * @uml.property  name="biddingSubject"
	 */
	public GgzyBiddingSubject getBiddingSubject() {
		return biddingSubject;
	}

	/**
	 * @param biddingSubject
	 * @uml.property  name="biddingSubject"
	 */
	public void setBiddingSubject(GgzyBiddingSubject biddingSubject) {
		this.biddingSubject = biddingSubject;
	}

	/**
	 * @return
	 * @uml.property  name="applyTime"
	 */
	public Calendar getApplyTime() {
		return applyTime;
	}

	/**
	 * @param applyTime
	 * @uml.property  name="applyTime"
	 */
	public void setApplyTime(Calendar applyTime) {
		this.applyTime = applyTime;
	}

	/**
	 * @return
	 * @uml.property  name="signTime"
	 */
	public Calendar getSignTime() {
		return signTime;
	}

	/**
	 * @param signTime
	 * @uml.property  name="signTime"
	 */
	public void setSignTime(Calendar signTime) {
		this.signTime = signTime;
	}

	public String toJson() {
		return new JSONSerializer().exclude("*.class").serialize(this);
	}

	public String toJson(String[] fields) {
		return new JSONSerializer().include(fields).exclude("*.class")
				.serialize(this);
	}

	public static GgzyApply fromJsonToGgzyApply(String json) {
		return new JSONDeserializer<GgzyApply>().use(null, GgzyApply.class)
				.deserialize(json);
	}

	public static String toJsonArray(Collection<GgzyApply> collection) {
		return new JSONSerializer().exclude("*.class").serialize(collection);
	}

	public static String toJsonArray(Collection<GgzyApply> collection,
			String[] fields) {
		return new JSONSerializer().include(fields).exclude("*.class")
				.serialize(collection);
	}

	public static Collection<GgzyApply> fromJsonArrayToGgzyApplys(String json) {
		return new JSONDeserializer<List<GgzyApply>>().use("values",
				GgzyApply.class).deserialize(json);
	}

	/**
	 * @return
	 * @uml.property  name="contact"
	 */
	public String getContact() {
		return contact;
	}

	/**
	 * @param contact
	 * @uml.property  name="contact"
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

	/**
	 * @return
	 * @uml.property  name="tel"
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @param tel
	 * @uml.property  name="tel"
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @return
	 * @uml.property  name="operator"
	 */
	public String getOperator() {
		return operator;
	}

	/**
	 * @param operator
	 * @uml.property  name="operator"
	 */
	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"ggzyApplyTenders", "biddingSubjectId").toString();
	}
}
