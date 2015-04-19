package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.aspectj.weaver.patterns.Declare;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;

/**
 * 联合体企业信息
 * @author zjt
 *
 */
@Table(name = "GGZY_COMBO_COMPANY")
@Entity
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_COMBO_COMPANY")
@RooDbManaged(automaticallyDelete = true)
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyComboCompany")
public class GgzyComboCompany {

    
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "COMBO_COMPANY_ID", length = 32)
    private String comboCompanyId;
    
    
	
	public String getComboCompanyId() {
		return comboCompanyId;
	}
	public void setComboCompanyId(String comboCompanyId) {
		this.comboCompanyId = comboCompanyId;
	}

	/**
	 * 联合体企业信息
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BIDDING_SUBJECT_ID", referencedColumnName = "BIDDING_SUBJECT_ID")
	private GgzyBiddingSubject biddingSubject;

	/**
	 * 联合体对应报名信息
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLY_ID" ,referencedColumnName = "APPLY_ID")
	private GgzyApply apply;
	
	

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
	
	
	public GgzyBiddingSubject getBiddingSubject() {
		return biddingSubject;
	}
	public void setBiddingSubject(GgzyBiddingSubject biddingSubject) {
		this.biddingSubject = biddingSubject;
	}
	public GgzyApply getApply() {
		return apply;
	}
	public void setApply(GgzyApply apply) {
		this.apply = apply;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).toString();
	}
}
