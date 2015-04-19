package com.lmd.ggzy.domain;
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

import com.ketayao.ketacustom.entity.main.User;
import com.lmd.ggzy.domain.data.DataClob;

/**
 * @author  mh_cxp
 * 审核结果
 */
@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_AUDIT_RES")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyAuditRes")
public class GgzyAuditRes  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7447876569618854828L;

	/**
	 * 是否审核通过
	 * @uml.property  name="pass"
	 */
	@Column
	private Boolean pass;
	
	/**
	 * 审核人
	 * @uml.property  name="auditUser"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="AUDIT_USER")
	private User auditUser;
	
	/**
	 * 审核意见
	 * @uml.property  name="comment"
	 * @uml.associationEnd  
	 */
	@OneToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="AUDIT_COMMENT")
	private DataClob comment;
	/**
	 * 审核时间
	 * @uml.property  name="auditTime"
	 */
	@Column(name = "AUDIT_TIME", columnDefinition="timestamp default systimestamp")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM", pattern="yyyy-MM-dd HH:mm:ss")
	private Calendar auditTime;
	
	/**
	 * 审核内容类型,如公告,公示
	 * @uml.property  name="type"
	 */
	@Column
	private Integer type;
	
	/**
	 * 关联表的主键
	 * @uml.property  name="auditTabPk"
	 */
	@Column(name="AUDIT_TAB_PK", columnDefinition="CHAR(32)")
	private String auditTabPk;

	/**
	 * @return
	 * @uml.property  name="pass"
	 */
	public Boolean getPass() {
		return pass;
	}

	/**
	 * @param pass
	 * @uml.property  name="pass"
	 */
	public void setPass(Boolean pass) {
		this.pass = pass;
	}

	/**
	 * @return
	 * @uml.property  name="auditUser"
	 */
	public User getAuditUser() {
		return auditUser;
	}

	/**
	 * @param auditUser
	 * @uml.property  name="auditUser"
	 */
	public void setAuditUser(User auditUser) {
		this.auditUser = auditUser;
	}

	/**
	 * @return
	 * @uml.property  name="comment"
	 */
	public DataClob getComment() {
		return comment;
	}

	/**
	 * @param comment
	 * @uml.property  name="comment"
	 */
	public void setComment(DataClob comment) {
		this.comment = comment;
	}

	/**
	 * @return
	 * @uml.property  name="auditTime"
	 */
	public Calendar getAuditTime() {
		return auditTime;
	}

	/**
	 * @param auditTime
	 * @uml.property  name="auditTime"
	 */
	public void setAuditTime(Calendar auditTime) {
		this.auditTime = auditTime;
	}

	/**
	 * @return
	 * @uml.property  name="type"
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type
	 * @uml.property  name="type"
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return
	 * @uml.property  name="auditTabPk"
	 */
	public String getAuditTabPk() {
		return auditTabPk;
	}

	/**
	 * @param auditTabPk
	 * @uml.property  name="auditTabPk"
	 */
	public void setAuditTabPk(String auditTabPk) {
		this.auditTabPk = auditTabPk;
	}
	
}
