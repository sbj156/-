package com.lmd.ggzy.domain;
import java.math.BigDecimal;
import java.util.Calendar;
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

/**
 * @author  mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BIDDING_SUBJECT")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyApplies", "ggzyQualifications", "subjectPerformances" })
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyBiddingSubject")
public class GgzyBiddingSubject  {
	 
    /**
	 * 
	 */
	private static final long serialVersionUID = -3480610074030699173L;

    /**
	 * @uml.property  name="ggzyQualifications"
	 */
    @OneToMany(mappedBy = "biddingSubject", cascade = { CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY)
    private Set<GgzyQualification> ggzyQualifications;
    
    /**
	 * @uml.property  name="subjectPerformances"
	 */
    @OneToMany(mappedBy = "biddingSubject", cascade = { CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY)
    private Set<SubjectPerformance> subjectPerformances;
    
    /**
	 * @uml.property  name="organizationCode"
	 */
    @Column(name = "ORGANIZATION_CODE", length = 9)
    private String organizationCode;
    
    /**
	 * @uml.property  name="subjectName"
	 */
    @Column(name = "SUBJECT_NAME", length = 100)
    private String subjectName;
    
    /**
	 * @uml.property  name="subjectCharge"
	 */
    @Column(name = "SUBJECT_CHARGE", length = 100)
    private String subjectCharge;
    
    /**
	 * @uml.property  name="country"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "COUNTRY", referencedColumnName="ID")
    private GgzyTreeLib country;
    
    /**
	 * @uml.property  name="unitCharacter"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UNIT_CHARACTER", referencedColumnName="ID")
    private GgzyTreeLib unitCharacter;
    
    /**
	 * @uml.property  name="adminAreaCode"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ADMIN_AREA_CODE", referencedColumnName="ID")
    private GgzyTreeLib adminAreaCode;
    
    /**
	 * @uml.property  name="industryCode"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "INDUSTRY_CODE", referencedColumnName="ID")
    private GgzyTreeLib industryCode;
    
    /**
	 * @uml.property  name="businessLicenseCode"
	 */
    @Column(name = "BUSINESS_LICENSE_CODE", length = 50)
    private String businessLicenseCode;
    
    /**
	 * @uml.property  name="caCode"
	 */
    @Column(name = "CA_CODE", length = 50)
    private String caCode;
    
    /**
	 * @uml.property  name="taxCode"
	 */
    @Column(name = "TAX_CODE", length = 50)
    private String taxCode;
    
    /**
	 * @uml.property  name="creditLevel"
	 */
    @Column(name = "CREDIT_LEVEL", length = 50)
    private String creditLevel;
    
    /**
	 * @uml.property  name="accountBank"
	 */
    @Column(name = "ACCOUNT_BANK", length = 100)
    private String accountBank;
    
    /**
	 * @uml.property  name="accountNumber"
	 */
    @Column(name = "ACCOUNT_NUMBER", length = 50)
    private String accountNumber;
    
    /**
	 * @uml.property  name="registeredCapital"
	 */
    @Column(name = "REGISTERED_CAPITAL", precision = 20, scale = 2)
    private BigDecimal registeredCapital;
    
    /**
	 * @uml.property  name="registeredCapitalCurrency"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "REGISTERED_CAPITAL_CURRENCY", referencedColumnName="ID")
    private GgzyTreeLib registeredCapitalCurrency;
    
    /**
	 * @uml.property  name="registeredCapitalUnit"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "REGISTERED_CAPITAL_UNIT", referencedColumnName="ID")
    private GgzyTreeLib registeredCapitalUnit;
    
    /**
	 * @uml.property  name="subjectType"
	 * @uml.associationEnd  
	 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "SUBJECT_TYPE", referencedColumnName="ID")
    private GgzyTreeLib subjectType;
    
    /**
	 * @uml.property  name="infoDeclarant"
	 */
    @Column(name = "INFO_DECLARANT", length = 100)
    private String infoDeclarant;
    
    /**
	 * @uml.property  name="contactTel"
	 */
    @Column(name = "CONTACT_TEL", length = 100)
    private String contactTel;
    
    /**
	 * @uml.property  name="contactAddress"
	 */
    @Column(name = "CONTACT_ADDRESS", length = 100)
    private String contactAddress;
    
    /**
	 * @uml.property  name="zipCode"
	 */
    @Column(name = "ZIP_CODE", length = 6)
    private String zipCode;
    
    /**
	 * @uml.property  name="eMail"
	 */
    @Column(name = "E_MAIL", length = 100)
    private String eMail;
    
    /**
	 * @uml.property  name="platformVerifier"
	 */
    @Column(name = "PLATFORM_VERIFIER", length = 100)
    private String platformVerifier;
    
    /**
	 * @uml.property  name="verifyTime"
	 */
    @Column(name = "VERIFY_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-", pattern="yyyy-MM-dd")
    private Calendar verifyTime;
    
    /**
	 * @return
	 * @uml.property  name="ggzyQualifications"
	 */
    public Set<GgzyQualification> getGgzyQualifications() {
        return ggzyQualifications;
    }
    
    /**
	 * @param ggzyQualifications
	 * @uml.property  name="ggzyQualifications"
	 */
    public void setGgzyQualifications(Set<GgzyQualification> ggzyQualifications) {
        this.ggzyQualifications = ggzyQualifications;
    }
    
    /**
	 * @return
	 * @uml.property  name="subjectPerformances"
	 */
    public Set<SubjectPerformance> getSubjectPerformances() {
        return subjectPerformances;
    }
    
    /**
	 * @param subjectPerformances
	 * @uml.property  name="subjectPerformances"
	 */
    public void setSubjectPerformances(Set<SubjectPerformance> subjectPerformances) {
        this.subjectPerformances = subjectPerformances;
    }
    
    /**
	 * @return
	 * @uml.property  name="organizationCode"
	 */
    public String getOrganizationCode() {
        return organizationCode;
    }
    
    /**
	 * @param organizationCode
	 * @uml.property  name="organizationCode"
	 */
    public void setOrganizationCode(String organizationCode) {
    	if(organizationCode != null)
    		organizationCode = organizationCode.replaceAll("-", "");
        this.organizationCode = organizationCode;
    }
    
    /**
	 * @return
	 * @uml.property  name="subjectName"
	 */
    public String getSubjectName() {
        return subjectName;
    }
    
    /**
	 * @param subjectName
	 * @uml.property  name="subjectName"
	 */
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    /**
	 * @return
	 * @uml.property  name="subjectCharge"
	 */
    public String getSubjectCharge() {
        return subjectCharge;
    }
    
    /**
	 * @param subjectCharge
	 * @uml.property  name="subjectCharge"
	 */
    public void setSubjectCharge(String subjectCharge) {
        this.subjectCharge = subjectCharge;
    }
    
    /**
	 * @return
	 * @uml.property  name="businessLicenseCode"
	 */
    public String getBusinessLicenseCode() {
        return businessLicenseCode;
    }
    
    /**
	 * @param businessLicenseCode
	 * @uml.property  name="businessLicenseCode"
	 */
    public void setBusinessLicenseCode(String businessLicenseCode) {
        this.businessLicenseCode = businessLicenseCode;
    }
    
    /**
	 * @return
	 * @uml.property  name="caCode"
	 */
    public String getCaCode() {
        return caCode;
    }
    
    /**
	 * @param caCode
	 * @uml.property  name="caCode"
	 */
    public void setCaCode(String caCode) {
        this.caCode = caCode;
    }
    
    /**
	 * @return
	 * @uml.property  name="taxCode"
	 */
    public String getTaxCode() {
        return taxCode;
    }
    
    /**
	 * @param taxCode
	 * @uml.property  name="taxCode"
	 */
    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }
    
    /**
	 * @return
	 * @uml.property  name="creditLevel"
	 */
    public String getCreditLevel() {
        return creditLevel;
    }
    
    /**
	 * @param creditLevel
	 * @uml.property  name="creditLevel"
	 */
    public void setCreditLevel(String creditLevel) {
        this.creditLevel = creditLevel;
    }
    
    /**
	 * @return
	 * @uml.property  name="accountBank"
	 */
    public String getAccountBank() {
        return accountBank;
    }
    
    /**
	 * @param accountBank
	 * @uml.property  name="accountBank"
	 */
    public void setAccountBank(String accountBank) {
        this.accountBank = accountBank;
    }
    
    /**
	 * @return
	 * @uml.property  name="accountNumber"
	 */
    public String getAccountNumber() {
        return accountNumber;
    }
    
    /**
	 * @param accountNumber
	 * @uml.property  name="accountNumber"
	 */
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    
    /**
	 * @return
	 * @uml.property  name="registeredCapital"
	 */
    public BigDecimal getRegisteredCapital() {
        return registeredCapital;
    }
    
    /**
	 * @param registeredCapital
	 * @uml.property  name="registeredCapital"
	 */
    public void setRegisteredCapital(BigDecimal registeredCapital) {
        this.registeredCapital = registeredCapital;
    }
    
    /**
	 * @return
	 * @uml.property  name="country"
	 */
    public GgzyTreeLib getCountry() {
		return country;
	}

	/**
	 * @param country
	 * @uml.property  name="country"
	 */
	public void setCountry(GgzyTreeLib country) {
		this.country = country;
	}

	/**
	 * @return
	 * @uml.property  name="unitCharacter"
	 */
	public GgzyTreeLib getUnitCharacter() {
		return unitCharacter;
	}

	/**
	 * @param unitCharacter
	 * @uml.property  name="unitCharacter"
	 */
	public void setUnitCharacter(GgzyTreeLib unitCharacter) {
		this.unitCharacter = unitCharacter;
	}

	/**
	 * @return
	 * @uml.property  name="adminAreaCode"
	 */
	public GgzyTreeLib getAdminAreaCode() {
		return adminAreaCode;
	}

	/**
	 * @param adminAreaCode
	 * @uml.property  name="adminAreaCode"
	 */
	public void setAdminAreaCode(GgzyTreeLib adminAreaCode) {
		this.adminAreaCode = adminAreaCode;
	}

	/**
	 * @return
	 * @uml.property  name="industryCode"
	 */
	public GgzyTreeLib getIndustryCode() {
		return industryCode;
	}

	/**
	 * @param industryCode
	 * @uml.property  name="industryCode"
	 */
	public void setIndustryCode(GgzyTreeLib industryCode) {
		this.industryCode = industryCode;
	}

	/**
	 * @return
	 * @uml.property  name="registeredCapitalCurrency"
	 */
	public GgzyTreeLib getRegisteredCapitalCurrency() {
		return registeredCapitalCurrency;
	}

	/**
	 * @param registeredCapitalCurrency
	 * @uml.property  name="registeredCapitalCurrency"
	 */
	public void setRegisteredCapitalCurrency(GgzyTreeLib registeredCapitalCurrency) {
		this.registeredCapitalCurrency = registeredCapitalCurrency;
	}

	/**
	 * @return
	 * @uml.property  name="registeredCapitalUnit"
	 */
	public GgzyTreeLib getRegisteredCapitalUnit() {
		return registeredCapitalUnit;
	}

	/**
	 * @param registeredCapitalUnit
	 * @uml.property  name="registeredCapitalUnit"
	 */
	public void setRegisteredCapitalUnit(GgzyTreeLib registeredCapitalUnit) {
		this.registeredCapitalUnit = registeredCapitalUnit;
	}

	/**
	 * @return
	 * @uml.property  name="eMail"
	 */
	public String geteMail() {
		return eMail;
	}

	/**
	 * @param eMail
	 * @uml.property  name="eMail"
	 */
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	/**
	 * @return
	 * @uml.property  name="infoDeclarant"
	 */
	public String getInfoDeclarant() {
        return infoDeclarant;
    }
    
    /**
	 * @param infoDeclarant
	 * @uml.property  name="infoDeclarant"
	 */
    public void setInfoDeclarant(String infoDeclarant) {
        this.infoDeclarant = infoDeclarant;
    }
    
    /**
	 * @return
	 * @uml.property  name="contactTel"
	 */
    public String getContactTel() {
        return contactTel;
    }
    
    /**
	 * @param contactTel
	 * @uml.property  name="contactTel"
	 */
    public void setContactTel(String contactTel) {
        this.contactTel = contactTel;
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
    
    public String getEMail() {
        return eMail;
    }
    
    public void setEMail(String eMail) {
        this.eMail = eMail;
    }
    
    /**
	 * @return
	 * @uml.property  name="subjectType"
	 */
    public GgzyTreeLib getSubjectType() {
		return subjectType;
	}

	/**
	 * @param subjectType
	 * @uml.property  name="subjectType"
	 */
	public void setSubjectType(GgzyTreeLib subjectType) {
		this.subjectType = subjectType;
	}

	/**
	 * @return
	 * @uml.property  name="platformVerifier"
	 */
	public String getPlatformVerifier() {
        return platformVerifier;
    }
    
    /**
	 * @param platformVerifier
	 * @uml.property  name="platformVerifier"
	 */
    public void setPlatformVerifier(String platformVerifier) {
        this.platformVerifier = platformVerifier;
    }
    
    /**
	 * @return
	 * @uml.property  name="verifyTime"
	 */
    public Calendar getVerifyTime() {
        return verifyTime;
    }
    
    /**
	 * @param verifyTime
	 * @uml.property  name="verifyTime"
	 */
    public void setVerifyTime(Calendar verifyTime) {
        this.verifyTime = verifyTime;
    }
    
    public String toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyApplies", "ggzyQualifications", "subjectPerformances").toString();
    }
}
