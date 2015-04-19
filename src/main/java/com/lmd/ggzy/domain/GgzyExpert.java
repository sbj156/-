package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
import org.springframework.roo.addon.tostring.RooToString;

import com.lmd.ggzy.domain.data.DataClob;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_EXPERT")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyExpert")
public class GgzyExpert  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7335425747054326118L;

	/**
	 * 专家编号10位公共服务平台识别码,1位专家库在公共服务平台中的顺序号,6位顺序号
	 * @uml.property  name="expertNum"
	 */
	@Column(length = 17)
	private String expertNum;

	/**
	 * 姓名
	 * @uml.property  name="name"
	 */
	@Column(length = 100)
	private String name;

	/**
	 * GB/T2261.1-2003性别代码
	 * @uml.property  name="sex"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sex")
	private GgzyTreeLib sex;

	/**
	 * 身份证件类型
	 * @uml.property  name="idType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID_TYPE")
	private GgzyTreeLib idType;

	/**
	 * 身份证件号码
	 * @uml.property  name="idCode"
	 */
	@Column(length = 18)
	private String idCode;

	/**
	 * 出生日期
	 * @uml.property  name="birthday"
	 */
	@Column(name = "birthday")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd")
	private Calendar birthday;

	/**
	 * 所在行政区域
	 * @uml.property  name="adminArea"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ADMIN_AREA")
	private GgzyTreeLib adminArea;

	/**
	 * 最后毕业院校
	 * @uml.property  name="finallyCollege"
	 */
	@Column(length = 100)
	private String finallyCollege;

	/**
	 * 最高学历
	 * @uml.property  name="topQualification"
	 */
	@Column(length = 30)
	private String topQualification;

	/**
	 * 联系电话
	 * @uml.property  name="tel"
	 */
	@Column(length = 100)
	private String tel;

	/**
	 * 联系地址
	 * @uml.property  name="contactAddress"
	 */
	@Column(length = 100)
	private String contactAddress;

	/**
	 * 邮政编码
	 * @uml.property  name="zipCode"
	 */
	@Column(length = 6)
	private String zipCode;

	/**
	 * 所在单位名称
	 * @uml.property  name="unitsName"
	 */
	@Column(length = 100)
	private String unitsName;

	/**
	 * 是否在职
	 * @uml.property  name="workStatus"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "WORK_STATUS")
	private GgzyTreeLib workStatus;

	/**
	 * 职务
	 * @uml.property  name="job"
	 */
	@Column(length = 50)
	private String job;

	/**
	 * 工作简历
	 * @uml.property  name="workResume"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch = FetchType.LAZY, cascade={CascadeType.ALL})
	@JoinColumn(name = "WORK_RESUME")
	private DataClob workResume;

	/**
	 * 专业分类,评标专家专业分类标准(试行)
	 * @uml.property  name="majorType"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MAJOR_TYPE")
	private GgzyTreeLib majorType;

	/**
	 * 技术职称
	 * @uml.property  name="technicalTitles"
	 */
	@Column(length = 50)
	private String technicalTitles;

	/**
	 * 职业资格序列
	 * @uml.property  name="nvq"
	 */
	@Column(length = 50)
	private String nvq;

	/**
	 * 职业资格等级
	 * @uml.property  name="nvqLevel"
	 */
	@Column(length = 50)
	private String nvqLevel;

	/**
	 * 从业年限
	 * @uml.property  name="entirePeriod"
	 */
	@Column(precision = 2)
	private Integer entirePeriod;

	/**
	 * @return
	 * @uml.property  name="expertNum"
	 */
	public String getExpertNum() {
		return expertNum;
	}

	/**
	 * @param expertNum
	 * @uml.property  name="expertNum"
	 */
	public void setExpertNum(String expertNum) {
		this.expertNum = expertNum;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="sex"
	 */
	public GgzyTreeLib getSex() {
		return sex;
	}

	/**
	 * @param sex
	 * @uml.property  name="sex"
	 */
	public void setSex(GgzyTreeLib sex) {
		this.sex = sex;
	}

	/**
	 * @return
	 * @uml.property  name="idType"
	 */
	public GgzyTreeLib getIdType() {
		return idType;
	}

	/**
	 * @param idType
	 * @uml.property  name="idType"
	 */
	public void setIdType(GgzyTreeLib idType) {
		this.idType = idType;
	}

	/**
	 * @return
	 * @uml.property  name="idCode"
	 */
	public String getIdCode() {
		return idCode;
	}

	/**
	 * @param idCode
	 * @uml.property  name="idCode"
	 */
	public void setIdCode(String idCode) {
		this.idCode = idCode;
	}

	/**
	 * @return
	 * @uml.property  name="birthday"
	 */
	public Calendar getBirthday() {
		return birthday;
	}

	/**
	 * @param birthday
	 * @uml.property  name="birthday"
	 */
	public void setBirthday(Calendar birthday) {
		this.birthday = birthday;
	}

	/**
	 * @return
	 * @uml.property  name="adminArea"
	 */
	public GgzyTreeLib getAdminArea() {
		return adminArea;
	}

	/**
	 * @param adminArea
	 * @uml.property  name="adminArea"
	 */
	public void setAdminArea(GgzyTreeLib adminArea) {
		this.adminArea = adminArea;
	}

	/**
	 * @return
	 * @uml.property  name="finallyCollege"
	 */
	public String getFinallyCollege() {
		return finallyCollege;
	}

	/**
	 * @param finallyCollege
	 * @uml.property  name="finallyCollege"
	 */
	public void setFinallyCollege(String finallyCollege) {
		this.finallyCollege = finallyCollege;
	}

	/**
	 * @return
	 * @uml.property  name="topQualification"
	 */
	public String getTopQualification() {
		return topQualification;
	}

	/**
	 * @param topQualification
	 * @uml.property  name="topQualification"
	 */
	public void setTopQualification(String topQualification) {
		this.topQualification = topQualification;
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
	 * @uml.property  name="contactAddress"
	 */
	public String getContactAddress() {
		return contactAddress;
	}

	/**
	 * @param contactAddress
	 * @uml.property  name="contactAddress"
	 */
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	/**
	 * @return
	 * @uml.property  name="zipCode"
	 */
	public String getZipCode() {
		return zipCode;
	}

	/**
	 * @param zipCode
	 * @uml.property  name="zipCode"
	 */
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	/**
	 * @return
	 * @uml.property  name="unitsName"
	 */
	public String getUnitsName() {
		return unitsName;
	}

	/**
	 * @param unitsName
	 * @uml.property  name="unitsName"
	 */
	public void setUnitsName(String unitsName) {
		this.unitsName = unitsName;
	}

	/**
	 * @return
	 * @uml.property  name="workStatus"
	 */
	public GgzyTreeLib getWorkStatus() {
		return workStatus;
	}

	/**
	 * @param workStatus
	 * @uml.property  name="workStatus"
	 */
	public void setWorkStatus(GgzyTreeLib workStatus) {
		this.workStatus = workStatus;
	}

	/**
	 * @return
	 * @uml.property  name="job"
	 */
	public String getJob() {
		return job;
	}

	/**
	 * @param job
	 * @uml.property  name="job"
	 */
	public void setJob(String job) {
		this.job = job;
	}

	/**
	 * @return
	 * @uml.property  name="workResume"
	 */
	public DataClob getWorkResume() {
		return workResume;
	}

	/**
	 * @param workResume
	 * @uml.property  name="workResume"
	 */
	public void setWorkResume(DataClob workResume) {
		this.workResume = workResume;
	}

	/**
	 * @return
	 * @uml.property  name="majorType"
	 */
	public GgzyTreeLib getMajorType() {
		return majorType;
	}

	/**
	 * @param majorType
	 * @uml.property  name="majorType"
	 */
	public void setMajorType(GgzyTreeLib majorType) {
		this.majorType = majorType;
	}

	/**
	 * @return
	 * @uml.property  name="technicalTitles"
	 */
	public String getTechnicalTitles() {
		return technicalTitles;
	}

	/**
	 * @param technicalTitles
	 * @uml.property  name="technicalTitles"
	 */
	public void setTechnicalTitles(String technicalTitles) {
		this.technicalTitles = technicalTitles;
	}

	/**
	 * @return
	 * @uml.property  name="nvq"
	 */
	public String getNvq() {
		return nvq;
	}

	/**
	 * @param nvq
	 * @uml.property  name="nvq"
	 */
	public void setNvq(String nvq) {
		this.nvq = nvq;
	}

	/**
	 * @return
	 * @uml.property  name="nvqLevel"
	 */
	public String getNvqLevel() {
		return nvqLevel;
	}

	/**
	 * @param nvqLevel
	 * @uml.property  name="nvqLevel"
	 */
	public void setNvqLevel(String nvqLevel) {
		this.nvqLevel = nvqLevel;
	}

	/**
	 * @return
	 * @uml.property  name="entirePeriod"
	 */
	public Integer getEntirePeriod() {
		return entirePeriod;
	}

	/**
	 * @param entirePeriod
	 * @uml.property  name="entirePeriod"
	 */
	public void setEntirePeriod(Integer entirePeriod) {
		this.entirePeriod = entirePeriod;
	}

}
