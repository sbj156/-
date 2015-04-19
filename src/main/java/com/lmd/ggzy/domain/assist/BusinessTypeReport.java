package com.lmd.ggzy.domain.assist;

import java.math.BigDecimal;

import com.lmd.ggzy.domain.GgzyBusinessType;
/**
 * 记录周报,月报中,没类业务交易的标段数量,成交金额
 * @author mh_cxp
 *
 */
public class BusinessTypeReport implements Comparable<BusinessTypeReport>{
	/**
	 * 业务类型
	 */
	private GgzyBusinessType businessType;
	/**
	 * 数量
	 */
	private int count;
	/**
	 * 成交额
	 */
	private BigDecimal price = BigDecimal.ZERO;

	public BusinessTypeReport(GgzyBusinessType businessType, int count, BigDecimal price) {
		super();
		this.businessType = businessType;
		this.count = count;
		this.price = price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void addCount() {
		this.count++;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void addPrice(BigDecimal price) {
		this.price = this.price.add(price);
	}

	public GgzyBusinessType getBusinessType() {
		return businessType;
	}

	@Override
	public int compareTo(BusinessTypeReport o) {
		// TODO Auto-generated method stub
		return this.getBusinessType().getSortIndex() -(o.getBusinessType().getSortIndex());
	}

}