package com.lmd.ggzy.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 业务类型
 * 
 * @author mh_cxp
 */
@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BUSINESS_TYPE")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBusinessTypeMajors", "ggzyBusinessTypeMajors1", "ggzyBusinessTypeWays" })
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyBusinessType")
public class GgzyBusinessType {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4754180386722178390L;

	/**
	 * 父类型,必须为虚类型
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_ID")
	@NotFound(action = NotFoundAction.IGNORE)
	private GgzyBusinessType parent;

	/**
	 * 子类型
	 */
	@OneToMany(mappedBy = "parent", cascade = CascadeType.ALL)
	@OrderBy("sortIndex asc")
	private Set<GgzyBusinessType> children;

	/**
	 * 分配的专业类型
	 */
	@OneToMany(mappedBy = "businessType", cascade = CascadeType.ALL)
	@OrderBy("sortIndex asc")
	private Set<GgzyBusinessTypeMajor> ggzyBusinessTypeMajors;

	/**
	 * 分配的招标方式
	 */
	@OrderBy("sortIndex asc")
	@OneToMany(mappedBy = "businessType", cascade = { CascadeType.REMOVE })
	private Set<GgzyBusinessTypeWay> ggzyBusinessTypeWays;

	/**
	 * 唱标方式
	 */
	@OrderBy("sortIndex asc")
	@OneToMany(mappedBy = "businessType", cascade = { CascadeType.REMOVE })
	private Set<GgzyBusinessTypeOpenningType> openningTypes;
	/**
	 * 名称
	 */
	@Column(name = "NAME", length = 50)
	private String name;

	/**
	 * 代码
	 */
	@Column(name = "CODE", length = 4)
	private String code;

	/**
	 * 排序
	 */
	@Column
	private int sortIndex;

	/**
	 * 是否是虚类型,即实际不存在的业务类型
	 */
	@Column(columnDefinition = "number(1) default 0")
	private Boolean virtualType = false;

	public boolean isVirtualType() {
		return virtualType;
	}

	public void setVirtualType(boolean virtualType) {
		this.virtualType = virtualType;
	}

	public int getSortIndex() {
		return sortIndex;
	}

	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}

	/**
	 * @return
	 * @uml.property name="ggzyBusinessTypeMajors"
	 */
	public Set<GgzyBusinessTypeMajor> getGgzyBusinessTypeMajors() {
		return ggzyBusinessTypeMajors;
	}

	/**
	 * @param ggzyBusinessTypeMajors
	 * @uml.property name="ggzyBusinessTypeMajors"
	 */
	public void setGgzyBusinessTypeMajors(Set<GgzyBusinessTypeMajor> ggzyBusinessTypeMajors) {
		this.ggzyBusinessTypeMajors = ggzyBusinessTypeMajors;
	}

	/**
	 * @return
	 * @uml.property name="ggzyBusinessTypeWays"
	 */
	public Set<GgzyBusinessTypeWay> getGgzyBusinessTypeWays() {
		return ggzyBusinessTypeWays;
	}

	/**
	 * @param ggzyBusinessTypeWays
	 * @uml.property name="ggzyBusinessTypeWays"
	 */
	public void setGgzyBusinessTypeWays(Set<GgzyBusinessTypeWay> ggzyBusinessTypeWays) {
		this.ggzyBusinessTypeWays = ggzyBusinessTypeWays;
	}

	/**
	 * @return
	 * @uml.property name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property name="code"
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code
	 * @uml.property name="code"
	 */
	public void setCode(String code) {
		this.code = code;
	}

	public Set<GgzyBusinessTypeOpenningType> getOpenningTypes() {
		return openningTypes;
	}

	public void setOpenningTypes(Set<GgzyBusinessTypeOpenningType> openningTypes) {
		this.openningTypes = openningTypes;
	}

	public GgzyBusinessType getParent() {
		return parent;
	}

	public void setParent(GgzyBusinessType parent) {
		this.parent = parent;
	}

	public Set<GgzyBusinessType> getChildren() {
		return children;
	}

	public void setChildren(Set<GgzyBusinessType> children) {
		this.children = children;
	}

	public String toString() {
		return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("ggzyBusinessTypeMajors", "ggzyBusinessTypeMajors1", "ggzyBusinessTypeWays").toString();
	}

	public static class VirtualSpecification implements Specification<GgzyBusinessType> {
		private boolean isVirtual;
		public VirtualSpecification(boolean isVirtual){
			this.isVirtual = isVirtual;
		}
		@Override
		public Predicate toPredicate(Root<GgzyBusinessType> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
			// TODO Auto-generated method stub
			query.where(cb.equal(root.get("virtualType"), isVirtual));
			query.orderBy(cb.asc(root.get("sortIndex").as(Integer.class)));
			return query.getRestriction();
		}
	}
	public static VirtualSpecification virtual = new VirtualSpecification(true);
	public static VirtualSpecification notVirtual = new VirtualSpecification(false);
}
