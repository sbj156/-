// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package test.com.lmd.ggzy.domain;

import javax.persistence.Column;

import test.com.lmd.ggzy.domain.GgzyBasePro;


privileged aspect GgzyBasePro_Roo_DbManaged {
    
    
    @Column(name = "PRO_CODE", length = 17)
    private String GgzyBasePro.proCode;
    
    @Column(name = "PRO_NAME", length = 200)
    private String GgzyBasePro.proName;
    
    
    @Column(name = "PRO_ADDRESS", length = 200)
    private String GgzyBasePro.proAddress;
    
    @Column(name = "LEGAL_PERSON", length = 100)
    private String GgzyBasePro.legalPerson;
    
    @Column(name = "INDUSTRY_TYPE", length = 3)
    private String GgzyBasePro.industryType;
    
    @Column(name = "CAPTICAL_SOURCE", length = 1000)
    private String GgzyBasePro.capticalSource;
    
    @Column(name = "PRO_SCAL", length = 1000)
    private String GgzyBasePro.proScal;
    
    @Column(name = "CONTACT_PERSON", length = 100)
    private String GgzyBasePro.contactPerson;
    
    @Column(name = "CONTACT_WAY", length = 100)
    private String GgzyBasePro.contactWay;
    
    
    public String GgzyBasePro.getProCode() {
        return proCode;
    }
    
    public void GgzyBasePro.setProCode(String proCode) {
        this.proCode = proCode;
    }
    
    public String GgzyBasePro.getProName() {
        return proName;
    }
    
    public void GgzyBasePro.setProName(String proName) {
        this.proName = proName;
    }
    
    
    public String GgzyBasePro.getProAddress() {
        return proAddress;
    }
    
    public void GgzyBasePro.setProAddress(String proAddress) {
        this.proAddress = proAddress;
    }
    
    public String GgzyBasePro.getLegalPerson() {
        return legalPerson;
    }
    
    public void GgzyBasePro.setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }
    
    public String GgzyBasePro.getIndustryType() {
        return industryType;
    }
    
    public void GgzyBasePro.setIndustryType(String industryType) {
        this.industryType = industryType;
    }
    
    public String GgzyBasePro.getCapticalSource() {
        return capticalSource;
    }
    
    public void GgzyBasePro.setCapticalSource(String capticalSource) {
        this.capticalSource = capticalSource;
    }
    
    public String GgzyBasePro.getProScal() {
        return proScal;
    }
    
    public void GgzyBasePro.setProScal(String proScal) {
        this.proScal = proScal;
    }
    
    public String GgzyBasePro.getContactPerson() {
        return contactPerson;
    }
    
    public void GgzyBasePro.setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }
    
    public String GgzyBasePro.getContactWay() {
        return contactWay;
    }
    
    public void GgzyBasePro.setContactWay(String contactWay) {
        this.contactWay = contactWay;
    }
    
}
