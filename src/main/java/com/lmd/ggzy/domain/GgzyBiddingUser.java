/**
 * 
 */
package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.ketayao.ketacustom.entity.main.User;

/**用户与招投标主体的关联关系
 * @author mh_cxp
 *
 */
@RooJavaBean
@RooToString
@RooJson
@RooJpaEntity(table = "GGZY_BIDDING_USER")
@Entity
@Table(name = "GGZY_BIDDING_USER")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyBiddingUser")
public class GgzyBiddingUser {

	@Id
	@GenericGenerator(name = "fk", strategy = "foreign", parameters = {@Parameter(name = "property", value = "user")})
	@GeneratedValue(generator = "fk")
	private Long id;
	
	@PrimaryKeyJoinColumn
	@OneToOne(fetch = FetchType.LAZY, optional = false)
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SUBJECT_ID")
	private GgzyBiddingSubject biddingSubject;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public GgzyBiddingSubject getBiddingSubject() {
		return biddingSubject;
	}

	public void setBiddingSubject(GgzyBiddingSubject biddingSubject) {
		this.biddingSubject = biddingSubject;
	}
	
	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
