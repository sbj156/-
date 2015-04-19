package com.lmd.ggzy.service;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.ketayao.ketacustom.util.dwz.Page;
import com.lmd.ggzy.domain.GgzyBidPro;
import com.lmd.ggzy.domain.GgzyTreeLib;

/**
 * @author  mh_cxp
 */
public interface GgzyTreeLibService  extends BaseService<GgzyTreeLib>{
	GgzyTreeLib get(Long id);

	void saveOrUpdate(GgzyTreeLib area);

	void delete(Long id);
	
	List<GgzyTreeLib> findAll(Page page);
	
//	List<GgzyTreeLib> findByExample(Specification<GgzyTreeLib> specification, Page page);

	GgzyTreeLib getByName(String name);
	
	/**
	 * @uml.property  name="tree"
	 * @uml.associationEnd  
	 */
	GgzyTreeLib getTree();

	GgzyTreeLib getTree(Long id);
}
