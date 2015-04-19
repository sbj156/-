package com.lmd.spring.task;


public interface JcmsInfoBuilder<T> {

	/**
	 *  根据info对象构建同步信息
	 * @param info 
	 * @param businessCode 区分同步信息的业务类型,不同业务类型构建的同步信息可能不同
	 * @return
	 */
	public String buildInfo(T info, String businessCode) throws Exception;
}
