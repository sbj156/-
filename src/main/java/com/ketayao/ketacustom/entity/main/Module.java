/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.entity.main.Module.java
 * Class:			Module
 * Date:			2012-8-2
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/

package com.ketayao.ketacustom.entity.main;

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

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.util.StringUtils;

import com.ketayao.ketacustom.entity.Idable;

/**
 * 
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> Version 1.1.0
 * @since 2012-8-2 下午5:36:39
 */
@Entity
@Table(name = "keta_module")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.ketayao.ketacustom.entity.main.Module")
public class Module implements Comparable<Module>, Idable<Long>, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3978902893187610005L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	@Length(max = 64)
	@Column(length = 64, nullable = false)
	private String name;
	
	/**
	 * 手机端访问时显示名称
	 */
	@Length(max = 64)
	@Column(length = 64)
	private String pdaName;

	/**
	 * 对应的模块全类名
	 */
	@Column(length = 256)
	private String className;

	/**
	 * 模块的入口地址
	 */
	@NotBlank
	@Length(max = 256)
	@Column(length = 256, nullable = false)
	private String url;

	/**
	 * 参数类型是否是json
	 */
	@Column(columnDefinition = "number default 0")
	private boolean jsonParam;
	/**
	 * 链接参数
	 */
	@Column(length = 500)
	private String parameters;

	@Length(max = 256)
	@Column(length = 256)
	private String description;

	/**
	 * 标志符，用于授权名称（类似module:save）
	 */
	@NotBlank
	@Length(max = 32)
	@Column(length = 32, nullable = false, unique = true)
	private String sn;

	/**
	 * 模块的排序号,越小优先级越高
	 */
	@NotNull
	@Range(min = 1, max = 999)
	@Column(length = 3, nullable = false)
	private Integer priority = 999;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parentId")
	private Module parent;

	@OneToMany(mappedBy = "parent", cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@OrderBy("priority ASC")
	private List<Module> children = new ArrayList<Module>();

	/**
	 * 因为hibernate更新使用的是merge方法，会自动新增关联的瞬时对象，如果再次配置CascadeType.MERGE，会插入两条数据。<br/>
	 * 详见我的博客：<a href="ketayao.com">ketayao.com</a>
	 */
	@OneToMany(mappedBy = "module", cascade = { CascadeType.PERSIST, CascadeType.REMOVE }, orphanRemoval = true, fetch = FetchType.LAZY)
	private List<Permission> permissions = new ArrayList<Permission>();

	/**
	 * menu是否显示父节点名称
	 */
	@Column(name = "show_parent")
	private boolean showParent;

	/**
	 * 是否是业务模块
	 */
	@Column(columnDefinition = "number(1) default 0")
	private boolean businessModule;

	/**
	 * 节点显示设备,PC:1,手机:2,PC+手机:3,默认只在PC端显示
	 */
	@Column(columnDefinition = "number(10) default 1")
	private int showDevice;

	public int getShowDevice() {
		return showDevice;
	}
	
	public void setShowDevice(int showDevice) {
		this.showDevice = showDevice;
	}

	public void setShowDevice(int []showDevices) {
		this.showDevice = 0;
		if(showDevices != null){
			for(int show : showDevices)
				this.showDevice += show;
		}
	}

	public boolean isBusinessModule() {
		return businessModule;
	}

	public void setBusinessModule(boolean businessModule) {
		this.businessModule = businessModule;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 返回 name 的值
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置 name 的值
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the className
	 */
	public String getClassName() {
		return className;
	}

	/**
	 * @param className
	 *            the className to set
	 */
	public void setClassName(String className) {
		this.className = className;
	}

	/**
	 * 返回 url 的值
	 * 
	 * @return url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * 设置 url 的值
	 * 
	 * @param url
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 返回 description 的值
	 * 
	 * @return description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 设置 description 的值
	 * 
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 返回 priority 的值
	 * 
	 * @return priority
	 */
	public Integer getPriority() {
		return priority;
	}

	/**
	 * 设置 priority 的值
	 * 
	 * @param priority
	 */
	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	/**
	 * 返回 parent 的值
	 * 
	 * @return parent
	 */
	public Module getParent() {
		return parent;
	}

	/**
	 * 设置 parent 的值
	 * 
	 * @param parent
	 */
	public void setParent(Module parent) {
		this.parent = parent;
	}

	/**
	 * 返回 children 的值
	 * 
	 * @return children
	 */
	public List<Module> getChildren() {
		return children;
	}

	/**
	 * 设置 children 的值
	 * 
	 * @param children
	 */
	public void setChildren(List<Module> children) {
		this.children = children;
	}

	/**
	 * 返回 sn 的值
	 * 
	 * @return sn
	 */
	public String getSn() {
		return sn;
	}

	/**
	 * 设置 sn 的值
	 * 
	 * @param sn
	 */
	public void setSn(String sn) {
		this.sn = sn;
	}

	/**
	 * 返回 permissions 的值
	 * 
	 * @return permissions
	 */
	public List<Permission> getPermissions() {
		return permissions;
	}

	/**
	 * 设置 permissions 的值
	 * 
	 * @param permissions
	 */
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	/*
	 * 
	 */
	@Override
	public int compareTo(Module m) {
		if (m == null) {
			return -1;
		} else if (m == this) {
			return 0;
		} else if (this.priority < m.getPriority()) {
			return -1;
		} else if (this.priority > m.getPriority()) {
			return 1;
		}

		return 0;
	}

	public boolean isJsonParam() {
		return jsonParam;
	}

	public void setJsonParam(boolean jsonParam) {
		this.jsonParam = jsonParam;
	}

	public String getParameters() {
		return parameters;
	}

	public void setParameters(String parameters) {
		this.parameters = parameters;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public boolean isShowParent() {
		return showParent;
	}

	public void setShowParent(boolean showParent) {
		this.showParent = showParent;
	}

	public String getPdaName() {
		if(StringUtils.isEmpty(pdaName))
			return name;
		return pdaName;
	}

	public void setPdaName(String pdaName) {
		this.pdaName = pdaName;
	}
	
	

}
