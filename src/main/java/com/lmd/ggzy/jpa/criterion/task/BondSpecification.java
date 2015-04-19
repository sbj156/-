package com.lmd.ggzy.jpa.criterion.task;

/**
 * 保证金缴退模块暂时不做详细判断,交易中心未确定是否对保证金收取进行管理
 * 1.审核通过的公告(与报名判断条件相同)
 * @author mh_cxp
 *
 */
public class BondSpecification extends ApplySpecification {

	public static final String SPECIFICATION = "bond";

}
