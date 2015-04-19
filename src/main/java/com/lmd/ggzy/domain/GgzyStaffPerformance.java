package com.lmd.ggzy.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;


@RooJavaBean
@RooJpaEntity(versionField="",table="GGZY_STAFF_PERFORMANCE")
@RooDbManaged(automaticallyDelete=true)
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage=CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region="com.lmd.ggzy.domain.GgzyStaffPerformance")
public class GgzyStaffPerformance {

	/**
	 * @uml.property  name="ggzyLiteracy"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name="LITERACY_ID",referencedColumnName="LITERACY_ID")
	private GgzyLiteracy ggzyLiteracy;
	
	/**
	 * @uml.property  name="ggzyTenders"
	 * @uml.associationEnd  
	 */
	@ManyToOne
	@JoinColumn(name="TENDERS_ID",referencedColumnName="TENDERS_ID")
	private GgzyTenders ggzyTenders;
	
	
	
	
	
}
