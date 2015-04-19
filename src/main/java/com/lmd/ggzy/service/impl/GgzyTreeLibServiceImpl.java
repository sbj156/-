package com.lmd.ggzy.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ketayao.ketacustom.exception.NotDeletedException;
import com.ketayao.ketacustom.exception.NotExistedException;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.dwz.PageUtils;
import com.lmd.ggzy.domain.GgzyTreeLib;
import com.lmd.ggzy.repository.GgzyBaseProRepository;
import com.lmd.ggzy.repository.GgzyTreeLibRepository;
import com.lmd.ggzy.service.GgzyTreeLibService;
@Service
@Transactional
public class GgzyTreeLibServiceImpl extends BaseServiceImpl<GgzyTreeLib> implements GgzyTreeLibService {
	
	/**
	 * @uml.property  name="areaRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyTreeLibRepository areaRepository;
	
	/**
	 * @uml.property  name="baseProRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBaseProRepository baseProRepository;

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#get(java.lang.Long)  
	 */ 
	@Override
	public GgzyTreeLib get(Long id) {
		return areaRepository.findOne(id);
	}
	
	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#getByName(java.lang.String)
	 */
	@Override
	public GgzyTreeLib getByName(String name) {
		return areaRepository.getByName(name);
	}

	/*
	 * (non-Javadoc) 
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#saveOrUpdate(com.ketayao.ketacustom.entity.main.GgzyArea)  
	 */
	@Override
	public void saveOrUpdate(GgzyTreeLib GgzyArea) {
		if (GgzyArea.getId() == null) {
			GgzyTreeLib parentGgzyArea = areaRepository.findOne(GgzyArea.getParent().getId());
			if (parentGgzyArea == null) {
				throw new NotExistedException("id=" + GgzyArea.getParent().getId() + "父组织不存在！");
			}
			
			if (areaRepository.getByNameAndParentId(GgzyArea.getName(), GgzyArea.getParent().getId()) != null) {
				throw new NotExistedException(GgzyArea.getName() + "已存在！");
			}
		}
		
		areaRepository.save(GgzyArea);
	}

	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#delete(java.lang.Long)  
	 */
	@Override
	public void delete(Long id) {
		if (isRoot(id)) {
			throw new NotDeletedException("不允许删除根组织。");
		}
		
		GgzyTreeLib GgzyArea = this.get(id);
		
		//先判断是否存在子模块，如果存在子模块，则不允许删除
		if(GgzyArea.getChildren().size() > 0){
			throw new NotDeletedException(GgzyArea.getName() + "组织下存在子组织，不允许删除。");
		}
		
		if (baseProRepository.findByAreaId(id).size() > 0) {
			throw new NotDeletedException(GgzyArea.getName() + "组织下存在用户，不允许删除。");
		}
		
		areaRepository.delete(GgzyArea);
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#findAll(com.ketayao.ketacustom.util.dwz.Page)  
	 */
	@Override
	public List<GgzyTreeLib> findAll(Page page) {
		org.springframework.data.domain.Page<GgzyTreeLib> springDataPage = areaRepository.findAll(PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#findByExample(org.springframework.data.jpa.domain.Specification, com.ketayao.ketacustom.util.dwz.Page)	
	 */
	@Override
	public List<GgzyTreeLib> findByExample(
			Specification<GgzyTreeLib> specification, Page page) {
		org.springframework.data.domain.Page<GgzyTreeLib> springDataPage = areaRepository.findAll(specification, PageUtils.createPageable(page));
		page.setTotalCount(springDataPage.getTotalElements());
		return springDataPage.getContent();
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.service.GgzyAreaService#getTree()
	 */
	@Override
	public GgzyTreeLib getTree() {
		List<GgzyTreeLib> list = areaRepository.findAllWithCache();
		List<GgzyTreeLib> rootList = makeTree(list);
				
		return rootList.get(0);
	}
	@Override
	public GgzyTreeLib getTree(Long id){
		if(id != null)
			return areaRepository.findOne(id);
		else 
			return getTree();
	}
	
	/**
	 * 判断是否是根组织.
	 */
	private boolean isRoot(Long id) {
		return id == 1;
	}
	
	private List<GgzyTreeLib> makeTree(List<GgzyTreeLib> list) {
		List<GgzyTreeLib> parent = new ArrayList<GgzyTreeLib>();
		// get parentId = null;
		for (GgzyTreeLib e : list) {
			if (e.getParent() == null) {
				e.setChildren(new ArrayList<GgzyTreeLib>(0));
				parent.add(e);
			}
		}
		// 删除parentId = null;
		list.removeAll(parent);
		
		makeChildren(parent, list);
		
		return parent;
	}
	
	private void makeChildren(List<GgzyTreeLib> parent, List<GgzyTreeLib> children) {
		if (children.isEmpty()) {
			return ;
		}
		
		List<GgzyTreeLib> tmp = new ArrayList<GgzyTreeLib>();
		for (GgzyTreeLib c1 : parent) {
			for (GgzyTreeLib c2 : children) {
				c2.setChildren(new ArrayList<GgzyTreeLib>(0));
				if (c1.getId().equals(c2.getParent().getId())) {
					c1.getChildren().add(c2);
					tmp.add(c2);
				}
			}
		}
		
		children.removeAll(tmp);
		
		makeChildren(tmp, children);
	}
}
