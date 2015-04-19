package com.lmd.ggzy.domain;

import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_LITERACY_PERFORMANCE")
@RooDbManaged(automaticallyDelete = true)
@RooJson
public class GgzyLiteracyPerformance {

	@ManyToOne
	@JoinColumn(name = "LITERACY_ID", referencedColumnName = "LITERACY_ID")
	private GgzyLiteracy ggzyLiteracy;
	
	@Column(name="CONTRACT_AMOUNT",length=2)
	private BigDecimal contractAmount;
	
	@Column(name="SETTLEMENT_AMOUNT",length=2)
	private BigDecimal settlementAmount;
	
	@Column(name="CURRENCY_CODE_AMOUNT",length=3)
	private String currencyCodeAmount;
	
	@Column(name="MONETARY_UNIT",length=1)
	private  String  monetaryUnit;
	
	@Column(name="CONTRACY_SINGING_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd")
	private Calendar contractSigningTime;
	
	@Column(name="CONTRACT_COMPLETION_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd")
	private Calendar contractCompletionTime;

	public GgzyLiteracy getGgzyLiteracy() {
		return ggzyLiteracy;
	}

	public void setGgzyLiteracy(GgzyLiteracy ggzyLiteracy) {
		this.ggzyLiteracy = ggzyLiteracy;
	}

	public BigDecimal getContractAmount() {
		return contractAmount;
	}

	public void setContractAmount(BigDecimal contractAmount) {
		this.contractAmount = contractAmount;
	}

	public BigDecimal getSettlementAmount() {
		return settlementAmount;
	}

	public void setSettlementAmount(BigDecimal settlementAmount) {
		this.settlementAmount = settlementAmount;
	}

	public String getCurrencyCodeAmount() {
		return currencyCodeAmount;
	}

	public void setCurrencyCodeAmount(String currencyCodeAmount) {
		this.currencyCodeAmount = currencyCodeAmount;
	}

	public String getMonetaryUnit() {
		return monetaryUnit;
	}

	public void setMonetaryUnit(String monetaryUnit) {
		this.monetaryUnit = monetaryUnit;
	}

	

	public Calendar getContractSigningTime() {
		return contractSigningTime;
	}

	public void setContractSigningTime(Calendar contractSigningTime) {
		this.contractSigningTime = contractSigningTime;
	}

	public Calendar getContractCompletionTime() {
		return contractCompletionTime;
	}

	public void setContractCompletionTime(Calendar contractCompletionTime) {
		this.contractCompletionTime = contractCompletionTime;
	}

	@Override
	public String toString() {
		return "GgzyLiteracyPerformance [ggzyLiteracy=" + ggzyLiteracy
				+ ", contractAmount=" + contractAmount + ", settlementAmount="
				+ settlementAmount + ", currencyCodeAmount="
				+ currencyCodeAmount + ", monetaryUnit=" + monetaryUnit
				+ ", contractSigningTime=" + contractSigningTime
				+ ", contractCompletionTime=" + contractCompletionTime + "]";
	}


	
}
