package com.lmd.ggzy.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.lmd.ggzy.domain.GgzyAttachment;

@RooJpaRepository(domainType = GgzyAttachment.class)
public interface GgzyAttachmentRepository {
	
}
