package com.lmd.ggzy.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import com.ketayao.ketacustom.entity.Idable;

/**
 * @author  	<a href="mailto:ketayao@gmail.com">ketayao</a>  Version  1.1.0
 * @since    2012-8-27 下午3:25:15
 */
@Entity
@Table(name = "GGZY_TREELIB")
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyTreeLib")
public class GgzyTreeLib implements Comparable<GgzyTreeLib>, Idable<Long> ,Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7081532725987877820L;

	/**
	 * @uml.property  name="id"
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	/**
	 * @uml.property  name="name"
	 */
	@NotBlank
	@Length(max=64)
	@Column(length=64, nullable=false, unique=true)
	private String name;
	
	/**
	 * 越小优先级越高
	 * @uml.property  name="priority"
	 */
	@NotNull
	@Range(min=1, max=999)
	@Column(length=3, nullable=false)
	private Integer priority = 999;
	
	/**
	 * @uml.property  name="description"
	 */
	@Length(max=256)
	@Column(length=256)
	private String description;

	/**
	 * @uml.property  name="parent"
	 * @uml.associationEnd  
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parentId")
	private GgzyTreeLib parent;
	
	/**
	 * @uml.property  name="children"
	 * @uml.associationEnd  multiplicity="(0 -1)" inverse="parent:com.lmd.ggzy.domain.GgzyTreeLib"
	 */
	@OneToMany(mappedBy="parent", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, fetch=FetchType.LAZY)
	@OrderBy("priority ASC, id asc")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private List<GgzyTreeLib> children = new ArrayList<GgzyTreeLib>();
	
	/*@OneToMany(mappedBy="area", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, orphanRemoval=true)
	private List<GgzyBasePro> pros = new ArrayList<GgzyBasePro>();*/
	
	/**
	 * @uml.property  name="code"
	 */
	@Column(name="code", length=20)
	private String code;
	
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 返回 name 的值   
	 * @return  name
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置 name 的值  
	 * @param  name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * @return  the priority
	 * @uml.property  name="priority"
	 */
	public Integer getPriority() {
		return priority;
	}

	/**
	 * @param priority  the priority to set
	 * @uml.property  name="priority"
	 */
	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	/**
	 * 返回 description 的值   
	 * @return  description
	 * @uml.property  name="description"
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置 description 的值  
	 * @param  description
	 * @uml.property  name="description"
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 返回 parent 的值   
	 * @return  parent
	 * @uml.property  name="parent"
	 */
	public GgzyTreeLib getParent() {
		return parent;
	}

	/**
	 * 设置 parent 的值  
	 * @param  parent
	 * @uml.property  name="parent"
	 */
	public void setParent(GgzyTreeLib parent) {
		this.parent = parent;
	}

	/**
	 * 返回 children 的值   
	 * @return  children
	 * @uml.property  name="children"
	 */
	public List<GgzyTreeLib> getChildren() {
		return children;
	}

	/**
	 * 设置 children 的值  
	 * @param  children
	 * @uml.property  name="children"
	 */
	public void setChildren(List<GgzyTreeLib> children) {
		this.children = children;
	}

	/*
	 * 
	 */
	@Override
	public int compareTo(GgzyTreeLib org) {
		if (org == null) {
			return -1;
		} else if (org == this) {
			return 0;
		} else if (this.priority < org.getPriority()) {
			return -1;
		} else if (this.priority > org.getPriority()) {
			return 1;
		}

		return 0;	
	}

	@Override
	public String toString() {
		return new ReflectionToStringBuilder(this,
				ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames(
				"parent", "children").toString();
	}
	/**
	 * @return
	 * @uml.property  name="code"
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code
	 * @uml.property  name="code"
	 */
	public void setCode(String code) {
		this.code = code;
	}

}
