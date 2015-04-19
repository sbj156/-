package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 与其他系统同步信息
 * 
 * @author mh_cxp
 * 
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_SYNC_INFO")
@RooDbManaged(automaticallyDelete = true)
@RooToString()
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name = "GGZY_SYNC_INFO")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.SyncInfo")
public class SyncInfo {

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid")
	@GeneratedValue(generator = "uuid")
	@Column(name = "PERFORMANCE_ID", length = 32)
	private String id;

	/**
	 * 同步目标系统
	 */
	@Column(length = 100)
	private String targetSystem;
	/**
	 * 同步信息的类型
	 */
	@Column(length = 100)
	private String syncType;

	/**
	 * 同步类的serialVersionUID
	 */
	@Column
	private long syncSerialVersionUID;
	/**
	 * 同步信息主键
	 */
	@Column(length = 32)
	private String pk;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTargetSystem() {
		return targetSystem;
	}

	public void setTargetSystem(String targetSystem) {
		this.targetSystem = targetSystem;
	}

	public String getSyncType() {
		return syncType;
	}

	public void setSyncType(String syncType) {
		this.syncType = syncType;
	}

	public long getSyncSerialVersionUID() {
		return syncSerialVersionUID;
	}

	public void setSyncSerialVersionUID(long syncSerialVersionUID) {
		this.syncSerialVersionUID = syncSerialVersionUID;
	}

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}
}
