// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.lmd.ggzy.domain.pk.GgzyExpertScorePk;

privileged aspect GgzyExpertScore_Roo_Jpa_Entity {

	declare @type: GgzyExpertScore: @Entity;

	declare @type: GgzyExpertScore: @Table(name = "GGZY_EXPERT_SCORE");

	@EmbeddedId
	private GgzyExpertScorePk GgzyExpertScore.id = new GgzyExpertScorePk();

	public GgzyExpertScorePk GgzyExpertScore.getId() {
		return this.id;
	}

	public void GgzyExpertScore.setId(GgzyExpertScorePk id) {
		this.id = id;
	}

	
}
